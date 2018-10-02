# nanoid.nim
> the Nim implementation of [NanoID](https://github.com/ai/nanoid)

## What even?
NanoID is a tiny, secure URL-friendly unique string ID generator.  
It's **safe**. It uses cryptographically strong random APIs that guarantees proper distribution of symbols.  
And it's **compact**. It uses a larger alphabet than the standard UUID (`A-Za-z0-9_~`), and has a similar number of unique IDs in just 21 symbols instead of 36.

## Installation
```
nimble install nanoid
```
## Usage

### Simple

Uses the default alphabet set (`A-Za-z0-9_~`) and a size of 21 symbols.

```Nim
import nanoid

echo generate() # CfUfFZ~aAVIMUH2Q~VPGg
```

### Custom alphabet/size

```Nim
import nanoid

let a = "abcdef12345"
let s = 10

echo generate(alphabet=a, size=10) # 15aa1d2b3a
```

That's it, really. 
