%%%-------------------------------------------------------------------
%%% @author SMash
%%% @copyright (C) 2023, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 15. февр. 2023 13:05
%%%-------------------------------------------------------------------
-module(collatz_tail).
-author("SMash").

%% API
-export([solveCollatzByTailRecursion/0]).

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
