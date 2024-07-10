#
# This file is part of the GROMACS molecular simulation package.
#
# Copyright 2019- The GROMACS Authors
# and the project initiators Erik Lindahl, Berk Hess and David van der Spoel.
# Consult the AUTHORS/COPYING files and https://www.gromacs.org for details.
#
# GROMACS is free software; you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public License
# as published by the Free Software Foundation; either version 2.1
# of the License, or (at your option) any later version.
#
# GROMACS is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public
# License along with GROMACS; if not, see
# https://www.gnu.org/licenses, or write to the Free Software Foundation,
# Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA.
#
# If you want to redistribute modifications to GROMACS, please
# consider that scientific software is very special. Version
# control is crucial - bugs must be traceable. We will be happy to
# consider code for inclusion in the official distribution, but
# derived work must not be called official GROMACS. Details are found
# in the README & COPYING files - if they are missing, get the
# official version at https://www.gromacs.org.
#
# To help us fund GROMACS development, we humbly ask that you cite
# the research papers on the package. Check out https://www.gromacs.org.

"""mdrun operation module

The mdrun operation (in its first draft) conforms to the user-level API, but does
not use the Python Context resource manager. It uses either the legacy 0.0.7
Context or its own Context, also implemented in this module.
"""

__all__ = ["mdrun", "SimulationError"]

import hashlib
import inspect
import os
import typing
import warnings
from contextlib import contextmanager
from enum import Enum
from pathlib import Path
from typing import Union

import gmxapi
import gmxapi.abc
import gmxapi.operation as _op
from gmxapi import exceptions
from gmxapi import logger as root_logger
from gmxapi.runtime import scoped_resources, ResourceAssignment

from . import fileio
from . import workflow
from .abc import ModuleObject

# Initialize module-level logger
logger = root_logger.getChild("mdrun")
logger.info("Importing {}".format(__name__))

# Output in the gmxapi.operation Context.
# TODO: Consider using a single base class for the DataProxy, but have distinct
#  data descriptor behavior (or different descriptor implementations in different
#  subclasses) so that static code inspection can more easily determine the
#  attributes of the data proxies.
_output_descriptors = (
    _op.OutputDataDescriptor("directory", str),
    _op.OutputDataDescriptor("checkpoint", str),
    _op.OutputDataDescriptor("parameters", dict),
    _op.OutputDataDescriptor("stderr", str),
    _op.OutputDataDescriptor("stdout", str),
    _op.OutputDataDescriptor("trajectory", str),
)
_publishing_descriptors = {
    desc._name: gmxapi.operation.Publisher(desc._name, desc._dtype)
    for desc in _output_descriptors
}
_output = _op.OutputCollectionDescription(
    **{descriptor._name: descriptor._dtype for descriptor in _output_descriptors}
)


class FD(Enum):
    """Enumerate the canonical posix file descriptors for stdio.

    This provides a reference for use with subprocesses or called code,
    since pytest or other calling code may have already manipulated the
    file descriptors associated with Python's `sys` module.
    """

    STDOUT = 1
    STDERR = 2
    # Provide a type hint for the *value* property.
    value: int


@contextmanager
def redirect_stdio(fd: FD, path: Union[str, Path, os.PathLike]):
    """Temporarily redirect the indicated file descriptor to the indicated file.

    *path* is opened for (appended) writing for the scope of the context manager.
    The indicated file descriptor is duplicated, then replaced with that of
    the opened *path*. On exiting the context manager, *path* is closed, *fd*
    is restored to its original value, and the duplicate is closed.

    Note:
        `contextlib.redirect_stdout`, etc., only works for Python calls that
        already support indirection because they ultimately use the `sys`
        module attributes.
    """
    fd_backup = os.dup(fd.value)
    try:
        with open(path, "a") as fh:
            yield os.dup2(fh.fileno(), fd.value)
    finally:
        os.dup2(fd_backup, fd.value)
        os.close(fd_backup)


class OutputDataProxy(_op.DataProxyBase, descriptors=_output_descriptors):
    """Implement the 'output' attribute of `mdrun` operations.

    Attributes:
        checkpoint (str): Full path to ``cpt`` file.
        directory (str): Full path to the working directory in which the simulation ran.
        parameters (dict): Dictionary of parameters with which the simulation was run.
        stderr (str): Full path to the text file that captured stderr during the simulation.
        stdout (str): Full path to the text file that captured stdout during the simulation.
        trajectory (str): Full path to trajectory output (corresponding to the ``-o``
            flag, if provided).

    Notes:
        For multi-rank MPI-enabled simulators, *stderr* and *stdout* are reported
        for the root rank only, in line with how |Gromacs| behaves.

    .. versionchanged:: 0.4

        Added *directory* output, replacing an earlier "hidden" *_work_dir* output.

    .. versionadded:: 0.4

        *stderr* and *stdout* provide paths to the captured standard I/O.
        Previously, a lot of output from the underlying library bypassed Python
        and went straight to the standard output and standard error of the
        calling process.

    """


class PublishingDataProxy(_op.DataProxyBase, descriptors=_publishing_descriptors):
    """Manage output resource updates for MDRun operation."""


_output_factory = _op.OutputFactory(
    output_proxy=OutputDataProxy,
    output_description=_output,
    publishing_data_proxy=PublishingDataProxy,
)

# Input in the gmxapi.operation Context for the dispatching runner.
# The default empty dictionary for parameters just means that there are no overrides
# to the parameters already provided in _simulation_input.
_input = _op.InputCollectionDescription(
    [
        (
            "_simulation_input",
            inspect.Parameter(
                "_simulation_input",
                inspect.Parameter.POSITIONAL_OR_KEYWORD,
                annotation=str,
            ),
        ),
        (
            "parameters",
            inspect.Parameter(
                "parameters",
                inspect.Parameter.POSITIONAL_OR_KEYWORD,
                annotation=dict,
                default=dict(),
            ),
        ),
        (
            "runtime_args",
            inspect.Parameter(
                "runtime_args",
                inspect.Parameter.POSITIONAL_OR_KEYWORD,
                annotation=dict,
                default=dict(),
            ),
        ),
    ]
)


def _standard_node_resource_factory(*args, **kwargs) -> _op.DataSourceCollection:
    """Translate Python UI input to the gmxapi.operation node builder inputs."""
    source_collection = _input.bind(*args, **kwargs)
    logger.info("mdrun input bound as source collection {}".format(source_collection))
    return source_collection


class SimulationError(exceptions.Error):
    """Error occurred during simulation."""


class LegacyImplementationSubscription(object):
    """Input type representing a subscription to the 0.0.7 implementation.

    This class provides the input parameter type for the gmxapi.mdrun run time
    resource builder. However, the mdrun operation was never fully ported from
    gmxapi 0.0.x to 0.x.

    The current gmxapi.mdrun implementation is mostly a wrapper for the 0.0.7
    implementation. The actual simulation work is performed in this overloaded
    resource factory.

    The gmxapi.mdrun input resource can be created from the standard data of
    the simulation module. The actual simulation work is performed while
    preparing this input resource so that the gmxapi.mdrun operation itself
    merely publishes the results produced here.

    See Also:
        * :issue:`3145`
        * :issue:`3147`
        * :issue:`4079`

    """

    ensemble_rank: typing.Optional[int] = None
    """Member index of the simulation within an ensemble.
    
    The ensemble communicator rank (of the root simulator rank) determines the
    ensemble_rank of all ranks in a simulator.

    Only the first MPI rank of each Simulator is allowed to talk to the other
    Simulators on the ensemble communicator, but it is convenient to use this
    identifier to group all resources associated with a simulation ensemble member.
    
    *ensemble_rank* is either the ensemble member ID or None.
    """

    workdir: typing.List[str]  # Simulation working directories.
    parameters: typing.List[dict]  # MDP dictionaries.
    runtime_args: typing.List[dict]  # CLI args passed as gmxapi 0.0.7 work params.

    def __init__(self, resource_manager: _op.ResourceManager):
        # Avoid importing C++ extension modules until they are clearly needed.
        from .context import Context as LegacyContext
        import gmxapi._gmxapi as _gmxapi
        from mpi4py.MPI import Comm as mpi4py_Comm

        self._gmxapi = _gmxapi

        assert isinstance(resource_manager, _op.ResourceManager)
        # We use several details of the gmxapi.operation.Context.ResourceManager.
        # These dependencies can evolve into the subscription protocol between Contexts.

        # Configure and run a gmxapi 0.0.7 session.
        # 0. Determine ensemble width.
        # 1. Choose, create/check working directories.
        # 2. Create source TPR.
        # 2.5 Update runtime arguments.
        # 3. Create workspec.
        # 3.5 Add plugin potentials, if any.
        # 4. Run.
        # 5. Collect outputs from context (including plugin outputs) and be ready to publish them.

        # Determine ensemble width
        ensemble_width = resource_manager.ensemble_width

        # Choose working directories
        # TODO: operation working directory naming scheme should be centrally well-defined.
        # Note that workflow.WorkSpec.uid is currently dependent on the input file parameter,
        # so we cannot create the input file path in the working directory based on WorkSpec.uid.
        workdir_list = [
            "{node}_{member}".format(node=resource_manager.operation_id, member=member)
            for member in range(ensemble_width)
        ]
        # Define container references of appropriate type for later MPI calls.
        parameters_dict_list = [{}] * ensemble_width
        runtime_args_list = [{}] * ensemble_width
        tpr_filenames = [""] * ensemble_width

        # This is a reasonable place to start using MPI ensemble implementation details.
        # We will want better abstraction in the future, but it is best if related filesystem
        # accesses occur from the same processes, consistently. Note that we already
        # handle some optimization and dependency reduction when the ensemble size is 1.
        # TODO: multithread and multiprocess alternatives to MPI ensemble management.

        # TODO: Consider the allowable hierarchy of resource allocation and assignment.
        # The way that chained simulations are originally implemented, this code will be
        # reentered due to resource_manager.local_input() below. We end up creating
        # multiple coexisting and overlapping subcommunicators, and only the inherent
        # serialization of the input resolution prevents CPUs from being oversubscribed
        # at run time.
        base_context = gmxapi.runtime.BaseContext.instance()
        # Derive resources for the simulation task directly from the base resources.
        base_comm = base_context.communicator()
        assert isinstance(base_comm, mpi4py_Comm)
        base_rank = base_comm.Get_rank()

        # Get resources for the entire ensemble of tasks (the session).
        # Each simulator gets an MPI communicator for the ranks it can use.
        # Additionally, some ensemble simulations are coupled parallel tasks,
        # requiring one rank each in a session-wide communicator. We want an
        # identifier for each ensemble scope, but to make it useful as an MPI_Split
        # color we convert the operation_id string to a 16-bit integer node_id.
        # We don't currently have a specification for
        # identifying which simulations do or do not require the ensemble communicator,
        # so we just make one available to all simulations.
        node_id = int.from_bytes(
            hashlib.md5(resource_manager.operation_id.encode("utf8")).digest(),
            byteorder="little",
            signed=False,
        ) % int(2**16)
        communicator_requirements = tuple(
            {"ensemble_comm": node_id, "subtask_comm": True}
            for _ in range(ensemble_width)
        )
        requirements = gmxapi.runtime.ResourceRequirements(
            communication=communicator_requirements
        )
        with scoped_resources(
            base_context, requirements=requirements
        ) as session_resources:
            assert isinstance(session_resources, ResourceAssignment)
            # If a rank participates in the work, it will have a non-null task communicator.
            # The root rank of each task communicator will also have an ensemble communicator.
            # The ensemble member ID of each participating process is the ensemble communicator rank
            # of the root rank of its task communicator.
            # However, to avoid unnecessary MPI communication, we have stashed this information in
            # the ResourceAssignment.
            simulator_comm: mpi4py_Comm = session_resources.communicator()
            _current_rank_participates = bool(simulator_comm)
            if _current_rank_participates:
                self.ensemble_rank = session_resources.subtask_id()
                assert self.ensemble_rank < ensemble_width

            source_file, parameters, runtime_args = None, None, None
            # For the interim subscription system between MPI ranks, to synchronize
            # ResourceManager.update_output() calls, `local_input` needs to be called
            # on *all* ranks once for each member (participating rank).
            for ensemble_member in range(ensemble_width):
                with resource_manager.local_input(member=ensemble_member) as input_pack:
                    if ensemble_member == self.ensemble_rank:
                        source_file = input_pack.kwargs["_simulation_input"]
                        parameters = input_pack.kwargs["parameters"]
                        runtime_args = input_pack.kwargs["runtime_args"]
                        # If there are any other key word arguments to process from the
                        # gmxapi.mdrun factory call, do it here.

            if _current_rank_participates:
                # TODO: This should be a richer object that includes at least host information
                #  and preferably the full gmxapi Future interface.
                workdir = os.path.abspath(workdir_list[self.ensemble_rank])

                # TODO: We should really name this file with a useful input-dependent tag.
                tprfile = os.path.join(workdir, "topol.tpr")

                expected_working_files = [tprfile]

                if session_resources.is_subtask_root():
                    if os.path.exists(workdir):
                        if not os.path.isdir(workdir):
                            raise exceptions.ApiError(
                                f"Chosen working directory path exists but is not a directory: {workdir}"
                            )
                        # Confirm that this is a restarted simulation.
                        # It is unspecified by the API, but at least through gmxapi 0.1,
                        # all simulations are initialized with a checkpoint file named state.cpt
                        # (see src/api/cpp/context.cpp)
                        checkpoint_file = runtime_args.get("-cpi", "state.cpt")
                        if not os.path.isabs(checkpoint_file):
                            checkpoint_file = os.path.join(workdir, checkpoint_file)
                        expected_working_files.append(checkpoint_file)

                        for file in expected_working_files:
                            if not os.path.exists(file):
                                logger.error(
                                    f"Expected file {file} not found. gmxapi.mdrun task "
                                    f"{resource_manager.operation_id} is in an unknown state. Aborting."
                                )
                                raise exceptions.ApiError(
                                    f"Cannot determine working directory state: {workdir}"
                                )
                    else:
                        # Build the working directory and input files.
                        os.mkdir(workdir)
                        sim_input = fileio.read_tpr(source_file)
                        # TODO(#3295): insertion point for updated positions and velocities.
                        for key, value in parameters.items():
                            try:
                                sim_input.parameters.set(key=key, value=value)
                            except _gmxapi.Exception as e:
                                raise exceptions.ApiError(
                                    "Bug encountered. Unknown error when trying to set simulation "
                                    "parameter {} to {}".format(key, value)
                                ) from e

                        fileio.write_tpr_file(output=tprfile, input=sim_input)
                        logger.info("Created {} on rank {}".format(tprfile, base_rank))

                # When the workflow is using dynamically generated / temporary
                # directories, there may be path elements that are created
                # differently on different ranks. This should not generally matter
                # to us because filesystem I/O is confined to the root rank of
                # each simulator. However, consistency is important for two reasons.
                # 1. Results (which include absolute paths) should be consistently reported.
                # 2. The gmxapi 0.0.7 representation of ensemble work is decoupled from
                #    the resource assignment, and all participating processes receive a
                #    complete representation that is assumed to be consistent across members.
                # Also, debugging is a lot easier if log messages and local variables are
                # consistent across processes.

                # Gather the actual outputs from the ensemble members,
                # then share to participating processes.
                ensemble_comm = session_resources.ensemble_communicator()
                if ensemble_comm:
                    # We should not assume that abspath expands the same on different MPI ranks.
                    # Let each simulation master rank determine its own working directory, etc,
                    # report to the root rank of the parent communicator, then broadcast
                    # to all interpreter processes for consistent results.
                    workdir_list = ensemble_comm.allgather(workdir)
                    tpr_filenames = ensemble_comm.allgather(tprfile)
                    parameters = fileio.read_tpr(tprfile).parameters.extract()
                    parameters_dict_list = ensemble_comm.allgather(parameters)
                    runtime_args_list = ensemble_comm.allgather(runtime_args)
                    for _data in (
                        workdir_list,
                        tpr_filenames,
                        parameters_dict_list,
                        runtime_args_list,
                    ):
                        assert len(_data) == ensemble_width

                workdir_list = simulator_comm.bcast(workdir_list)
                tpr_filenames = simulator_comm.bcast(tpr_filenames)
                parameters_dict_list = simulator_comm.bcast(parameters_dict_list)
                runtime_args_list = simulator_comm.bcast(runtime_args_list)
                for _data in (
                    workdir_list,
                    tpr_filenames,
                    parameters_dict_list,
                    runtime_args_list,
                ):
                    assert len(_data) == ensemble_width

                logger.debug(
                    "Context rank {} acknowledges working directories {}".format(
                        base_rank, workdir_list
                    )
                )
                workdir = workdir_list[self.ensemble_rank]
                logger.debug(
                    "Operation {}:{} will use {}".format(
                        resource_manager.operation_id, self.ensemble_rank, workdir
                    )
                )
                if hasattr(resource_manager, "mdrun_kwargs"):
                    warnings.warn(
                        DeprecationWarning(
                            "Ignoring ResourceManager.mdrun_kwargs attribute. "
                            "Provide runtime arguments to mdrun with the *runtime_args* kwarg."
                        )
                    )
                # TODO(#3718): Normalize the way we pass run time parameters to mdrun.
                kwargs = runtime_args_list[self.ensemble_rank].copy()
                for key, value in runtime_args.items():
                    logger.debug(
                        "Adding mdrun run time argument from user input: {}".format(
                            key + "=" + str(value)
                        )
                    )
                # Note that this violates the traditional gmxapi assumption that all ranks see the same
                # instructions. The "md_sim" element of the gmxapi 0.0.7 workspec ends up being unique
                # to the rank that sees it.
                work = workflow.from_tpr(tpr_filenames, **kwargs)
                self.workspec = work.workspec
                # TODO(#3145): Attach extension code, if any.

                # Go ahead and execute immediately. No need for lazy initialization in this basic case.
                context = LegacyContext(
                    work=self.workspec,
                    workdir_list=workdir_list,
                    resources=session_resources,
                )
                self.simulation_module_context = context
                # Note: The redirection of stdout and stderr here is a workaround (#4541) for
                # inflexible output handling in libgromacs. A better solution would be to use a
                # logging facility instead of assuming terminal I/O in the core library, or at
                # least to set and use file descriptors managed through the output_env or program_context,
                # but, as of resolution of #4541, there are no near term plans to make such changes.
                # See also #1505, #2585, #2999, #3015, #3035
                outfile = "stdout.txt"
                errfile = "stderr.txt"
                if session_resources.subtask_rank() != 0:
                    outfile = f"stdout_rank{session_resources.subtask_rank()}.txt"
                    errfile = f"stderr_rank{session_resources.subtask_rank()}.txt"
                with redirect_stdio(FD.STDOUT, os.path.join(workdir, outfile)):
                    with redirect_stdio(FD.STDERR, os.path.join(workdir, errfile)):
                        with self.simulation_module_context as session:
                            session.run()
                logger.debug(
                    f"workdir[{self.ensemble_rank}] = {workdir_list[self.ensemble_rank]}"
                )
                logger.debug(
                    f"parameters[{self.ensemble_rank}] = {parameters_dict_list[self.ensemble_rank]}"
                )
                logger.debug(
                    f"runtime_args[{self.ensemble_rank}] = {runtime_args_list[self.ensemble_rank]}"
                )
                # end if _current_rank_participates

            # end scoped_resources: session_resources

        # Info from other ranks might not have been available when we originally constructed
        # the list(s)
        if base_comm:
            logger.debug(
                "Waiting for simulations to complete on all ranks before publishing results."
            )
            # Extra unused ranks will not participate in the collective work,
            # but all Python interpreter processes are expected to behave consistently
            # with respect to references to results.
            # We don't know whether there are non-participating ranks, so we make this
            # collective call, even though it may be unnecessary.
            assert isinstance(base_comm, mpi4py_Comm)
            workdir_list = base_comm.bcast(workdir_list)
            parameters_dict_list = base_comm.bcast(parameters_dict_list)
            runtime_args_list = base_comm.bcast(runtime_args_list)
        if hasattr(base_comm, "barrier"):
            # This is heavy-handed. Hopefully we can replace the explicit MPI calls with a Future
            # abstraction and only wait on individual results when they are actually consumed.
            # As of gmxapi 0.3, SubscriptionPublishingRunner takes responsibility for the full
            # ensemble results on all ranks, and checks for file existence before publishing.
            base_comm.barrier()

        # Replace the local-specific workdir value with the ensemble values.
        self.workdir = list(workdir_list)
        # Set the other output attributes.
        self.parameters = list(parameters_dict_list)
        self.runtime_args = runtime_args_list


class SubscriptionSessionResources(object):
    """Input and output run-time resources for a MDRun subscription.

    A generalization of this class is the probably the main hook for customizing the resources
    provided to the operation at run time.

    .. todo:: Better factoring of SessionResources, ResourceFactory, Director.resource_factory.
    """

    def __init__(
        self, input: LegacyImplementationSubscription, output: PublishingDataProxy
    ):
        # This is instantiated by the ResourceManager and then provided to the task runner to update
        # the mdrun reference. In the current implementation, mdrun has actually already run as a
        # gmxapi 0.0.7 task, and is provided to as the input LegacyImplementationSubscription.
        assert isinstance(input, LegacyImplementationSubscription)
        assert isinstance(output, PublishingDataProxy)
        self.output = output
        member_id = self.output._client_identifier
        # Before enabling the following, be sure we understand what is happening.
        # if member_id is None:
        #     member_id = 0
        # We don't currently keep a reference to the gmxapi 0.0.7 work. We just grab its local
        # output.
        self.workdir = input.workdir[member_id]
        self.parameters = input.parameters[member_id]
        self.runtime_args = input.runtime_args[member_id]


class SubscriptionPublishingRunnerDirector(_op.AbstractRunnerDirector):
    def __init__(self):
        # We expect the gmxapi 0.0.7 MD runner to be run on all ranks.
        self.allow_duplicate = True

    def __call__(self, resources) -> typing.Callable[[], None]:
        return SubscriptionPublishingRunner(resources=resources)


class SubscriptionPublishingRunner(object):
    """Handle execution in the gmxapi.operation context as a subscription to the gmxapi.simulation.context."""

    def __init__(self, resources: SubscriptionSessionResources):
        assert isinstance(resources, SubscriptionSessionResources)
        # Note that the resources contain a reference to a simulation ensemble that has already run.
        self.resources = resources

    def __call__(self):
        """Operation implementation in the gmxapi.operation module context."""
        publisher: PublishingDataProxy = self.resources.output
        assert isinstance(publisher, PublishingDataProxy)
        publisher.directory = self.resources.workdir
        publisher.stdout = os.path.join(self.resources.workdir, "stdout.txt")
        publisher.stderr = os.path.join(self.resources.workdir, "stderr.txt")
        publisher.parameters = self.resources.parameters
        logger.debug(
            f"Session resources have runtime_args: {self.resources.runtime_args}"
        )

        # Note: the gromacs library still does not provide a way to query the outputs
        # produced through the API!
        # The '-o' and '-cpo' values are either provided by the user through *runtime_args*
        # or hard-coded in the gmxapi::Context details.
        # TODO(#3130,#3379): Make the return value a trajectory handle rather than a file path.
        # Note: There may be some ambiguity about how best to handle append vs. noappend
        # output, and how the user interface should represent the different possible behaviors.
        trajectory = self.resources.runtime_args.get("-o", None)
        if trajectory is not None:
            trajectory = Path(trajectory)
            if not trajectory.is_absolute():
                trajectory = Path(self.resources.workdir) / trajectory
        # With `-noappend`, the output filename may not be as specified by the user,
        # and we do not have a way to query the file that is actually produced!
        if trajectory is None or not trajectory.exists():
            if trajectory is None:
                stem, suffix = "traj", ".trr"
                dir = Path(self.resources.workdir)
            else:
                trajectory = Path(trajectory)
                stem, suffix = trajectory.stem, trajectory.suffix
                dir = trajectory.parent
            candidates = dir.glob(f"{stem}*{suffix}")
            trajectory = max(
                [(candidate.stat().st_mtime, candidate) for candidate in candidates],
                default=(None, None),
                key=lambda x: x[0],
            )[1]

        # TODO(#3379): Make the return value a SimulationInput handle rather than a
        #  file path.
        checkpoint = self.resources.runtime_args.get("-cpo", "state.cpt")
        if not os.path.isabs(checkpoint):
            checkpoint = os.path.join(self.resources.workdir, checkpoint)

        if trajectory:
            path = Path(trajectory)
            if path.exists():
                # Publish the output file.
                publisher.trajectory = str(path)
            else:
                logger.info(f"Output file {trajectory} does not exist.")
                try:
                    dir = path.parent
                    contents = list(str(item) for item in dir.iterdir())
                    logger.info(f"Directory {dir} contents: " ", ".join(contents))
                except FileNotFoundError:
                    # We weren't able to get a dir listing to log.
                    pass
                # Explicitly publish a null result.
                publisher.trajectory = None
        else:
            logger.info(f'Missing output. *trajectory* is "{str(trajectory)}"')
            publisher.trajectory = None

        # Developer note: since `mdrun` is used for tasks beyond MD simulation
        # (such as energy minimization), not all output files exist in all use cases.
        if checkpoint:
            path = Path(checkpoint)
            if path.exists():
                # Publish the output file.
                publisher.checkpoint = str(path)
            else:
                logger.info(f"Output file {checkpoint} does not exist.")
                try:
                    dir = path.parent
                    contents = list(str(item) for item in dir.iterdir())
                    logger.info(f"Directory {dir} contents: " ", ".join(contents))
                except FileNotFoundError:
                    # We weren't able to get a dir listing to log.
                    pass
                # Explicitly publish a null result.
                publisher.checkpoint = None
        else:
            logger.info(f'Missing output. *checkpoint* is "{str(checkpoint)}"')
            publisher.checkpoint = None


#
# Implementation
#


class ResourceManager(gmxapi.operation.ResourceManager):
    """Manage resources for the MDRun operation in the gmxapi.operation contexts.

    Extends gmxapi.operation.ResourceManager to tolerate non-standard data payloads.
    Futures managed by this resource manager may contain additional attributes.
    """

    def future(self, name: str, description: _op.ResultDescription):
        # gmxapi 0.3 introduces some subscriptions and callbacks to synchronize results across MPI ranks.
        # It will become increasingly important to optimize out unnecessary data transfers with greater
        # awareness of data locality and data flow dependencies. This is one place to evolve additional
        # hooks during or after progress on issue #3379
        _future = super().future(name=name, description=description)
        return _future

    def data(self) -> OutputDataProxy:
        return OutputDataProxy(self)

    def update_output(self):
        """Override gmxapi.operation.ResourceManager.update_output because we handle paralellism as 0.0.7."""
        # For the moment, this is copy-pasted from gmxapi.operation.ResourceManager,
        # but the only part we need to override is the ensemble handling at `for i in range(self.ensemble_width)`
        # TODO: Reimplement as the resource factory and director for the operation target context.
        if not self.done():
            self.__operation_entrance_counter += 1
            if self.__operation_entrance_counter > 1:
                raise exceptions.ProtocolError(
                    "Bug detected: resource manager tried to execute operation twice."
                )
            with self.publishing_resources() as publishing_resources:
                # TODO: rewrite with the pattern that this block is directing and then resolving an operation in the
                #  operation's library/implementation context.

                ###
                # Note: this is the resource translation from gmxapi.operation context
                # to the dispatching runner director. It uses details of the gmxapi.operation.Context
                # and of the operation.

                # Create on all ranks.
                # Unlike gmxapi.operation.ResourceManager, here we create the input resources
                # once for the entire ensemble, rather than once per ensemble member.
                # This is because the simulation actually runs as an ensemble operation
                # (in gmxapi 0.0.7 context) in order to service the input resources of this
                # version of the mdrun operation, which in actuality merely retrieves the
                # gmxapi 0.0.7 results for the current interface.
                # Abstractions that could allow reunification with the parent implementation
                # could be asyncio or concurrent processing of the ensemble members, or a `map`
                # generalization that could be implemented in serial or parallel according to the
                # ResourceManager and task requirements.
                # TODO: Dispatch/discover this resource factory from a canonical place.
                input = LegacyImplementationSubscription(self)
                # End of action of the InputResourceDirector[Context, MdRunSubscription].
                ###

                # We are giving the director a resource that contains the subscription
                # to the dispatched work.
                for member in range(self.ensemble_width):
                    with publishing_resources.publishing_context(
                        ensemble_member=member
                    ) as output:
                        error_message = "Got {} while executing {} for operation {}."
                        try:
                            resources = self._resource_factory(
                                input=input, output=output
                            )
                        except exceptions.TypeError as e:
                            message = error_message.format(
                                e, self._resource_factory, self.operation_id
                            )
                            raise exceptions.ApiError(message) from e

                        runner = self._runner_director(resources)
                        try:
                            runner()
                        except Exception as e:
                            message = error_message.format(e, runner, self.operation_id)
                            raise exceptions.ApiError(message) from e


class StandardInputDescription(_op.InputDescription):
    """Provide the MdRun input description in gmxapi.operation Contexts."""

    # TODO: Improve fingerprinting.
    # If _make_uid can't make sufficiently unique IDs, use additional "salt".
    # Without fingerprinting, we cannot consistently hash *input* across processes,
    # but we can consistently generate integers in the same sequence the first time
    # we see each distinct input.
    _number_issued: typing.ClassVar[int] = 0
    _uids: typing.ClassVar[typing.MutableMapping[int, bytes]] = {}

    @classmethod
    def _make_uid(cls, input) -> str:
        # WARNING: The built-in hash will use memory locations, and so will not be consistent across
        # process ranks, even if the input should be the same.
        # Note also that that hash() has internal salt that is regenerated for every process.
        # TODO: Use input fingerprint for more useful identification.
        # 8 bytes is probably enough.
        if input not in cls._uids:
            uid = hashlib.md5(f"mdrun{cls._number_issued}".encode("utf8")).digest()
            existing = [key for key, value in cls._uids.items() if uid == value]
            if existing:
                raise exceptions.ProtocolError(
                    f"Calculated uid {uid.hex()} for input {input}, but uid is already used by "
                    + ", ".join(repr(edge) for edge in existing)
                    + "."
                )
            cls._uids[input] = uid
            cls._number_issued += 1
        else:
            uid = cls._uids[input]
            logger.debug(f"Reissuing uid for mdrun({input}): {uid.hex()}")
        new_uid = f"mdrun_{uid.hex()}"
        return new_uid

    def signature(self) -> _op.InputCollectionDescription:
        return _input

    def make_uid(self, input: _op.DataEdge) -> str:
        assert isinstance(input, _op.DataEdge)
        return self._make_uid(input)


class RegisteredOperation(_op.OperationImplementation, metaclass=_op.OperationMeta):
    """Provide the gmxapi compatible MDRun implementation."""

    # This is a class method to allow the class object to be used in gmxapi.operation._make_registry_key
    @classmethod
    def name(cls) -> str:
        """Canonical name for the operation."""
        return "mdrun"

    @classmethod
    def namespace(cls) -> str:
        """modify_input is importable from the gmxapi module."""
        return "gmxapi"

    @classmethod
    def director(cls, context: gmxapi.abc.Context) -> gmxapi.abc.OperationDirector:
        # Currently, we only have a Directory for the gmxapi.operation.Context
        if isinstance(context, _op.Context):
            return StandardDirector(context)


class StandardOperationHandle(_op.AbstractOperation):
    """Handle used in Python UI or gmxapi.operation Contexts."""

    def __init__(self, resource_manager: ResourceManager):
        self.__resource_manager = resource_manager

    def run(self):
        self.__resource_manager.update_output()

    @property
    def output(self) -> OutputDataProxy:
        return self.__resource_manager.data()


class StandardDirector(gmxapi.abc.OperationDirector):
    """Direct the instantiation of a mdrun node in a gmxapi.operation Context.

    .. todo:: Compose this behavior in a more generic class.

    .. todo:: Describe where instances live.
    """

    def __init__(self, context: _op.Context):
        if not isinstance(context, _op.Context):
            raise gmxapi.exceptions.ValueError(
                "StandardDirector requires a gmxapi.operation Context."
            )
        self.context = context

    def __call__(
        self, resources: _op.DataSourceCollection, label: str = None
    ) -> StandardOperationHandle:
        builder = self.context.node_builder(operation=RegisteredOperation, label=label)

        builder.set_resource_factory(SubscriptionSessionResources)
        builder.set_input_description(StandardInputDescription())
        builder.set_handle(StandardOperationHandle)
        # The runner in the gmxapi.operation context is the servicer for the legacy context.
        builder.set_runner_director(SubscriptionPublishingRunnerDirector())
        builder.set_output_factory(_output_factory)
        builder.set_resource_manager(ResourceManager)

        # Note: we have not yet done any dispatching based on *resources*. We should
        # translate the resources provided into the form that the Context can subscribe to
        # using the dispatching resource_factory. In the second draft, this operation
        # is dispatched to a SimulationModuleContext, which can be subscribed directly
        # to sources that are either literal filenames or gmxapi.simulation sources,
        # while standard Futures can be resolved in the standard context.
        #
        assert isinstance(resources, _op.DataSourceCollection)
        for name, source in resources.items():
            builder.add_input(name, source)

        handle = builder.build()
        assert isinstance(handle, StandardOperationHandle)
        return handle

    def handle_type(self, context: gmxapi.abc.Context):
        return StandardOperationHandle

    # Developer note: the Director instance is a convenient place to get a dispatching
    # factory. The Director may become generic or more universal, but the resource_factory
    # would likely not be typed on the generic parameters of the Director class.
    # Instead, it is likely a generic function with its own TypeVar parameters.
    def resource_factory(
        self,
        source: typing.Union[gmxapi.abc.Context, ModuleObject, None],
        target: gmxapi.abc.Context = None,
    ):
        """Get a resource factory for use in the target context.

        The returned factory takes input from the source context and provides it in a form
        usable by the operation builder in the target context.
        """
        # Distinguish between the UIContext, in which input is in the form
        # of function call arguments, and the StandardContext, implemented in
        # gmxapi.operation. UIContext is probably a virtual context that is
        # asserted by callers in order to get a factory that normalizes UI input
        # for the StandardContext.
        #
        if target is None:
            target = self.context
        if source is None:
            # `source is None` implies source is coming from UI.
            if isinstance(target, _op.Context):
                # Return a factory that can bind to function call arguments to produce a DataSourceCollection.
                return _standard_node_resource_factory
        if isinstance(source, _op.Context):
            # The source is a gmxapi.operation.Context when the operation is being evaluated through
            # a gmxapi.operation.ResourceManager. i.e. at run time.
            return SubscriptionSessionResources
        if isinstance(source, ModuleObject):
            # In the UI context, the source may be a ModuleObject instead of `None`, per `mdrun`
            # defined below.
            if isinstance(target, _op.Context):
                # We are creating a node in gmxapi.operation.Context from another gmxapi.simulation operation.
                # This means that we want to subscribe to the subcontext instead of the gmxapi.operation.Context.
                # In the first draft, though, we just access a special payload.
                # Return a factory that will consume *_simulation_input* and *parameters*
                # members of a received object.
                logger.info("Building mdrun operation from source {}".format(source))

                def simulation_input_workaround(_simulation_input, runtime_args):
                    """Allows support for the as-yet-undefined SimulationInput resource.

                    Also supports a user interface in which the OutputDataProxy is not an
                    explicit attribute. See https://gitlab.com/gromacs/gromacs/-/issues/3174
                    """
                    source = _simulation_input
                    # Accept either an OutputDataProxy with appropriate members, or an abject
                    # that provides such an OutputDataProxy.
                    if hasattr(source, "output"):
                        source = _simulation_input.output
                    assert hasattr(source, "_simulation_input")
                    assert hasattr(source, "parameters")
                    logger.info(
                        "mdrun receiving input {}: {}".format(
                            source._simulation_input.name,
                            source._simulation_input.description,
                        )
                    )
                    source_collection = _input.bind(
                        _simulation_input=source._simulation_input,
                        parameters=source.parameters,
                        runtime_args=runtime_args,
                    )
                    logger.info(
                        "mdrun input bound as source collection {}".format(
                            source_collection
                        )
                    )
                    return source_collection

                return simulation_input_workaround

        raise gmxapi.exceptions.ValueError(
            f"No dispatching from {source} context to {target}"
        )


def mdrun(
    input,
    runtime_args: typing.Union[dict, typing.Sequence[dict]] = None,
    label: str = None,
    context=None,
):
    """MD simulation operation.

    Arguments:
        input : valid simulation input
        runtime_args (dict): command line flags and arguments to be passed to mdrun (optional)

    Returns:
        runnable operation to perform the specified simulation

    See :py:class:`~gmxapi.simulation.mdrun.OutputDataProxy` for members of the
    *output* attribute.

    *input* may be a TPR file name or an object providing the SimulationInput interface.

    *runtime_args* allows an optional dictionary of mdrun options, using the option flag
    (including the leading hyphen ``-``) as the dictionary key.
    For mdrun command line options that do not take a value (e.g. ``-noappend``),
    use ``None`` as the dictionary value.

    Warning:
        Run time argument processing does not have Python bindings at this time.
        key-value pairs are passed as plain text to the underlying library.
        Usage errors can be hard to discover. Refer to the MD log file in the output
        directory for messages regarding argument processing.

        Note, in particular, that the available ``mdrun`` arguments can depend on the
        GROMACS build configuration, such as whether an MPI library or thread-MPI
        is enabled.

    See Also:
        The :doc:`/onlinehelp/gmx-mdrun` command line tool.

    """
    # The job of this function is to arrange for the creation of a workflow node
    # by transforming arguments into a DataSourceCollection and providing the
    # collection to a Director.
    # The Director is specific to the Operation (this module) but could be generated
    # with the help of simple metaprogramming in the future (e.g. just declare
    # requirements or helpers in a class definition).
    # Ref: gmxapi.abc.NodeBuilder and gmxapi.operation.NodeBuilder

    if runtime_args is None:
        runtime_args = {}

    handle_context = context
    if handle_context is not None:
        raise gmxapi.exceptions.MissingImplementationError(
            "context must be None. This factory is only for the Python UI right now."
        )

    target_context = _op.current_context()
    assert isinstance(target_context, _op.Context)
    # Get a director that will create a node in the standard context.
    node_director: StandardDirector = _op._get_operation_director(
        RegisteredOperation, context=target_context
    )
    assert isinstance(node_director, StandardDirector)
    # TODO: refine this protocol
    assert handle_context is None
    # Examine the input.
    if isinstance(input, ModuleObject):
        # The input is from read_tpr or modify_input.
        source_context = input
    else:
        # Allow automatic dispatching
        source_context = None

    # Depending on dispatching, the ResourceFactory may be one of several functor types.
    # TODO: Use a standard helper function to pass data and resources to the NodeDirector.
    #  Module-specific input processing logic should be explicit in this user-facing function
    #  or composed into the NodeDirector for this operation.
    resource_factory = node_director.resource_factory(
        source=source_context, target=target_context
    )
    # The resource_factory will ultimately produce a DataSourceCollection with help from the
    # InputCollectionDescription defined for this module. Per InputCollectionDescription.bind()
    # and the POSITIONAL_OR_KEYWORD property, the `input` could be provided as a positional
    # argument (as it was previously) and get bound to `_simulation_input`. Despite the
    # provisional nature of the `_simulation_input` input, this code is more readable when we
    # use a named parameter.
    resources: _op.DataSourceCollection = resource_factory(
        _simulation_input=input, runtime_args=runtime_args
    )
    handle = node_director(resources=resources, label=label)
    # Note: One effect of the assertions above is to help the type checker infer
    # the return type of the handle. It is hard to convince the type checker that
    # the return value of the node builder is up-cast. We might be able to resolve
    # this by making both get_operation_director and ReadTprImplementation
    # generics of the handle type, or using the handle type as the key for
    # get_operation_director.
    return handle
