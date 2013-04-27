# Day 2 DO exercises

writeln("Task 1. Implement a Fibonacci function both recursively and with a loop\n")

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


writeln("\n\nTask 2. Overwrite / to give 0 if divisor is 0\n")

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


writeln("\n\nTask 3. Sum up all values from a 2 dimensional array\n")

TwoD := Object clone
TwoD matrix := List clone

TwoD addrow := method(row,
    matrix append(row)
)

TwoD showrow := method(rownum,
    output := "row #{rownum}:" interpolate
    matrix at(rownum) foreach(cellnum, value,
        output = "#{output}\t#{value}" interpolate
    )
    output = "#{output}\t\tRow Sum: #{sumrow(rownum)}" interpolate
    output println
)    

TwoD showrows := method(
    "Contents of matrix:" println
    matrix foreach(rownum, row, showrow(rownum))
)

TwoD sumrow := method(rownum,
    sum := 0
    matrix at(rownum) foreach(cellnum, value,
        sum = sum + value
    )
)

TwoD sumall := method(
    total := 0
    matrix foreach(rownum, row, (
        total = total + sumrow(rownum)
        )
    )
)

# now instantiate a 2D matrix object and addsome rows
mymatrix := TwoD clone
row1 := list(1, 2, 3, 4, 5)
row2 := list(5, 4, 3, 2, 1)
row3 := list(3, 2, 4, 1, 5)
mymatrix addrow(row1)
mymatrix addrow(row2)
mymatrix addrow(row3)

mymatrix showrows
"Total summation: #{mymatrix sumall}" interpolate println


writeln("\n\nTask 4. create a list that calculates an average\n")

"myAverage testing" println

List setSlot("myAverage",
    method(
        if(call target isEmpty,
            Exception raise("List is empty!"),
            call target foreach(index, value, 
                #writeln("Testing value ", value, " : ", value type)
                if(value proto != Number,
                    Exception raise("Value at index #{index} is not a Number" interpolate)
                )
            )
            average
        )
    )
)


x := list(1, 2, 3, 4, 5)
y := list(1, 2, "hi", 4, 5)
z := list()
a := list(x, y, z)

a foreach(index, currentlist,
    writeln("Test list #{index+1}: " interpolate, currentlist)
    "myAverage: " print
    e := try(
        avg := currentlist myAverage
        write(avg, "\n")
    )
    e catch(Exception,
        write("ERROR!: ", e error, "\n")
    )
)
