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
