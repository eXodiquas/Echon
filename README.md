# Echon
A simple library to generate L-systems for [Nim](https://nim-lang.org/).

Just call ```generateSystem(start: string, p: seq[Prule], cycle: int)``` where ```start``` is your intial word, ```p``` is a seq of replacement rules like ```(sym: 'A', word: "Hello World!")``` and ```cycle``` is the number of recursions before the function returns its result.

For example you get something like this:
```
  check generateSystem("A", @[(sym: 'A', word: "ABCA")], 0) == "ABCA"
  check generateSystem("A", @[(sym: 'A', word: "AB"), (sym: 'B', word: "CC")], 0) == "AB"
  check generateSystem("C", @[(sym: 'A', word: "AB"), (sym: 'B', word: "CC")], 0) == "C"
  check generateSystem("AA", @[(sym: 'A', word: "AB"), (sym: 'B', word: "CC")], 0) == "ABAB"
  check generateSystem("AA", @[(sym: 'A', word: "AB"), (sym: 'B', word: "CC")], 1) == "ABCCABCC"
  check generateSystem("ABC", @[(sym: 'A', word: "AB"), (sym: 'B', word: "CC")], 1) == "ABCCCCC"
  check generateSystem("A", @[(sym: 'A', word: "Hello World!")], 0) == "Hello World"
```

If something is unclear, please let me know.
