import
  math,
  lenientops,
  pkg/random,
  nanoid/nonsecure

export
  nonsecure

let a = "_-0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
let s = 21

proc generate*(alphabet: string = a, size: int = s): string =
  if alphabet == "":
    result = ""
  if size < 1:
    result = ""

  let masks = [15, 31, 63, 127, 255]
  var mask: int = 1

  for m in masks:
    if m >= len(alphabet) - 1:
      mask = m
      break

  var step = int(ceil(1.6 * mask * size / len(alphabet)))
  var nanoID: string

  while true:
    var randomBytes: seq[byte]
    randomBytes = urandom(step)
    for i in countUp(0, step-1):
      var randByte = randomBytes[i].int and mask
      if randByte < len(alphabet):
        if alphabet[randByte] in alphabet:
          nanoID.add(alphabet[randByte])
          if len(nanoID) >= size:
            return nanoID

