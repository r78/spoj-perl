#!/usr/bin/env perl
use strict;
use Math::BigInt;

my @factorials;

#get memoized factorials
sub factorial {
	my $n = Math::BigInt->new(shift);

	if ($factorials[$n]) {
		return $factorials[$n];
	}
	else {
		if ($n <= 1) {
			$factorials[$n] = 1
		}
		else {
			$factorials[$n] = factorial($n - 1) * $n;
		}
		return $factorials[$n];
	}
}

my $t;
my $n;

while (<>) {
	chomp($_);
	#get the number of test cases
	if ($. == 1) {
		$t = $_;
	}
	else {
		print factorial($_) . "\n";
	}
	#exit after t test cases
	last if $. > $t;
}
