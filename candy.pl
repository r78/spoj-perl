#!/usr/bin/env perl
use strict;

my $packets = 0;
my $i;
my @candies;
my @diffs;
my $total;
my $total_diffs;

while (<>) {
	chomp($_);
	if ($i == 0) {
		if ($packets != 0) {
			for (1 .. scalar(@candies) - 1) {
				$total += $candies[$_];
			}
			#can we reassign the candies?
			if ($total % $packets == 0) {
				my $mean = $total / $packets;	
				#add all the differences between the number of candies in a
				#packet and the mean number of candies in a packet
				for (1 .. scalar(@candies) - 1) {
					$total_diffs += abs($mean - $candies[$_]);
				}
				#divide it by 2 and we have the number of movements
				print $total_diffs / 2 ."\n";
			}
			else {
				print "-1\n";
			}
		}
		$packets = $_;
		$i = $_;
		$total = 0;
		$total_diffs = 0;
		@candies = ();
		@diffs = ();
	}
	else {
		if ($i > 0) {
			$candies[$i] = $_;
			$i--;
		}
	}
	last if ($_ == "-1");
}
