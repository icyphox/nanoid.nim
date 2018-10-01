import 
  sequtils,
  strutils

proc urandom*(n: int): seq[char] =
  var f = open("/dev/urandom")
  var r: int
  discard f.readBuffer(addr r, n)
  close(f)
  result = @($r)
