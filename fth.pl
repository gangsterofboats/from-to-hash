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

# say to_hash('leepadg');
say from_hash('910897038977002', 9);
