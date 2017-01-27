#!/usr/bin/perl

# Daniel "Trizen" Șuteu
# License: GPLv3
# Date: 27 January 2017
# https://github.com/trizen

# https://projecteuler.net/problem=30

# Runtime: 1.199s

use 5.010;
use strict;
use ntheory qw(vecsum);

# The limit can be found by solving for `k` in the inequality:
#  10^k >= k * 9^5

my $sum = 0;
my $k   = 5.5125663792347502874;

foreach my $n (2 .. 10**$k) {
    if (vecsum(map { $_**5 } split //, $n) == $n) {
        $sum += $n;
    }
}

say $sum;
