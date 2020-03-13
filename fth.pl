#!/usr/bin/env perl
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
use common::sense;

sub to_hash
{
    my $input = shift;
    my $letters = 'acdegilmnoprstuw';
    my $h = 7;
    for my $i (0..(length $input) - 1)
    {
        $h = ($h * 37 + index($letters, substr($input, $i, 1)));
    }

    return $h;
}

sub from_hash
{
    my ($input, $length) = (@_);
    my $letters = 'acdegilmnoprstuw';
    my $output = '';
    for my $i (1..$length)
    {
        my $index = 0;
        my $h = ($input - $index) % 37;
        while ($h != 0)
        {
            $index++;
            $h = ($input - $index) % 37;
        }
        $input = ($input - $index) / 37;
        $output = substr($letters, $index, 1) . $output;
    }
    return $output;
}

say to_hash('leepadg');
say from_hash(910897038977002, 9);
