import
  unittest,
  ../src/nanoid

suite "Non-secure":
  test "Generates correct length":
    check(generateNonSecure("a", 5) == "aaaaa")

  test "Has no collisions for 10k entries":
    var generated: seq[string] = @[]
    for i in countup(0, 10_000):
      var id = generateNonSecure()
      generated.add(id)
    check(generate() in generated == false)
  
