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

sub to-hash(Str $input)
{
    my $letters = 'acdegilmnoprstuw';
    my $h = 7;
    my @input-ltrs = $input.split('', :skip-empty);
    for (0..^$input.chars) -> $i
    {
        $h = ($h * 37 + $letters.index(@input-ltrs[$i]));
    }

    return $h;
}

sub from-hash(Str $hash, Int $length)
{
    my @letters = <a c d e g i l m n o p r s t u w>;
    my $input = $hash.Int;
    my $output = '';
    for ($length ... 1) -> $i
    {
        my $ltr-index = 0;
        for (0..15) -> $j
        {
            $ltr-index = $j;
            last if ($input - $j) % 37 == 0;
        }
        $input = ($input - $ltr-index) / 37;
        $output ~= @letters[$ltr-index];
    }
    return $output.flip;
}

say to-hash('leepadg');
say from-hash('910897038977002', 9);
