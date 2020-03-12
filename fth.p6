#!/usr/bin/env perl6
#############################################################################
# FromToHash - Solve a job interview puzzle                                 #
# Copyright (C) 2020 Michael Wiseman                                        #
#                                                                           #
# This program is free software: you can redistribute it and/or modify      #
# it under the terms of the GNU Affero General Public License as            #
# published by the Free Software Foundation, either version 3 of the        #
# License, or (at your option) any later version.                           #
#                                                                           #
# This program is distributed in the hope that it will be useful,           #
# but WITHOUT ANY WARRANTY; without even the implied warranty of            #
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the             #
# GNU Affero General Public License for more details.                       #
#                                                                           #
# You should have received a copy of the GNU Affero General Public License  #
# along with this program.  If not, see <https://www.gnu.org/licenses/>.    #
#############################################################################

sub to-hash(Str $input --> Int)
{
    my Str $letters = 'acdegilmnoprstuw';
    my Int $h = 7;
    for (0..^$input.chars) -> int $i
    {
        $h = ($h * 37 + $letters.index(substr($input, $i, 1)));
    }

    return $h;
}

sub from-hash(Int $hash, Int $length --> Str)
{
    my Int $input = $hash;
    my Str $letters = 'acdegilmnoprstuw';
    my Str $output = '';
    for ($length ... 1) -> int $i
    {
        my Int $index = 0;
        my Int $h = ($input - $index) % 37;
        while ($h != 0)
        {
            $index++;
            $h = ($input - $index) % 37;
        }
        $input = Int(($input - $index) / 37);
        $output ~= substr($letters, $index, 1);
    }
    return $output.flip;
}

say to-hash('leepadg');
say from-hash(910897038977002, 9);
