#!/usr/bin/env perl
use strict;
use bignum;

sub mirror {
	my $num = shift;
	my $length = length($num);
	my $palin;
	if ($length % 2 == 0) {
		#get digits in the left half
		my $half = substr($num, 0, $length / 2);
		#mirror that and create a palindrome
		$palin = $half . reverse($half);
	} else {
		#get digits in the left half + 1
		my $half = substr($num, 0, int($length / 2) + 1);
		#mirror that and create a palindrome
		$palin = $half . substr(reverse($half), 1);
	}
	return $palin;
}

my $t;

while (<>) {
	chomp($_);
	#get the number of tests
	if ($. == 1) {
		$t = $_;
	} else {
		my $num = $_;
		my $length = length($num);
		#if the number has an even number of digits
		if ($length % 2 == 0) {
			my $palin = mirror($num);
			#get digits in the left half
			my $half = substr($num, 0, $length / 2);
			#mirror that and create a palindrome
			my $palin = $half . reverse($half);
			if ($palin > $num) {
				print $palin;
			}
			#increment the 2 central numbers
			else {
				my $oldlength = length($half);
				$half = int($half + 1);
				my $newlength = length($half);
				if ($oldlength < $newlength) {
					$num = $half . ("0" x (length($half) - 1));
					my $palin = mirror($num);
					print $palin;
				}
				else {
					my $palin = $half . reverse($half);
					print $palin;
				}
			}
		}
		#if the number has an odd number of digits
		else {
			#get digits in the left half + 1
			my $half = substr($num, 0, int($length / 2) + 1);
			#mirror that and create a palindrome
			my $palin = $half . substr(reverse($half), 1);
			if ($palin > $num) {
				print $palin;
			}
			#increment the middle number to find a greater palindrome
			else {
				#is the middle number a 9?	
				if (substr($half, -1) == 9) {
					my $oldlength = length($half);
					my $half = int($half + 1);
					my $newlength = length($half);
					my $padding = $oldlength < $newlength ? 2 : 1;
					#round the number up and find the next palindrome from that number
					$num = $half . ("0" x (length($half) - $padding));
					$palin = mirror($num);
				}
				else {
					$palin = int($half + 1) . substr(reverse($half), 1);
				}
				print $palin;
			}
		}
		print "\n";
	}
	last if ($. > $t);
}
