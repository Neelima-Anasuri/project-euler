#!/usr/bin/perl

# Daniel "Trizen" Șuteu
# License: GPLv3
# Date: 01 May 2017
# https://github.com/trizen

# https://projecteuler.net/problem=581

# Runtime: 1 min, 41 sec

=for comment

Maximum value of n in the p-smooth T(n), is given by: A002072(prime_count(p)).

For p=47, the maximum value of n is 1109496723125.

Using the same idea from problem 204, we generate 47-smooth numbers not exceeding this limit.
Then for each 47-smooth number n, we check n+1 to see if is also 47-smooth.

=cut

use 5.010;
use strict;
use warnings;

use ntheory qw(valuation primes);

my $smooth = 47;
my @primes = @{primes($smooth)};

sub is_smooth {
    my ($n) = @_;

    foreach my $p (@primes) {
        my $v = valuation($n, $p);
        if ($v != 0) {
            $n /= $p**$v;
            return 1 if $n == 1;
        }
    }

    $n == 1;
}

my %seen;
my $sum    = 0;
my @smooth = (1);

foreach my $p (@primes) {
    say "$p -> $sum";
    foreach my $n (@smooth) {
        if (!exists($seen{$n}) and is_smooth($n+1)) {
            undef $seen{$n};
            $sum += $n;
        }

        if ($n*$p <= 1109496723125) {
            push @smooth, $n*$p;
        }
    }
}

say "Sum: $sum";
