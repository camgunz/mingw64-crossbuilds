# mingw64-builds

This is a small repository of scripts that compile various libraries using
MinGW-w64.

## Compilation

Compilation on Windows is a work-in-progress.  mingw64-builds was originally
designed as a cross-compilation repository, but its target has since switched
to native compilation.

## Cross-Compilation

It is essentially impossible to cross-compile GObject Introspection.  At some
point I'll probably add a check for cross-compilation and skip GI and LGI (Lua
GObject Introspection).  In the meantime, support for cross-compilation is
suspended.

## Choices

I chose some libraries over others, what follows is a justification.  Largely
though, I'm using this specifically for a GPL, SDL (not SDL 2.0), C project,
and that is the main justification.

### MAD over SMPEG

SMPEG is a C++ library that even Ryan Gordon says shouldn't be used (because
its threading is a mess).  It's also notoriously difficult to cross-compile.

### PolarSSL over OpenSSL (or GnuTLS)

PolarSSL hasn't had large security compromises over the last couple months;
OpenSSL and GnuTLS have, and if I'm going to use a TLS implementation with
bugs, I want it to compile nicely and be readable.

### MikMod over ModPlug

I like that ModPlug works on Android, however, it's a C++ project and linking
it into a C project is hackish ("use `g++` for linking...", just how am I
supposed to reasonably do that in any build system...?).

## Hacks

I've hacked a couple of libraries in order to get them to work.  These hacks
can be found in `patches`.  They're not extensive, but they are absolutely
necessary.  The scripts in `modules` also contain various hacks.  What I'm
trying to say here is, this isn't just a repo with a couple loops in bash; I
had to spend four solid days hacking libs and pulling one out for another so
that everything would work right, statically or dynamically.

## "Can I use it?"

If you don't mind using the GPL then yes!  Otherwise you'll want to swap out
PolarSSL and MAD.

You should be able to customize your configuration in `config.sh`.  If things
go wrong, fix it and send a pull request; I'll be happy to accept improvements.

