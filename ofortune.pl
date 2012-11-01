#!/usr/bin/env perl
use strict;

#calculate the final amount of a compound interest operation
sub compound_interest {
	my ($years, $fund, $interest_rate, $operation_charge) = @_;
	my $int = 0;
	for (my $i = 0; $i < $years; $i++) {
		$int = int($fund * $interest_rate);
		$fund += $int - $operation_charge;
	}
	return $fund;
}

#calculate the final amount of a simple interest operation
sub simple_interest {
	my ($years, $fund, $interest_rate, $operation_charge) = @_;
	my $int = 0;
	for (my $i = 0; $i < $years; $i++) {
		$int += int($fund * $interest_rate);
		$fund -= $operation_charge;
	}
	return $fund + $int;
}

my $n;
my $fund;
my $years;
my $operations;
my @params;
my $case_line = 0;
my $max_final_amount = 0;
my $amount;

while (<>) {
	chomp($_);
	if ($. == 1) {
		$n = $_;
	}
	else {
		#read 3 lines
		if ($case_line == 0) {
			$fund = $_;	
			$case_line++;
		}
		elsif ($case_line == 1) {
			$years = $_;
			$case_line++;
		}
		elsif ($case_line == 2) {
			#get the number of operations
			$operations = $_;
			$case_line++;
		}
		else {
			#read n operations and work with them
			my ($b_compound, $interest_rate, $operation_charge) = split(/\ /, $_);
			if ($b_compound == 0) {
				$amount = simple_interest($years, $fund, $interest_rate, $operation_charge);
				$max_final_amount = $amount > $max_final_amount ? $amount : $max_final_amount;
			}
			else {
				$amount = compound_interest($years, $fund, $interest_rate, $operation_charge);
				$max_final_amount = $amount > $max_final_amount ? $amount : $max_final_amount;
			}
			$operations--;
			if ($operations == 0) {
				#print the maximum final amount
				print $max_final_amount."\n";
				$case_line = 0;
				$max_final_amount = 0;
				$n--;
			}
		}
		#start again
	}
	#exit after n cases
	last if $n <= 0;  
}
