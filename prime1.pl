#!/usr/bin/env perl
use strict;

my @tests;
my $t;

while (<>) {
    #get the number of tests from input
    if ($. == 1) {
        $t = $_;
    }
    #stop reading after t tests 
    elsif ($. > $t + 1) {
        last;
    }
    #store the test
    else {
        $tests[$. - 2] = $_;
    }
}

foreach (@tests) {
    my @numbers = split(" ",$_);
    my $m = $numbers[0];
    my $n = $numbers[1];
	my @primes = (0) x ($n - $m + 1);

	for (my $i = 2; $i*$i <= $n; $i++) {
		#optimization: all primes > 3 have modulo 6 = 1 or 5
		if ($i >= 4 and ($i % 6 != 1 and $i % 6 != 5)) {
			next;
		}
		#bounded sieve
		my $start = int($m / $i) * $i;
		for (my $j = $start; $j <= $n; $j += $i) {
			if ($j != $i and $j >= $m) {
				$primes[$j - $m] = 1;
			}
		}
	}

    #print prime numbers between M and N
    for (my $i = 0; $i < $n - $m + 1; $i++) {
        if (($primes[$i] == 0) and ($m + $i != 1)) {
			print $m + $i . "\n";
		}
    }
    print "\n";
}
