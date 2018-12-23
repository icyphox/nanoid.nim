# nanoid.nim
> the Nim implementation of [NanoID](https://github.com/ai/nanoid)

[![Build Status](https://travis-ci.org/icyphox/nanoid.nim.svg?branch=master)](https://travis-ci.org/icyphox/nanoid.nim)

## What even?
NanoID is a tiny, secure URL-friendly unique string ID generator.  
It's **safe**. It uses cryptographically strong random APIs that guarantees proper distribution of symbols.  
And it's **compact**. It uses a larger alphabet than the standard UUID (`A-Za-z0-9_-`), and has a similar number of unique IDs in just 21 symbols instead of 36.

## Installation
```
nimble install nanoid
```

Optionally, run the test suite (after cloning this repo) using

```
nimble test
```

## Usage

### Simple

Uses the default alphabet set (`A-Za-z0-9_-`) and a size of 21 symbols.

```Nim
import nanoid

echo generate()  # RKF2A0-pGhJfpm6-rSi5C
```

### Non-secure

```Nim
import nanoid

echo generateNonSecure()  # SL8Zh8Lfw9TIRbaQI-DxB
```

### Custom alphabet/size

```Nim
import nanoid

let
  a = "abcdef12345"
  s = 10

echo generate(alphabet=a, size=10)  # 15aa1d2b3a
```

That’s it, really.

## TODO
- [ ] Async API

## Contributing
Bad code? New feature in mind? Open an issue. Better still, learn [Nim](https://nim-lang.org/documentation.html) and shoot a PR :sparkles:

## License
MIT © [Anirudh Oppiliappan](https://icyphox.sh)
