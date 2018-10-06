import
  unittest,
  ../src/nanoid

suite "nanoid Test Suite":
  test "has correct size":
    let count = 100
    for i in countUp(0, count):
      check(len(generate()) == 21)

  test "has no collisions for 10k entries as 21 chars long":
    let count = 100_000
    var generated: seq[string] = @[]
    for i in countUp(0, count):
      var id = generate()
      generated.add(id)
    check(generate() in generated == false)
