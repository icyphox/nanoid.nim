import nanoid, unittest

suite "nanoid Test Suite":
  test "has correct size":
    let count = 100
    for i in countUp(0, count):
      check(len(generate()) == 21)

