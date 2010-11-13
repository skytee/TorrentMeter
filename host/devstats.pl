#!/usr/bin/perl
#
#	This file is part of a Torrentmeter software package,
#	hereafter TSP.
#
#	TSP is licensed under free software, you can redistribute it and/or modify
#	it under the terms of the GNU General Public License as published by
#	the Free Software Foundation, either version 2 of the License, or
#	(at your option) any later version.
#
#	TSP is distributed in the hope that it will be useful,
#	but WITHOUT ANY WARRANTY; without even the implied warranty of
#	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#	GNU General Public License for more details.
#
#	You should have received a copy of the GNU General Public License
#	along with TSP.  If not, see <http://www.gnu.org/licenses/>.
#
#	2010, Thorsten Haas, github@skytee.com

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

