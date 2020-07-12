import sequtils

type
  ## A tuple that represents a replacement rule for the l-system.
  Prule* = tuple
    sym: char
    word: string



proc generateSystem*(start: string, p: seq[Prule], cycle: int): string =
  ## Takes a starting word, a seq of rules and a int for the number of recurring cycles 
  ## and produces a string that represents the input string after the l-system transformations.

  var res = ""
  
  #[
    Checks if there is a rule that applies to the current char c in the current word. 
    If so apply the first rule that matches the character. 
    If there is no such rule just write the character as it is.
  ]#
  for c in start:
    let interm = filter(p, proc (x: Prule): bool = x[0] == c)
    if interm.len > 0:
      res.add(interm[0][1])
    else:
      res.add(c)
  
  #[
    Checks if we are at the right recursion depth, if so return the final result.
    If not recur with the new result as input string, the same rules and cycle reduced by 1.
  ]#
  if cycle == 0:
    res
  else:
    generateSystem(res, p, cycle - 1)
  
