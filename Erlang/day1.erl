-module(day1).
-export([word_count/1]).
-export([count/1]).
-export([status/1]).


% Assignment 1, count words in a string

word_count(Sentence) -> wc(notWord, 0, Sentence).

wc(_, Count, []) -> Count;
wc(_, Count, [32|Tail]) -> wc(notWord, Count, Tail);
wc(notWord, Count, [_|Tail]) -> wc(inWord, Count+1, Tail);
wc(inWord, Count, [_|Tail]) -> wc(inWord, Count, Tail).


% Assignment 2, count to ten recursively

count(Goal) -> print_list(1, Goal).

print_list(Goal, Goal) -> io:format("~p~n", [Goal]);
print_list(Num, Goal) -> 
    io:format("~p~n", [Num]),
    print_list(Num+1, Goal).


% Assignment 3, print status message

status(success) -> "success";
status({error, Message}) -> string:concat("error: ", Message).