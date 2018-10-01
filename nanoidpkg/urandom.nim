proc urandom*(): int =
  var f = open("/dev/urandom")
  var r: int
  
  discard f.readBuffer(addr r, 4)
  close(f)
  result = r
