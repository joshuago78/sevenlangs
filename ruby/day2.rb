# Find

# Find out how to access files with and without code blocks.

# Answer:
# From ruby-doc.org:
# open(filename, mode="r" [, opt]) → file
# open(filename [, mode [, perm]] [, opt]) → file
# open(filename, mode="r" [, opt]) {|file| block } → obj
# open(filename [, mode [, perm]] [, opt]) {|file| block } → obj
# With no associated block, File.open is a synonym for ::new.
# If the optional code block is given, it will be passed the opened file as an
# argument, and the File object will automatically be closed when the block
# terminates.


# What is the benefit of the code block?

# Answer: The file will be closed autmatically after the block is run


# How would you translate a hash to an array?

# Answer:
# Use the to_a method
# myhash = { "a" => 1, "b" => 2, "c" => 3 }
# mhash.to_a
# [["a", 1], ["b", 2], ["c", 3]]


# Can you translate arrays to hashes?

# Answer: Yes, but the method used depends on how the array is constructed
# This method will work for an array of two dimensional arrays
#
# a1 = [["a", 1], ["b", 2], ["c", 3]]
# h1 = Hash[a1]
#
# However that won"t work for flat arrays. For those you must use the splat
# operator to send the values as arguments
#
# a2 = ["a", 1, "b", 2, "c", 3]
# h2 = Hash[*a2]


# Can you iterate through a hash?

# Answer: yes. Use the each method

# h1 = { "a" => 1, "b" => 2, "c" => 3 }
# h.each {|k, v| puts "key #{k} has the value of #{v}" }


# You can use Ruby arrays as stacks. What other common data structures do
# arrays support?

# Answer: queues, linked lists (single or double), multidimensional arrays
# (matrices), heaps, sets



# Do

# Print the contents of an array of sixteen numbers, four numbers at a time
# using just "each"

print "Four at a time using 'each'\n"
nums = (1..16).to_a
cnt = 0
out = ""
nums.each do |n|
    cnt += 1
    out += n.to_s
    if cnt % 4 == 0
        print out + "\n"
        cnt = 0
        out = ""
    else
        out += " "
    end
end


# Now do the same with "each_slice"

print "\nFour at a time using 'each_slice'\n"
num = (1..16).to_a
nums.each_slice(4) { |a|
    out = a.join(" ")
    print out + "\n"
}



# Recreate the Tree class with an initializer that allows you to pass in a
# nested hash structure

class Tree
    attr_accessor :children, :node_name

    def initialize(hashtree={})
        @node_name = hashtree.keys[0]
        @children = []
        puts "new Tree created: #{@node_name}\n"
        if hashtree.values
            hashtree[@node_name].each do |k, v|
                print "working on child node #{k}\n"
                @children.push(Tree.new(Hash[k, v]))
            end
        end
    end

    def visit_all(&block)
        visit &block
        children.each {|c| c.visit_all &block }
    end

    def visit(&block)
        block.call self
    end
end

print "\nTesting new Tree class\n"
h = {"grandpa" => {"dad" => {"child 1" => {}, "child 2" => {} }, "uncle" => {"child 3" => {}, "child 4" => {} }}}
print "Passing hashtree:\n"
p h.inspect
t = Tree.new(h)
print "Visiting tree:\n"
t.visit_all {|node| puts node.node_name}



# Write a grep function that will print the lines of a file having any
# occurance of a phrase anywhere in that line.
# Include line numbers.

def grep(filename, phrase)
    matches = []
    lines = IO.readlines filename
    (1..lines.length).each do |num|
        matches.push([num, lines[num-1]]) if lines[num-1].match(phrase)
    end
    puts "Found #{matches.length} matches\n"
    matches.each { |line| puts "#{line[0]} #{line[1]}"}
end

print "\nTesting grep function\n"
print "calling grep('greptest.txt', 'hello, world')\n"
grep('greptest.txt', 'hello, world')



