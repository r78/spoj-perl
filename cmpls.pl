#!/usr/bin/env perl
use strict;
#use Math::BigInt;
use Benchmark qw(:all) ;
use Math::BigInt lib => 'GMP';

my $t;
my $s;
my $c;

while (<>) {
	chomp($_);
	#get the number of tests
	if ($. == 1) {
		$t = $_ * 2;
	} else {
		#my @nums = ();
		my @diffs = ();
		#get the length of the sequence and the amount of numbers to find
		if ($. % 2 == 0) {
			($s, $c) = split(/\ /, $_);
		}
		#work with the sequence?
		elsif ($. % 2 == 1) {
			#@nums = split(/\ /, $_);
			#$diffs[0] = [@nums];
			$diffs[0] = [split(/\ /, $_)];
			my $b_end = 1;
			my $lim = $s;
			while (1) {
				$lim--;
				$b_end = 0;
				for (my $i = 0; $i < $lim; $i++) {
					#store the differences between elements in an array of arrays
					$diffs[$s - $lim][$i] = $diffs[$s - $lim - 1][$i + 1] - $diffs[$s - $lim - 1][$i];
					if (($i > 0) and ($diffs[$s - $lim][$i - 1] != $diffs[$s - $lim][$i])) {
						#continue if the elements are different
						$b_end = 1;
					}
				}
				#stop if all differences between elements are the same
				last if $b_end == 0;
			}

			my $cons =  $diffs[-1][0];
			for (my $i = -1; $i >= - scalar(@diffs); $i--) {
				if ($i == -1) {
					#fill the 'constant' array with $c equal elements;
					push(@{$diffs[$i]}, ($cons) x $c);
				}
				else {
					#add $c elements to each array of differences up to the original sequence
					for (my $j = 0; $j < $c; $j++) {
						my $new_elem = @{$diffs[$i]}[-1] + (@{$diffs[$i + 1]}[scalar(@{$diffs[$i]}) - 1]);
						
						#push(@{$diffs[$i]},  Math::BigInt->new(@{$diffs[$i]}[-1] + (@{$diffs[$i + 1]}[scalar(@{$diffs[$i]}) - 1])) );
						push(@{$diffs[$i]},  Math::BigInt->new($new_elem));
					}
				}
			}
			print join(" ",splice(@{$diffs[0]}, $s, $c))."\n";
		}
	}
	last if ($. > $t);
}
