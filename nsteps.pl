#!/usr/bin/env perl
use strict;

my $n;

while (<>) {
	chomp($n);
	#get the number of tests
	if ($. == 1) {
		$n = $_;
	}
	else {
		my ($x, $y) = split(/\ /, $_);
		#check if there's a point in the coordinates
		if ($x == $y || $x == $y + 2) {
			if ($x % 2 == 0) {
				print $x + $y."\n";
			}
			else {
				print $x + $y - 1 ."\n";
			}
		}
		else {
			print "No Number\n";
		}
	}
	#exit after n tests
	last if $. > $n;
}
