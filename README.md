[![Actions Status](https://github.com/raku-community-modules/Pythonic-Str/workflows/test/badge.svg)](https://github.com/raku-community-modules/Pythonic-Str/actions)

NAME
====

Pythonic::Str - Index into strings like Pythonistas do!

SYNOPSIS
========

```raku
use Pythonic::Str;

say 'foobar'[3];            # b
say 'foobar'[3..*];         # bar
say 'foobar'[^3];           # foo
say 'foobar'[3,5,6]:exists; # (True True False)
```

DESCRIPTION
===========

Provides `&postcircumfix:<[ ]>` candidates to index into strings. Any indexing operation you normally can use on lists is supported.

When multiple indices are given, the result will be calculated as if the indexing were called on a list of individual characters that compose the given string. **If all the elements** nodally are of type `Str` or `Nil` (excluding `Failure`s), then the result will be joined together to form a single string. Any other type of the output is returned as if it were called on a list of individual characters that compose the given string.

In plainer language this means that you get a single string result for stuff like:

```raku
say 'foobar'[^3];           # foo
say 'foobar'[0, 1, 2];      # foo
say 'foobar'[0, (1, (2,))]; # foo
```

... but will get the same result as if you called indexing on a list of characters for stuff like:

```raku
say 'foobar'[^3]:p;           # (0 => f 1 => o 2 => o)
say 'foobar'[0, 1, 2]:exists; # (True True True)
say WHAT 'foobar'[1]:delete;  # (Failure)
```

LIMITATIONS
===========

This module does not provide `Str.AT-POS` or make `Str` type do `Positional` or `Iterable` roles. The latter causes all sorts of fallout with core and non-core code due to inherent assumptions that `Str` type does not do those roles. What this means in plain English is you can only index your strings with `[...]` postcircumfix operator and can't willy-nilly treat them as lists of characters—simply. Call [`.comb`](https://docs.raku.org/routine/comb) if you need that.

SEE ALSO
========

  * [`Str.comb`](https://docs.raku.org/routine/comb)

  * [`Str.substr`](https://docs.raku.org/routine/substr)

AUTHOR
======

Zoffix Znet

COPYRIGHT AND LICENSE
=====================

Copyright 2017 Zoffix Znet

Copyright 2018 - 2022 Raku Community

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

