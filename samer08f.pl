#!/usr/bin/env perl
use strict;

my $t;
my $squares;

while (<>) {
	chomp($_);
	#get the number of test cases
	if ($. == 1) {
		$t = $_;
	}
	else {
		$squares = 0;
		#add all the squares in the square
		for (1 .. $_) {
			$squares += $_ * $_;
		}
		print $squares ."\n";
	}
	#exit after t test cases
	last if $. > $t;
}
