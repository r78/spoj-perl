#!/usr/bin/env perl
use strict;
use Math::BigInt;

my $total;
my $more;
my $half;

while (<>) {
	chomp($_);
	if ($. % 2 == 1) {
		$total = Math::BigInt->new($_);
	}
	else {
		$more = Math::BigInt->new($_);
		my $n = ($total - $more) / 2;
		my $k = $more + $n;
		print "$k\n$n\n";
	}
	#exit after n cases
	last if ($. >= 20);
}
