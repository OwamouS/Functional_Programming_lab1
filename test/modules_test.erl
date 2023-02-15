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
-import(problem17_recursion, [solveP17ByRecursion/0]).


-include_lib("eunit/include/eunit.hrl").

collatz_test() ->
  ?assertEqual(837799, solveCollatzByMapGeneration())
  %%?assertEqual(837799, solveCollatzByTailRecursion()),
  %%?assertEqual(837799, solveCollatzByRecursion())
.

p17_test() ->
  Answer = 21124,
  %%?assertEqual(Answer, solveP17ByMapGeneration()),
  ?assertEqual(Answer, solveP17ByRecursion())
.
