import 
  random,
  lenientops,
  math

let a = "_-0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
var s = 21

proc generateNonSecure*(alphabet: string = a, size: int = s): string =
  result = ""
  randomize()
  for i in countup(0, size-1):
    result &= alphabet[(rand(1.0) * len(alphabet)).int]

