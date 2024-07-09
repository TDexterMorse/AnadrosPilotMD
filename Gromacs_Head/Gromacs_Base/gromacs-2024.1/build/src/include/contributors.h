/*
 * This file is part of the GROMACS molecular simulation package.
 *
 * Copyright 2022- The GROMACS Authors
 * and the project initiators Erik Lindahl, Berk Hess and David van der Spoel.
 * Consult the AUTHORS/COPYING files and https://www.gromacs.org for details.
 *
 * GROMACS is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public License
 * as published by the Free Software Foundation; either version 2.1
 * of the License, or (at your option) any later version.
 *
 * GROMACS is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with GROMACS; if not, see
 * https://www.gnu.org/licenses, or write to the Free Software Foundation,
 * Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA.
 *
 * If you want to redistribute modifications to GROMACS, please
 * consider that scientific software is very special. Version
 * control is crucial - bugs must be traceable. We will be happy to
 * consider code for inclusion in the official distribution, but
 * derived work must not be called official GROMACS. Details are found
 * in the README & COPYING files - if they are missing, get the
 * official version at https://www.gromacs.org.
 *
 * To help us fund GROMACS development, we humbly ask that you cite
 * the research papers on the package. Check out https://www.gromacs.org.
 */
#ifndef GMX_CONTRIBUTORS_H
#define GMX_CONTRIBUTORS_H

/*! \internal \file
 * \brief
 * Contributor information from the build system.
 *
 * Used for log output.
 */
#include <string>
#include <vector>


namespace gmx
{

inline const std::vector<std::string> currentContributors
{
    "Mark Abraham",
    "Andrey Alekseenko",
    "Vladimir Basov",
    "Cathrine Bergh",
    "Eliane Briand",
    "Ania Brown",
    "Mahesh Doijade",
    "Giacomo Fiorin",
    "Stefan Fleischmann",
    "Sergey Gorelov",
    "Gilles Gouaillardet",
    "Alan Gray",
    "M. Eric Irrgang",
    "Farzaneh Jalalypour",
    "Joe Jordan",
    "Carsten Kutzner",
    "Justin A. Lemkul",
    "Magnus Lundborg",
    "Pascal Merz",
    "Vedran Miletic",
    "Dmitry Morozov",
    "Julien Nabet",
    "Szilard Pall",
    "Andrea Pasquadibisceglie",
    "Michele Pellegrino",
    "Hubert Santuz",
    "Roland Schulz",
    "Tatiana Shugaeva",
    "Alexey Shvetsov",
    "Philip Turner",
    "Alessandra Villa",
    "Sebastian Wingbermuehle",
};

inline const std::vector<std::string> previousContributors
{
    "Emile Apol",
    "Rossen Apostolov",
    "James Barnett",
    "Paul Bauer",
    "Herman J.C. Berendsen",
    "Par Bjelkmar",
    "Christian Blau",
    "Viacheslav Bolnykh",
    "Kevin Boyd",
    "Aldert van Buuren",
    "Carlo Camilloni",
    "Rudi van Drunen",
    "Anton Feenstra",
    "Oliver Fleetwood",
    "Vytas Gapsys",
    "Gaurav Garg",
    "Gerrit Groenhof",
    "Bert de Groot",
    "Anca Hamuraru",
    "Vincent Hindriksen",
    "Victor Holanda",
    "Aleksei Iupinov",
    "Christoph Junghans",
    "Prashanth Kanduri",
    "Dimitrios Karkoulis",
    "Peter Kasson",
    "Sebastian Kehl",
    "Sebastian Keller",
    "Jiri Kraus",
    "Per Larsson",
    "Viveca Lindahl",
    "Erik Marklund",
    "Pieter Meulenhoff",
    "Teemu Murtola",
    "Sander Pronk",
    "Michael Shirts",
    "Alfons Sijbers",
    "Balint Soproni",
    "David van der Spoel",
    "Peter Tieleman",
    "Carsten Uphoff",
    "Jon Vincent",
    "Teemu Virolainen",
    "Christian Wennberg",
    "Maarten Wolf",
    "Artem Zhmurov",
};

inline const std::vector<std::string> currentProjectLeaders
{
    "Berk Hess",
    "Erik Lindahl",
};

inline const std::string copyrightText
{
    "Copyright 1991-2024 The GROMACS Authors."
};

} // namespace gmx

#endif // GMX_CONTRIBUTORS_H
