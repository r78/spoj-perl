while (<>) {
	if ($. == 1) {
		$n = $_;
		$s = 0;
	}
	else {
		$s += $_ unless $_ < 0;
	}
	last if $. > $n;
}
print $s."\n";
