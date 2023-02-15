%%%-------------------------------------------------------------------
%%% @author SMash
%%% @copyright (C) 2023, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 15. февр. 2023 13:20
%%%-------------------------------------------------------------------
-module(collatz_recursion).
-author("SMash").

%% API
-export([solveCollatzByRecursion/0]).

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
