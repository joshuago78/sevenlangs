-module(day3).
-export([transloop/0, transmonitor/0, translate/1]).


% Assignment 1: create a monitor for the translation service that revives the
% process if it dies

lookup("casa") -> "house";
lookup("blanca") -> "white";
lookup(_) -> "I don't understand".

transloop() ->
	receive
		{From, "DIE"} ->
			From ! "You killed me!",
			exit({transloop,die,at,erlang:time()});
		{From, Word} ->
			%io:format("~p~n", [lookup(Word)]),
			From ! lookup(Word),
			transloop()
	end.

translate(Word) ->
	translator ! {self(), Word},
	receive
		Translation -> Translation
	end.

transmonitor() ->
	process_flag(trap_exit, true),
	receive
		new ->
			io:format("Creating new translator process.~n"),
			register(translator, spawn_link(fun transloop/0)),
			transmonitor();
		{'EXIT', From, Reason} ->
			io:format("The translator ~p died with reason ~p", [From, Reason]),
			io:format(" Restarting. ~n"),
			self() ! new,
			transmonitor()
	end.

% To use:
%2> c(day3).
%{ok,day3}
%3> M = spawn(fun day3:transmonitor/0).
%<0.44.0>
%4> M ! new.
%Creating new translator process.
%new
%5> day3:translate("casa").
%"house"
%6> day3:translate("blanca").
%"white"
%7> day3:translate("loco").  
%"I don't understand"
%8> day3:translate("DIE"). 
%The translator <0.46.0> died with reason {transloop,die,at,{9,47,55}} Restarting. 
%"You killed me!"
%Creating new translator process.
%9> day3:translate("loco").
%"I don't understand"
