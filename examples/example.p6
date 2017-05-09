#!/usr/bin/env perl6
use lib <lib ../lib>;

use Pythonic::Str;

say 'foobar'[^3]:p;           # (0 => f 1 => o 2 => o)
say 'foobar'[0, 1, 2]:exists; # (True True True)
