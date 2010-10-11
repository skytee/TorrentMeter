#!/usr/bin/perl

use strict;
use warnings;

use POSIX qw(strftime);
use Time::HiRes qw(gettimeofday usleep);
my $interval = 1;
my $dev = @ARGV ? shift : 'eth0';
my $dir = "/sys/class/net/$dev/statistics";
my %stats = do {
    opendir +(my $dh), $dir;
    local @_ = "rx_bytes"; #readdir $dh;
    closedir $dh;
    map +($_, []), grep !/^\.\.?$/, @_;
};

    while (1) {
        print run();
        my ($time, $us) = gettimeofday();
        local $| = 1;
        usleep($us ? 1000000 - $us : 1000000);
    }

sub run {
    map {
        chomp (my ($stat) = slurp("$dir/$_"));
        my $line = "";
        $line .= sprintf '%03s', int (($stat - $stats{$_}->[0]) / ($interval * 1024 * 128))
            if @{$stats{$_}} > $interval-1;
        unshift @{$stats{$_}}, $stat;
        pop @{$stats{$_}} if @{$stats{$_}} > 60;
        "$line\n";
    } sort keys %stats;
}

sub slurp {
    local @ARGV = @_;
    local @_ = <>;
    @_;
}

