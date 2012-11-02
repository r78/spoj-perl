#!/usr/bin/env perl

my $min_boxes;
my $ct_screws;
my $nboxes;
my $screws;
my $tables;

while (<>) {
	chomp($_);
	if ($. == 1) {
		$min_boxes = 0;
		$ct_screws = 0;
		#get the number of boxes, the number of screws per table
		#and the number of tables
		($nboxes, $screws, $tables) = split(/\ /, $_);
	}
	elsif ($. == 2) {
		#get the minimum number of boxes to build the tables
		@boxes = reverse(sort {$a <=> $b} (split(/\ /, $_)));
		for (my $i = 0; $i < scalar(@boxes); $i++) {
			if ($ct_screws < $screws * $tables) {
				$ct_screws += $boxes[$i];
				$min_boxes++;
			}
		}
		#make sure there are enough screws in the boxes
		if ($ct_screws >= $screws * $tables) {
			print $min_boxes ."\n";
		}
	}
}
