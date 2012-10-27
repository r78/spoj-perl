#!/usr/bin/env perl
use strict;
my $t;
#operator stack
my @stack;
#output stack
my @out;
#hash with operators' precedence
my %prec = ('^' => 4, '*' => 3, '/' => 3, '+' => 2, '-' => 2, '(' => 0);

while (<>) {
	#get the number of tests
	if ($. == 1) {
		$t = $_;
	} else {
		#process each token in the expression
		foreach my $token (split(//, $_)) {
			#push digits into output stack
			if ($token =~ /[a-z]/) {
				push(@out, $token);
			}
			#push left parenthesis into operator stack
			elsif ($token eq '(') {
				push(@stack, $token);
			}
			#if we find a right parenthesis we move elements from the operator 
			#stack into the output stack until we find a left parenthesis
			elsif ($token eq ')') {
				while ($stack[-1] ne '(') {
					push(@out, pop(@stack));
				}
				pop(@stack);
			}
			#if the next element is an operator
			elsif ($prec{$token} > 0) {
				#if it's ^ we move elements from the operator stack into the 
				#output stack until we find an operator with less precedence
				if ($prec{$token} == 4) {
					while (@stack and $prec{$token} < $prec{$stack[-1]}) {
						push(@out, pop(@stack));
					}
				}
				#if it's another operator we move elements from the operator stack into 
				#the output stack until we find an operator with equal or less precedence
				else {
					while (@stack and $prec{$token} <= $prec{$stack[-1]}) {
						push(@out, pop(@stack));
					}
				}
				#and we move the token to the operator stack
				push(@stack, $token);
			}
		}
		#print the output stack and empty it
		print @out;
		@out = ();
		print "\n";
	}
	last if ($. > $t);
}
