-module(day2).
-export([find/2, get/2, subtotals/1]).
-export([tictactoe/1]).

% Assignment 1: create a dictionary look up function

% optional line below to avoid error
find(_,[]) -> notFound;
find(Needle, [{Needle, Value}|_]) -> Value;
find(Needle, [_|Tail]) -> find(Needle, Tail).

% Alternative solution using list filters and anonymous functions
% This version is less efficient because it evaluates every tuple even after a match is found
get(Needle, Haystack) -> 
	[{_, Value} | _] = lists:filter(fun({Key, _}) -> Key == Needle end, Haystack),
	Value.


% Assignment 2: calculate total price per item type

subtotals(Cart) -> [{Item, Quant * Price} || {Item, Quant, Price} <- Cart].


% Bonus: evaluate a tic-tac-toe result

tictactoe(Board) ->
	% break apart the board and set up lines
    [UL, UM, UR, ML, MM, MR, BL, BM, BR] = Board,
    [Top, Center, Bottom] = [[UL, UM, UR], [ML, MM, MR], [BL, BM, BR]],
    [Left, Middle, Right] = [[UL, ML, BL], [UM, MM, BM], [UR, MR, BR]],
    [Backslash, Slash] = [[UL, MM, BR], [BL, MM, UR]],
    Lines = [Top, Center, Bottom, Left, Middle, Right, Backslash, Slash],
    % set up line analyzers
    WinnerTest = fun([C1, C2, C3]) -> C1 == C2 andalso C1 == C3 end,
    EmptyTest = fun([C1, C2, C3]) -> C1 == empty orelse C2 == empty orelse C3 == empty end,
    Winners = lists:filter(WinnerTest, Lines),
    EmptySpots = lists:any(EmptyTest, Lines),
    if
        Winners /= [] ->
            [[Winner, Winner, Winner]|_] = Winners,
            Winner;
        EmptySpots ->
            no_winner;
        true ->
            cat
    end.