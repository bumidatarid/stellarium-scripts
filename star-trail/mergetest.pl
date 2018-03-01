#!/usr/bin/perl
use strict;
use Parallel::ForkManager;

my $total = 2872;
my $trails = 360;

sub trailbrightness {
	my $n = shift;
	my $hour = (($n / $total) * 24);
	#print "$hour\n";
	if ($hour < 5) {
		return 100;
	} elsif ($hour < 6) {
		return 100 - ($hour - 5) * 100;
	} elsif ($hour < 18) {
		return 0;
	} elsif ($hour < 19) {
		return ($hour - 18) * 100;
	} else {
		return 100;
	}
}

foreach my $picnum (1..$total) {
	my $b = trailbrightness($picnum);
	print "$picnum, trail brightness $b\n";
}
