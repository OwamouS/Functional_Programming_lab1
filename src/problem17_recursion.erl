%%%-------------------------------------------------------------------
%%% @author SMash
%%% @copyright (C) 2023, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 15. февр. 2023 14:44
%%%-------------------------------------------------------------------
-module(problem17_recursion).
-author("SMash").

%% API
-export([solveP17ByRecursion/0]).

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
