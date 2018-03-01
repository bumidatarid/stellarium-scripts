#!/usr/bin/perl
use strict;
use Parallel::ForkManager;

my $pm = new Parallel::ForkManager(2);

my $total = 2872;
my $trails = 360;

sub trailbrightness {
	my $n = shift;
	my $hour = ($n / $total * 24);
	if ($hour < 4) {
		return 100;
	} elsif ($hour < 5) {
		return 100 - ($hour - 4) * 100;
	} elsif ($hour < 19.5) {
		return 0;
	} elsif ($hour < 20.5) {
		return ($hour - 19.5) * 100;
	} else {
		return 100;
	}
}

#foreach my $picnum (1..$total ) {
foreach my $picnum (478..719, 2333..2573) {
	my $pid = $pm->start and next;
	my $b = trailbrightness($picnum);
	my $cmdtrail = '';
	my $cmdmilky = '';
	print "processing $picnum, trail brightness $b\n";

	if ($b > 0) {
		$cmdtrail = sprintf('\( work/%05d-trail.tif ', $picnum);
		foreach my $seq (0..$trails) {
			my $n = ($picnum - 2 - $seq + $total ) % $total + 1;
			$cmdtrail .= sprintf('\( work/%05d-trail.tif -brightness-contrast -%d \) -compose Lighten -composite ', $n, 100 * $seq/$trails);
		}
		$cmdtrail .= sprintf(' -brightness-contrast -%d \) mask.png -compose Lighten -composite ', 100-$b);
		$cmdmilky .= sprintf(' \( work/%05d-milkyway.tif -brightness-contrast -%d \) -compose Lighten -composite ', 100-$b, $picnum);
	}

	#system sprintf('convert work/%05d-star.tif %s %s watermark.png -compose src-over -composite work/%05d.png', $picnum, $cmdtrail, $cmdmilky, $picnum, $picnum);
	system sprintf('convert work/%05d-star.tif %s %s work/%05d.png', $picnum, $cmdtrail, $cmdmilky, $picnum, $picnum);
	#exit;
	print "done processing $picnum\n";
	$pm->finish;
}
