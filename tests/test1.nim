import
  unittest,
  ../src/nanoid

suite "Test suite for size":
  setup:
    let count = 100

  test "Generates IDs of size 21":
    for i in countUp(0, count):
      check(len(generate()) == 21)

  test "Generates IDs of size 10":
    for i in countUp(0, count):
      check(len(generate(size=10)) == 10)

  test "Generates IDs of size 21 with custom alphabet (abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ)":
      check(len(generate(alphabet="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ")) == 21)

suite "Test suite for collisions":
  setup:
    echo("This might take a while")
    let count = 100_000

  test "has no collisions for 10k entries as 21 chars long":
    var generated: seq[string] = @[]
    for i in countUp(0, count):
      var id = generate()
      generated.add(id)
    check(generate() in generated == false)

  test "has no collisions for million entries as 9 chars and base alphabet":
    let 
      size = 9
      alphabet = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
    var generated: seq[string] = @[]
    for i in countUp(0, count):
      var id = generate(size=size, alphabet=alphabet)
      check(len(id) == 9)
      generated.add(id)
    check(generate() in generated == false)
