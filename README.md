erlang euler problems
=====

First problem
=====

The following iterative sequence is defined for the set of positive integers:

```
n → n/2 (n is even)
n → 3n + 1 (n is odd)
```

Using the rule above and starting with 13, we generate the following sequence:

`13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1`
It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.

Which starting number, under one million, produces the longest chain?

NOTE: Once the chain starts the terms are allowed to go above one million.

Tail Recursion
-----

```
solveCollatzByTailRecursion() -> solveCollatzByTailRecursion(2, 1, 1).
solveCollatzByTailRecursion(N, C, L) when N < 1000000 ->
  case collatz(N, 0) of
    Length when Length > L -> solveCollatzByTailRecursion(N+1, N, Length);
    _ -> solveCollatzByTailRecursion(N+1, C, L)
  end;

solveCollatzByTailRecursion(_, C, _) -> C.

collatz(1, N) -> N;
collatz(P, N) when P rem 2 =:= 0 -> collatz(P div 2, N+1);
collatz(P, N) -> collatz(P*3 + 1, N+1).
```

Recursion
-----

```
solveCollatzByRecursion() -> solveCollatzByRecursion(2, 1, 1).
solveCollatzByRecursion(N, C, L) when N < 1000000 ->
  case collatz(N) of
    Length when Length > L -> solveCollatzByRecursion(N+1, N, Length);
    _ -> solveCollatzByRecursion(N+1, C, L)
  end;

solveCollatzByRecursion(_, C, _) -> C.

collatz(1) -> 0;
collatz(N) when N rem 2 =:= 0 -> 1 + collatz(N div 2);
collatz(N) -> 1 + collatz(N*3 + 1).
```
  
Map generated sequence
-----
```
solveCollatzByMapGeneration()->
  CollatzCounts = lists:map(fun(X)-> {X, collatz_sequence_num_items(X)} end, lists:seq(2,1000000)),
  MaxCount = lists:max(lists:map(fun({_X,C}) -> C end, CollatzCounts)),
  FilteredTuple = lists:last(lists:filter(fun({_X,C}) -> C == MaxCount end, CollatzCounts)),
  _Value = element(1,FilteredTuple).
  
collatz_sequence_num_items(N) ->
  collatz_sequence_num_items(N, 0).
  
collatz_sequence_num_items(N, C) ->
  case N == 1 of
    true -> C;
    false ->
      case (N rem 2) == 0 of
        true -> collatz_sequence_num_items(N div 2, C+1);
        false -> collatz_sequence_num_items(3*N + 1, C+1)
      end
  end.
  ```
Second problem
=====
If the numbers 1 to 5 are written out in words: one, two, three, four, five, then there are `3 + 3 + 5 + 4 + 4 = 19` letters used in total.

If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?


NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20 letters. The use of "and" when writing out numbers is in compliance with British usage.

Map generated sequence
-----
```
solveP17ByMapGeneration() ->
  lists:sum(lists:map(fun number_length/1, lists:seq(1,1000))).

number_length(N) ->
  length(integer_to_word(N)).

integer_to_word(0) -> "";
integer_to_word(1) -> "one";
integer_to_word(2) -> "two";
integer_to_word(3) -> "three";
integer_to_word(4) -> "four";
integer_to_word(5) -> "five";
integer_to_word(6) -> "six";
integer_to_word(7) -> "seven";
integer_to_word(8) -> "eight";
integer_to_word(9) -> "nine";
integer_to_word(10) -> "ten";
integer_to_word(11) -> "eleven";
integer_to_word(12) -> "twelve";
integer_to_word(13) -> "thirteen";
integer_to_word(14) -> "fourteen";
integer_to_word(15) -> "fifteen";
integer_to_word(18) -> "eighteen";
integer_to_word(Teen) when Teen > 15 andalso Teen < 20 ->
  lists:append( [integer_to_word(Teen rem 10), "teen"]);

integer_to_word(20) -> "twenty";
integer_to_word(30) -> "thirty";
integer_to_word(40) -> "forty";
integer_to_word(50) -> "fifty";
integer_to_word(60) -> "sixty";
integer_to_word(70) -> "seventy";
integer_to_word(80) -> "eighty";
integer_to_word(90) -> "ninety";

integer_to_word(Tens) when Tens < 100 ->
  lists:append([integer_to_word((Tens div 10) * 10), integer_to_word(Tens rem 10)]);

integer_to_word(Hundreds) when Hundreds < 1000 ->
  And = case Hundreds rem 100 =:= 0 of
          true -> "";
          _Else -> "and"
        end,
  lists:append([integer_to_word(Hundreds div 100), "hundred", And, integer_to_word(Hundreds rem 100)]);

integer_to_word(1000) -> "onethousand".
```

Recursion
-----
```
solveP17ByRecursion() -> count(1000).

count(0) -> 0;
count(N) -> count_number(write(N)) + count(N-1).


count_number([]) -> 0;
count_number([H|T]) when H /= $\s andalso H /= $- -> 1+count_number(T);
count_number([_|T]) -> count_number(T).

write(1)    -> "one";
write(2)    -> "two";
write(3)    -> "three";
write(4)    -> "four";
write(5)    -> "five";
write(6)    -> "six";
write(7)    -> "seven";
write(8)    -> "eight";
write(9)    -> "nine";
write(10)   -> "ten";
write(11)   -> "eleven";
write(12)   -> "twelve";
write(13)   -> "thirteen";
write(14)   -> "fourteen";
write(15)   -> "fifteen";
write(16)   -> "sixteen";
write(17)   -> "seventeen";
write(18)   -> "eighteen";
write(19)   -> "nineteen";
write(20)   -> "twenty";
write(30)   -> "thirty";
write(40)   -> "forty";
write(50)   -> "fifty";
write(60)   -> "sixty";
write(70)   -> "seventy";
write(80)   -> "eighty";
write(90)   -> "ninety";
write(1000) -> "one thousand";
write(N) when N > 20, N < 100 -> write(N - N rem 10) ++ "-" ++ write(N rem 10);
write(N) when N >= 100, N rem 100 == 0 -> write(N div 100) ++ " hundred";
write(N) when N >= 100, N < 1000 -> write(N - N rem 100) ++ " and " ++ write(N rem 100).
```
