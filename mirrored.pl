#!/usr/bin/env perl

while (<>) {
	#stop if line contains 2 spaces
	last if ($_ =~ /\ \ /);
	#first of all, print "Ready"
	if ($. == 1) {
		print "Ready\n";
	}
	if ($_ =~ /pq|qp|bd|db/) {
		print "Mirrored pair\n";
	}
	else {
		print "Ordinary pair\n";
	}
}
