#!/usr/bin/perl
use strict;

foreach my $picnum (1..2880) {
#foreach my $picnum (1..100) {
	print "processing $picnum ";
	#my $cmd = 'convert ';
	system sprintf('/bin/cp -f work/%05d-trail.tif work/%05d-combinedtrail.tif', $picnum, $picnum);
	foreach my $seq (0..360) {
		print ".";
		my $n = ($picnum -1 - $seq + 2880) % 2880 + 1;
		#print $n, "\n";
		#push(@trails, $n);
		#$cmd .= sprintf('work/%05d-trail.tif ', $n);
		#print sprintf('mogrify -draw work/%05d-trail.tif -compose Lighten -composite %05d-combinedtrail.tif', $n, $picnum), "\n";
		system sprintf('convert work/%05d-combinedtrail.tif work/%05d-trail.tif -compose Lighten -composite %05d-combinedtrail-tmp.tif' , $picnum, $n, $picnum);
		system sprintf('/bin/mv %05d-combinedtrail-tmp.tif work/%05d-combinedtrail.tif', $picnum, $picnum);
	}
	#$cmd .= sprintf('-compose Lighten -composite %05d-combinedtrail.tif');
	#print $cmd, "\n";
	print "/";
	system sprintf('convert work/%05d-combinedtrail.tif work/%05d-star.tif -compose Lighten -composite work/%05d-milkyway.tif  -compose Lighten -composite work/%05d.png', $picnum, $picnum, $picnum, $picnum);
	print "\n";
	#exit;
}
