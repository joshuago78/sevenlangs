module Main where

	-- assignment 1: create a function that reverses a list
	revList [[], x] = [[], x]
	revList [(head:tail), newList] = revList([tail, head:newList])

	rev(list) = revList([list, []]) !! 1


	--assignment 2: build all 2-tuple combos of [black,white,blue,yellow,red]
	combos ([], x) = ([], x)
	combos ((head:tail), sofar) = combos(tail, [(head,x) | x <- tail] ++ sofar)

	second (x, y) = y

	colorCombos = second(combos(["black","white","blue","yellow","red"], []))


	--assignment 3: write a list comprehension to buils 12x12 multiplication table

	table = [(x,y, x*y) | x <- [1..12], y <- [1..12]]