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


writeln("\n\nTask 5. Create a two dimensional list with methods dim(), set(), and get().")
# Similar the TwoD object created above
# Also include transpose for task 6
# Write and read from a file

Matrix := Object clone do (
    init := method(
        self rows := list()
    )

    dim := method(x, y,
        self rows setSize(x)
        for(i, 0, x-1,
            self rows atPut(i, list() setSize(y))
        )
    )

    set := method(x, y, value,
        self rows at(x) atPut(y, value)
    )

    get := method(x, y,
        self rows at(x) at(y)
    )

    toString := method(
        output := ""
        self rows foreach(rownum, row,
            row foreach(colnum, value,
                if(colnum == 0, output = output .. "|")
                output = output .. " #{get(rownum, colnum)} |" interpolate
            )
            output = output .. "\n"
        )
        output
    )

    transpose := method(
        trans := Matrix clone
        trans dim(self rows at(0) size, self rows size)
        self rows foreach(rownum, row,
            row foreach(colnum, value,
                trans set(colnum, rownum, self get(rownum, colnum))
            )
        )
        trans
    )

    tofile := method(filename,
        file := File with(filename)
        file remove
        file open
        file write(self serialized)
        file close
    )

    fromFile := method(filename, fromString,
        file := File with(filename)
        file open
        doRelativeFile(filename)
    )
)

writeln("\nCreating empty 2 x 3 matrix")
m1 := Matrix clone
m1 dim (2, 3)
m1 toString print

writeln("\nAdding sequential values to matrix")
m1 set(0,0,0)
m1 set(0,1,1)
m1 set(0,2,2)
m1 set(1,0,3)
m1 set(1,1,4)
m1 set(1,2,5)
m1 toString print

writeln("\n\nTask 6. Matrix transpose method")
m2 := m1 transpose
m2 toString print

writeln("\n\nTask 7. Matrix methods to write to and read from a file")
m1 tofile("matrix")
m3 := Matrix fromFile("matrix")
m3 toString print


writeln("\n\nTask 8. Guessing Game!\n")

Game := Object clone do(
    
    init := method(
        self magicnumber := Random value(99) ceil
        self console := File standardInput
        self notyet := true
        self count := 0
    )

    check := method(guess,
        if(guess == self magicnumber,
            self notyet = false
            "You got it!" println
        )
        if(guess < self magicnumber,
            "Too low. " print
        )
        if(guess > self magicnumber,
            "Too high. " print
        )
    )

    getguess := method(
        "What's your guess?  " print
        self count = self count + 1
        guess := self console readLine asNumber
    )

    run := method(
        "We're going to play the Guessing Game!" println
        "I'm thinking of a number between 1 and 100" println
        "You have 10 tries to guess it" println
        while(count < 10 and self notyet,
            self check(self getguess)
        )
        if(self notyet,
            # Didn't get it
            "I'm sorry, but you ran out of tries" println
            "The correct number was ${self magicnumber}" println,
            # Got it
            "You got it in #{self count} tries." interpolate println
            "Thanks for playing!\n" println
        )
    )
)


mygame := Game clone
mygame run
