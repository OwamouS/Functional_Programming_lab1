%%%-------------------------------------------------------------------
%%% @author SMash
%%% @copyright (C) 2022, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 05. дек. 2022 10:53
%%%-------------------------------------------------------------------
-module(modules_test).

-import(collatz_map, [solveCollatzByMapGeneration/0]).
-import(collatz_tail, [solveCollatzByTailRecursion/0]).
-import(collatz_recursion, [solveCollatzByRecursion/0]).
-import(problem17_map, [solveP17ByMapGeneration/0]).


-include_lib("eunit/include/eunit.hrl").

collatz_test() ->
  Answer = 837799,
  ?assertEqual(Answer, solveCollatzByMapGeneration()),
  ?assertEqual(Answer, solveCollatzByTailRecursion()),
  ?assertEqual(Answer, solveCollatzByRecursion())
.

p17_test() ->
  Answer = 21124,
  ?assertEqual(Answer, solveP17ByMapGeneration())
.
