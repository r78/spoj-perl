#!/usr/bin/env perl
use strict;
use Math::BigInt;

my $t;

sub add_sub {
	my $first = shift;
	my $second = shift;
	my $op = shift;
	my $len_first = length($first);
	my $len_opsec = length("$op$second");
	my $paddlen = $len_first > $len_opsec ? $len_first : $len_opsec;
	print sprintf("%${paddlen}s", "$first")."\n";
	print sprintf("%${paddlen}s", "$op$second")."\n";
	my $result;
	if ($op =~ /\+/) {
		$result = Math::BigInt->new($first) + Math::BigInt->new($second);
	} else {
		$result = Math::BigInt->new($first) - Math::BigInt->new($second);
	}
	my $len_res = length($result);
	my $linepaddlen = $len_opsec > $len_res ? $len_opsec : $len_res;
	print sprintf("%${paddlen}s", "-" x $linepaddlen). "\n";
	print sprintf("%${paddlen}s", $result)."\n\n";
}

sub mult {
	my $first = shift;
	my $second = shift;
	my $op = "*";
	my $result = Math::BigInt->new($first) * Math::BigInt->new($second);
	my @res;
	my $paddlen = length($result);
	my $len_first = length($first);
	my $len_opsec = length("$op$second");
	my $firstpaddlen = $len_first > $len_opsec ? $len_first : $len_opsec;
	my $numpaddlen = $paddlen > $firstpaddlen ? $paddlen : $firstpaddlen;
	#print both numbers
	print sprintf("%${numpaddlen}s", "$first")."\n";
	print sprintf("%${numpaddlen}s", "$op$second")."\n";
	if ($len_opsec - 1 > 1) {
		my $resultpadd = $numpaddlen;
		#print the first line when there are two
		my $b_print_line = 0;
		foreach my $digit (split(//, reverse($second))) {
			#memoize this multiplication, speeds things up for long numbers
			if (! $res[$digit]) {
				$res[$digit] = Math::BigInt->new($digit) * Math::BigInt->new($first);
			}
			#print the first line just once
			if ($b_print_line == 0) {
				my $len_prod = length($res[$digit]);
				my $firstlinepadd = $len_opsec > $len_prod ? $len_opsec : $len_prod;
				print sprintf("%${paddlen}s", "-" x $firstlinepadd)."\n";
				$b_print_line = 1;
			}
			#print each digit of second operand * first operand product
			print sprintf("%${resultpadd}s", $res[$digit]); 
			print "\n";
			$resultpadd--;
		}
	}
	print sprintf("%${numpaddlen}s", "-" x $paddlen) . "\n";
	print sprintf("%${numpaddlen}s", $result)."\n\n";
}

while (<>) {
	#get the number of tests
	if ($. == 1) {
		$t = $_;
	} else {
		$_ =~ /(\d{1,500})(\+|\-|\*)(\d{1,500})/;
		my $first = $1;
		my $op = $2;
		my $second = $3;
		if ($op =~ /(\+|\-)/) {
			add_sub($first, $second, $op);
		}
		else {
			mult($first, $second);
		}
	}
	last if $. > $t;
}
