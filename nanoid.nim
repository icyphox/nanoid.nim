import math
import lenientops

const alphabet = "_~0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
const size = 21

proc generate*(alphabet: string = alphabet, size: int = size): string =
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
  var nanoID = ""

  while true:
    let randomBytes: seq[byte] = urandom(step)
    for i in countUp(0, step):
      let randByte = randomBytes[i].int and mask
      if randByte < len(alphabet):
        if alphabet[randByte] in alphabet:
          nanoID.add(alphabet[randByte])
          if len(nanoID) >= size:
            result = nanoID

when isMainModule:
  echo(generate())
