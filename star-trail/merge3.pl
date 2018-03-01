#!/usr/bin/perl
use strict;
my $batch = 360;

foreach my $picnum (1..2880) {
	print "processing $picnum ";
	system sprintf('/bin/cp -f work/%05d-trail.tif work/%05d-combinedtrail.tif', $picnum, $picnum);
	foreach my $seq (0..(360/$batch)) {
		print ".";
		my $cmd = sprintf('convert work/%05d-combinedtrail.tif ', $picnum);
		foreach my $x ($seq..($seq+$batch-1)) {
			my $n = ($picnum -10 - $x + 2880) % 2880 + 1;
			$cmd .= sprintf('work/%05d-trail.tif -compose Lighten -composite ', $n);
		}
		$cmd .= sprintf('work/%05d-combinedtrail-tmp.tif ', $picnum);
		system($cmd);
		system sprintf('/bin/mv work/%05d-combinedtrail-tmp.tif work/%05d-combinedtrail.tif', $picnum, $picnum);
	}
	print "/";
	system sprintf('convert work/%05d-combinedtrail.tif work/%05d-star.tif -compose Lighten -composite work/%05d-milkyway.tif  -compose Lighten -composite work/%05d.png', $picnum, $picnum, $picnum, $picnum);
	print "\n";
	#exit;
}
