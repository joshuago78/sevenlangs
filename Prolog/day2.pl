/* Do: Reverse a list of elements. */

rev([Head|[]], [Head]).
rev([First, Second], [Second, First]).
rev([Head|Tail], Final) :- rev(Tail, Twist), append(Twist, [Head], Final).

/* ex:
rev([1,2,3,4], What).

What = [4,3,2,1] ?

yes

*/
