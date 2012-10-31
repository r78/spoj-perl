#!/usr/bin/env perl
use strict;

while (<>) {
	chomp($_);
	next if $_ =~ /^$/;
	#a C identifier
	if ($_ =~ /[a-z]{1,}[_]{1}/) {
		if ($_ !~ /(^_|_$)|_{2,}|[A-Z]/) {
			s/_([a-z])/uc($1)/ge;
			print $_;
		}
		else {
			print "Error!";
		}
	}
	#a java identifier
	elsif ($_ =~ /^[a-z]{1}[A-Za-z]{1,}$/) {
		s/([A-Z])/"_".lc($1)/ge;
		print $_;
	}
	#one-letter identifier
	elsif ($_ =~ /^[a-z]$/) {
		print $_;
	}
	else {
		print "Error!";
	}
	print "\n";
}
