#!/usr/bin/env perl6
use lib <lib ../lib>;

use Pythonic::Str;

say 'foobar'[3];            # b
say 'foobar'[3..*];         # bar
say 'foobar'[^3];           # foo
say 'foobar'[3,5,6]:exists; # (True True False)
