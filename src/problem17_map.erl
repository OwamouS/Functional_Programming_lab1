%%%-------------------------------------------------------------------
%%% @author SMash
%%% @copyright (C) 2023, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 15. февр. 2023 12:41
%%%-------------------------------------------------------------------
-module(problem17_map).
-author("SMash").

-export([solveP17ByMapGeneration/0]).

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
