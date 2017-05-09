[![Build Status](https://travis-ci.org/zoffixznet/perl6-Pythonic-Str.svg)](https://travis-ci.org/zoffixznet/perl6-Pythonic-Str)

# NAME

Pythonic::Str - Index into strings like Pythonists do!

# SYNOPSIS

```perl6
    use Pythonic::Str;

    say 'foobar'[3];            # b
    say 'foobar'[3..*];         # bar
    say 'foobar'[^3];           # foo
    say 'foobar'[3,5,6]:exists; # (True True False)
```

# DESCRIPTION

Provides `&postcircumfix:<[ ]>` candidates to index into strings. Any
indexing operation you normally can use on lists is supported.

When multiple indices are given, the result will be a single string
**if all the elements** are of type `Str` or `Nil` (excluding `Failures`).
Any other type of the output is returned as if it were called on a list
of individual characters that compose the given string.

# LIMITATIONS

This module does not provide `Str.AT-POS` or make `Str` type do `Positional`
or `Iterable` roles. The latter causes all sorts of fallout with core and
non-core code due to inherent assumptions that `Str` type does not do
those roles. What this means in plain English is you can only index your
strings with `[...]` postcircumfix operator and can't willy-nilly treat
them as lists of characters—simply call
[`.comb`](https://docs.perl6.org/routine/comb) if you need that.

# SEE ALSO

- [`LWP::Simple`](https://modules.perl6.org/repo/LWP::Simple)
- [`HTTP::UserAgent`](https://modules.perl6.org/repo/HTTP::UserAgent)

----

#### REPOSITORY

Fork this module on GitHub:
https://github.com/zoffixznet/perl6-WWW

#### BUGS

To report bugs or request features, please use
https://github.com/zoffixznet/perl6-WWW/issues

#### AUTHOR

Zoffix Znet (http://perl6.party/)

#### LICENSE

You can use and distribute this module under the terms of the
The Artistic License 2.0. See the `LICENSE` file included in this
distribution for complete details.

The `META6.json` file of this distribution may be distributed and modified
without restrictions or attribution.
