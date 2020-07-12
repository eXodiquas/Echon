# This is just an example to get you started. A typical library package
# exports the main API in this file. Note that you cannot rename this file
# but you can remove it if you wish.

import sequtils

type
  Prule* = tuple
    sym: char
    word: string

proc generateSystem*(start: string, p: seq[Prule], cycle: int): string =
  var res = ""
  
  for c in start:
    let interm = filter(p, proc (x: Prule): bool = x[0] == c)
    if interm.len > 0:
      res.add(interm[0][1])
    else:
      res.add(c)
  
  if cycle == 0:
    res
  else:
    generateSystem(res, p, cycle - 1)
  
