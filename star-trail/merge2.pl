#!/usr/bin/perl
use strict;

foreach my $picnum (1..2880) {
#foreach my $picnum (1..100) {
	print "processing $picnum ";
	my $cmd = 'convert -limit memory 1GiB ';
	foreach my $seq (0..360) {
		print ".";
		my $n = ($picnum -1 - $seq + 2880) % 2880 + 1;
		$cmd .= sprintf('work/%05d-trail.tif ', $n);
	}
	$cmd .= sprintf('-compose Lighten -composite %05d-combinedtrail.tif', $picnum);
	system $cmd;
	print "/";
	system sprintf('convert work/%05d-combinedtrail.tif work/%05d-star.tif -compose Lighten -composite work/%05d-milkyway.tif  -compose Lighten -composite work/%05d.png', $picnum, $picnum, $picnum, $picnum);
	print "\n";
	#exit;
}
