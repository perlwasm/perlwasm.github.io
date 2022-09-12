# Home of the Perl Wasm Project

The goal of the Perl Wasm project is for Perl and WebAssembly to be able to call each other transparently
without having to know or care which module is implemented ion which langauge.  Using M<Wasm>, Perl
subroutines and WebAssembly functions can easily be imported and exported between both Perl and WebAssembly.

```perl
package MathStuff; 
use strict;
use warnings;
use base qw( Exporter );
use Wasm
  -api => 0,
  -exporter => 'ok',
  -wat => q{
    (module
      (func (export "add") (param i32 i32) (result i32)
        local.get 0
        local.get 1
        i32.add)
      (func (export "subtract") (param i32 i32) (result i32)
        local.get 0
        local.get 1
        i32.sub)
      (memory (export "frooble") 2 3)
    )
  };
1;
```

```perl
use MathStuff qw( add subtract );
print add(1,2), "\n";      # prints 3
print subtract(3,2), "\n", # prints 1
```

The current implementation uses [wasmtime.dev](https://wasmtime.dev/).  The API is structured on two levels.
The module M<Wasm> allows simply importing WebAssembly functions into your Perl code without having to know
or care about the lowerlevel M<Wasm::Wasmtime>.  M<Wasm::Wasmtime> in contrast provides a powerful low level
interface for interacting with WebAssembly.

## Resources hosted here

 * [📖 Perl Wasm Documentation](/pod/)

## External Links

 * #️⃣ [#native on irc.perl.org](https://kiwiirc.com/nextclient/#irc://irc.perl.org/#native?nick=mc-guest-?)
 * 🌏 [perlwasm organization on GitHub](https://github.com/perlwasm)
