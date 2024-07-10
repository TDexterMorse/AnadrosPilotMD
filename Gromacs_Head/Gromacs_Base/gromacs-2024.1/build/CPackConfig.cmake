# This file will be configured to contain variables for CPack. These variables
# should be set in the CMake list file of the project before CPack module is
# included. The list of available CPACK_xxx variables and their associated
# documentation may be obtained using
#  cpack --help-variable-list
#
# Some variables are common to all generators (e.g. CPACK_PACKAGE_NAME)
# and some are specific to a generator
# (e.g. CPACK_NSIS_EXTRA_INSTALL_COMMANDS). The generator specific variables
# usually begin with CPACK_<GENNAME>_xxxx.


set(CPACK_BINARY_DEB "OFF")
set(CPACK_BINARY_FREEBSD "OFF")
set(CPACK_BINARY_IFW "OFF")
set(CPACK_BINARY_NSIS "OFF")
set(CPACK_BINARY_RPM "OFF")
set(CPACK_BINARY_STGZ "ON")
set(CPACK_BINARY_TBZ2 "OFF")
set(CPACK_BINARY_TGZ "ON")
set(CPACK_BINARY_TXZ "OFF")
set(CPACK_BINARY_TZ "ON")
set(CPACK_BUILD_SOURCE_DIRS "/home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1;/home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build")
set(CPACK_CMAKE_GENERATOR "Unix Makefiles")
set(CPACK_COMPONENTS_ALL "Development;RuntimeLibraries;Unspecified;data;development;libraries;man;runtime")
set(CPACK_COMPONENT_UNSPECIFIED_HIDDEN "TRUE")
set(CPACK_COMPONENT_UNSPECIFIED_REQUIRED "TRUE")
set(CPACK_DEFAULT_PACKAGE_DESCRIPTION_FILE "/usr/share/cmake-3.22/Templates/CPack.GenericDescription.txt")
set(CPACK_DEFAULT_PACKAGE_DESCRIPTION_SUMMARY "Gromacs built using CMake")
set(CPACK_GENERATOR "STGZ;TGZ;TZ")
set(CPACK_GMX_BUILD_HELP "OFF")
set(CPACK_INSTALL_CMAKE_PROJECTS "/home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build;Gromacs;ALL;/")
set(CPACK_INSTALL_PREFIX "/usr/local/gromacs")
set(CPACK_MODULE_PATH "/home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/cmake;/home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/cmake/Platform")
set(CPACK_NSIS_DISPLAY_NAME "gromacs 2024.1")
set(CPACK_NSIS_INSTALLER_ICON_CODE "")
set(CPACK_NSIS_INSTALLER_MUI_ICON_CODE "")
set(CPACK_NSIS_INSTALL_ROOT "$PROGRAMFILES")
set(CPACK_NSIS_PACKAGE_NAME "gromacs 2024.1")
set(CPACK_NSIS_UNINSTALL_NAME "Uninstall")
set(CPACK_OUTPUT_CONFIG_FILE "/home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/CPackConfig.cmake")
set(CPACK_PACKAGE_CONTACT "https://gromacs.bioexcel.eu/c/gromacs-user-forum/5")
set(CPACK_PACKAGE_DEFAULT_LOCATION "/")
set(CPACK_PACKAGE_DESCRIPTION_FILE "/usr/share/cmake-3.22/Templates/CPack.GenericDescription.txt")
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "GROMACS - a toolkit for high-performance molecular simulation")
set(CPACK_PACKAGE_FILE_NAME "gromacs-2024.1-Linux")
set(CPACK_PACKAGE_INSTALL_DIRECTORY "gromacs 2024.1")
set(CPACK_PACKAGE_INSTALL_REGISTRY_KEY "gromacs 2024.1")
set(CPACK_PACKAGE_NAME "gromacs")
set(CPACK_PACKAGE_RELOCATABLE "true")
set(CPACK_PACKAGE_VENDOR "gromacs.org")
set(CPACK_PACKAGE_VERSION "2024.1")
set(CPACK_PACKAGE_VERSION_MAJOR "2024")
set(CPACK_PACKAGE_VERSION_MINOR "1")
set(CPACK_PACKAGE_VERSION_PATCH "1")
set(CPACK_PROJECT_CONFIG_FILE "/home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/CPackInit.cmake")
set(CPACK_RESOURCE_FILE_LICENSE "/home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/COPYING")
set(CPACK_RESOURCE_FILE_README "/home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/admin/InstallInfo.txt")
set(CPACK_RESOURCE_FILE_WELCOME "/home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/admin/InstallWelcome.txt")
set(CPACK_SET_DESTDIR "OFF")
set(CPACK_SOURCE_GENERATOR "TGZ")
set(CPACK_SOURCE_IGNORE_FILES "\\.isreposource;\\.git;\\.gitignore;\\.gitattributes;INSTALL-dev;ccache")
set(CPACK_SOURCE_INSTALLED_DIRECTORIES "/home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1;/;/home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/programs/completion;src/programs/completion;/home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/docs/man;docs/man")
set(CPACK_SOURCE_OUTPUT_CONFIG_FILE "/home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/CPackSourceConfig.cmake")
set(CPACK_SOURCE_PACKAGE_FILE_NAME "gromacs-2024.1")
set(CPACK_SYSTEM_NAME "Linux")
set(CPACK_THREADS "1")
set(CPACK_TOPLEVEL_TAG "Linux")
set(CPACK_WIX_SIZEOF_VOID_P "8")

if(NOT CPACK_PROPERTIES_FILE)
  set(CPACK_PROPERTIES_FILE "/home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/CPackProperties.cmake")
endif()

if(EXISTS ${CPACK_PROPERTIES_FILE})
  include(${CPACK_PROPERTIES_FILE})
endif()