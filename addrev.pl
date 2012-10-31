#!/usr/bin/env perl
use strict;

my $n;
while (<>) {
	#get the number of tests
	if ($. == 1) {
		$n = $_;
	}
	else {
		#read the 2 numbers
		my ($a, $b) = split(/\ /, $_);
		#print the reverse of the sum of the reversed numbers, omitting leading zeros
		print int(scalar reverse (scalar reverse($a) + scalar reverse($b)));
		print "\n";
	}
	#exit after n tests
	last if $. > $n;
}
