#!/usr/bin/perl
use strict;

my $total = 2872;
my $trails = 360;

foreach my $picnum (1..$total) {
	print "processing $picnum ";
	my $cmd = sprintf('work/%05d-trail.tif ', $picnum);
	foreach my $seq (0..$trails) {
		print ".";
		my $n = ($picnum - 2 - $seq + $total ) % $total + 1;
		#my $n = ($picnum - 2 - $seq + 2880 - ((2880+1-$picnum)/2880 * 2880/360)) % 2880 + 1;
		$cmd .= sprintf('\( work/%05d-trail.tif -brightness-contrast -%d \) -compose Lighten -composite ', $n, 100 * $seq/$trails);
	}
	print "/";
	system sprintf('convert \( %s \) work/%05d-star.tif -compose Lighten -composite work/%05d-milkyway.tif  -compose Lighten -composite watermark.png -compose src-over -composite work/%05d.png', $cmd, $picnum, $picnum, $picnum, $picnum);
	print "\n";
	#exit;
}
