#!/usr/bin/env perl

use strict;
use warnings;
use XOR;

my $xor = XOR->new(
  root => '.',
  org  => 'perlwasm',
  site_name => 'PerlWasm',
);
$xor->builder->build;
