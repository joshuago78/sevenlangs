/* Do: Reverse a list of elements. */

rev([Head|[]], [Head]).
rev([First, Second], [Second, First]).
rev([Head|Tail], Final) :- rev(Tail, Twist), append(Twist, [Head], Final).

/* ex:
| ?- rev([1,2,3,4], What).

What = [4,3,2,1] ?

yes

*/


/* Do: Find the smallest element of a list. */

min([Head|[]], Head).
min([First, Second], Min) :- 
    First < Second -> Min = First ;
    Min = Second.
min([First|[Second|Rest]], Min) :-
    min([First, Second], Temp),
    min([Temp|Rest], Min).

/* ex:

| ?- min([9,8,7,6,5,4,3,2,1,0,-1], W).

W = -1 ? 

yes
| ?- min([1], Min).

Min = 1 ? 

yes

*/
