# Only look up original postcircumfix[] once
my &cpcf := CORE::{'&postcircumfix:<[ ]>'};

proto sub postcircumfix:<[ ]> (|) is export {*}
multi sub postcircumfix:<[ ]>(Str:D $string, Int:D $pos, *%_) {
    %_
      ?? (nextsame)
      !! ($string.substr($pos, 1) || Nil)
}
multi sub postcircumfix:<[ ]>(Str:D $string, |c) is default {
    my $r := cpcf($string.comb.cache, |c);
    $r ~~ Failure || $r.flat.first({ $_ ~~ any Failure, none Nil, Str }) !=== Nil
        ?? $r
        !! $r.flat.grep(*.defined).join
}
multi sub postcircumfix:<[ ]>(|c) { cpcf(|c) }

=begin pod

=head1 NAME

Pythonic::Str - Index into strings like Pythonistas do!

=head1 SYNOPSIS

=begin code :lang<raku>

use Pythonic::Str;

say 'foobar'[3];            # b
say 'foobar'[3..*];         # bar
say 'foobar'[^3];           # foo
say 'foobar'[3,5,6]:exists; # (True True False)

=end code

=head1 DESCRIPTION

Provides C<&postcircumfix:<[ ]>> candidates to index into strings. Any
indexing operation you normally can use on lists is supported.

When multiple indices are given, the result will be calculated as if the
indexing were called on a list of individual characters that compose the given
string. B<If all the elements> nodally are of type C<Str> or C<Nil> (excluding
C<Failure>s), then the result will be joined together to form a single string.
Any other type of the output is returned as if it were called on a list
of individual characters that compose the given string.

In plainer language this means that you get a single string result for stuff
like:

=begin code :lang<raku>

say 'foobar'[^3];           # foo
say 'foobar'[0, 1, 2];      # foo
say 'foobar'[0, (1, (2,))]; # foo

=end code

... but will get the same result as if you called indexing on a list of
characters for stuff like:

=begin code :lang<raku>

say 'foobar'[^3]:p;           # (0 => f 1 => o 2 => o)
say 'foobar'[0, 1, 2]:exists; # (True True True)
say WHAT 'foobar'[1]:delete;  # (Failure)

=end code

=head1 LIMITATIONS

This module does not provide C<Str.AT-POS> or make C<Str> type do
C<Positional> or C<Iterable> roles. The latter causes all sorts of fallout
with core and non-core code due to inherent assumptions that C<Str> type
does not do those roles. What this means in plain English is you can only
index your strings with C<[...]> postcircumfix operator and can't
willy-nilly treat them as lists of characters—simply.  Call
L<C<.comb>|https://docs.raku.org/routine/comb> if you need that.

=head1 SEE ALSO

=item L<C<Str.comb>|https://docs.raku.org/routine/comb>
=item L<C<Str.substr>|https://docs.raku.org/routine/substr>

=head1 AUTHOR

Zoffix Znet

=head1 COPYRIGHT AND LICENSE

Copyright 2017 Zoffix Znet

Copyright 2018 - 2022 Raku Community

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

=end pod

# vim: expandtab shiftwidth=4
