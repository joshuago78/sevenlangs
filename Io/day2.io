# Day 2 DO exercises

# 1. Implement a Fibonacci function both recursively and with a loop

fibr := method(index,
    if(index <= 0, 0,
        if(index == 1, 1,
            fibr(index-1) + fibr(index-2)
        )
    )
)

"Recursive Fibonacci test" println
for(x, 0, 12, write("fibr(", x, "): ", fibr(x), "\n"))


fibl := method(index,
    if(index <= 0, 0,
        if(index == 1, 1,
            sum1 := 0
            sum2 := 1
            sum3 := 0
            for(x, 2, index, 1,
                sum3 = sum1 + sum2
                sum1 = sum2
                sum2 = sum3)
            return sum3
        )
    )
)

"\nLooping Fibonacci test" println
for(x, 0, 12, write("fibl(", x, "): ", fibl(x), "\n"))


# 2. Overwrite / to give 0 if divisor is 0
"\nTesting / override\n" print

# First create a new division operator for normal division
Number setSlot("div", Number getSlot("/"))

# Now overwrite the / operator to return 0 in special case
Number setSlot("/", 
    method(denom,
        if(denom == 0, 0, self div(denom))
    )
)

z := 8 div(2)
write("8 div 2 = ", z, "\n")

x := 2/4
y := 2/0
write("2/4 = ", x, "\n2/0 = ", y, "\n")
