#!/usr/bin/env perl
use strict;

#counts the number of zeros in num!
sub z {
	my $num = shift;
	my $ct_zeros = 0;
	return 0 if ($num < 5);

	my $factors = int($num / 5);
	$ct_zeros += $factors;
	while ($factors >= 5) {
		$factors = int($factors / 5);
		$ct_zeros += $factors;
	}	
	
	return $ct_zeros;
}

my $t = 0;
while (<>) {
	chomp($_);
	#get the number of tests
	if ($. == 1) {
		$t = $_;
	}
	else {
		#print the number of zeros in N!
		print z($_) ."\n";
	}
	#exit after t tests
	last if $. > $t + 1;
}
