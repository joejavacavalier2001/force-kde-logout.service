#!/usr/bin/perl
use Linux::Inotify2;

my $inotify = new Linux::Inotify2;

$inotify->watch ("/usr/bin/plasma-shutdown",IN_OPEN, sub {
	my $e = shift;
	$e->w->cancel;
	exec "/usr/bin/systemctl", "restart", "sddm" 
});
$inotify->poll while 1;

