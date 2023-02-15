%%%-------------------------------------------------------------------
%%% @author SMash
%%% @copyright (C) 2023, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 15. февр. 2023 10:25
%%%-------------------------------------------------------------------
-module(collatz_map).
-author("SMash").

%% API
-export([solveCollatzByMapGeneration/0]).

solveCollatzByMapGeneration()->
  CollatzCounts = lists:map(fun(X)-> {X, collatz_sequence_num_items(X)} end, lists:seq(2,1000000)),
  MaxCount = lists:max(lists:map(fun({_X,C}) -> C end, CollatzCounts)),
  FilteredTuple = lists:last(lists:filter(fun({_X,C}) -> C == MaxCount end, CollatzCounts)),
  Value = element(1,FilteredTuple).

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
