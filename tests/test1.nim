import unittest

import Echon
#[
  Hopefully enough tests to make this library not that buggy. Hopefully. :D
]#
test "generate l-systems":
  check generateSystem("A", @[(sym: 'A', word: "ABCA")], 0) == "ABCA"
  check generateSystem("A", @[(sym: 'A', word: "AB"), (sym: 'B', word: "CC")], 0) == "AB"
  check generateSystem("C", @[(sym: 'A', word: "AB"), (sym: 'B', word: "CC")], 0) == "C"
  check generateSystem("AA", @[(sym: 'A', word: "AB"), (sym: 'B', word: "CC")], 0) == "ABAB"
  check generateSystem("AA", @[(sym: 'A', word: "AB"), (sym: 'B', word: "CC")], 1) == "ABCCABCC"
  check generateSystem("ABC", @[(sym: 'A', word: "AB"), (sym: 'B', word: "CC")], 1) == "ABCCCCC"
  check generateSystem("A", @[(sym: 'A', word: "AA")], 5) == "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
