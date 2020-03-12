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

use strict;
use warnings;
use feature 'say';

sub to_hash
{
    my $input = shift;
    my $letters = 'acdegilmnoprstuw';
    my $h = 7;
    my @input_ltrs = split('', $input);
    for my $i (0..(length $input) - 1)
    {
        $h = ($h * 37 + index($letters, $input_ltrs[$i]));
    }

    return $h;
}

sub from_hash
{
    my $input = shift;
    my $length = shift;
    my @letters = ('a', 'c', 'd', 'e', 'g', 'i', 'l', 'm', 'n', 'o', 'p', 'r', 's', 't', 'u', 'w');
    my $output = '';
    for my $i (1..$length)
    {
        my $ltr_index = 0;
        for my $j (0..15)
        {
            $ltr_index = $j;
            last if ($input - $j) % 37 == 0;
        }
        $input = ($input - $ltr_index) / 37;
        $output .= $letters[$ltr_index];
    }
    return scalar reverse $output;
}

say to_hash('leepadg');
say from_hash('910897038977002', 9);
