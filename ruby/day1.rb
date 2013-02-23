# Do part 1
puts "Hello World"

# Do part 2
s = "Hello Ruby"
r = "Ruby"
i = s.index(r)
puts "The index of '#{r}' in '#{s}' is '#{i}'"

# Do part 3
for x in 1..10
    puts "Joshua Gomez #{x}"
end

# Do part 4
x = 1
while x < 11
    puts "This is sentence #{x}"
    x += 1
end

# Do bonus
myrand = rand(50) + 1
puts "Guess a number between 1 and 50"
guess = gets.to_i
while guess != myrand
    if myrand > guess
	puts "Too low"
    elsif myrand < guess
	puts "Too high"
    end
    puts "Guess again"
    guess = gets.to_i
end
puts "You got it!"
