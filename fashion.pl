#!/usr/bin/env perl
use strict;

my $t;
my $n;
my @men;
my @women;
my @hotness_bonds;
my $sum;

while (<>) {
	chomp($_);
	#get the number of tests
	if ($. == 1) {
		$t = $_;
	}
	else {
		#get the number of men/women
		if ($. % 3 == 2) {
			$n = $_;
			@hotness_bonds = ();
		}
		#get men data
		elsif ($. % 3 == 0) {
			@men = reverse(sort {$a <=> $b} (split(/\ /, $_)));
		}
		#get women data
		elsif ($. % 3 == 1) {
			@women = reverse(sort {$a <=> $b} (split(/\ /, $_)));
			#calculate all hotness bonds
			@hotness_bonds = map {$men[$_] * $women[$_]} (0 .. $#men);
			$sum = 0;
			#sum of the hotness bonds
			$sum  += $_ foreach @hotness_bonds;
			print "$sum\n";
		}
	}
	#exit after n tests
	last if $. > $t * 3;
}
