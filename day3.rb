# Do

# Modify the example CSV application to support an each() method to return a
# CsvRow object.

# Use method_missing on CsvRow to return the value for the column for a given
# heading

# Example:

# day3_sample.csv
# one, two
# lions, tigers

# csv = RubyCsv.new
# csv.each {|row| puts row.one}

# output:
# lions


class CsvRow

    def initialize(rawrow, headers)
        @headers = headers
        @values = rawrow.split(', ')
    end

    def headers
        @headers
    end

    def values
        @values
    end

    def method_missing(name, *args)
        header = name.to_s
        index = @headers.index(header)
        @values[index]
    end
end

module ActsAsCsv
    def self.included(base)
        base.extend ClassMethods
    end

    module ClassMethods
        def acts_as_csv
            include InstanceMethods
        end
    end

    module InstanceMethods
        def read
            @rows = []
            filename = self.class.to_s.downcase + '.txt'
            file = File.new(filename)
            @headers = file.gets.chomp.split(', ')

            file.each do |row|
                @rows << CsvRow.new(row, @headers)
            end
        end

        attr_accessor :headers, :rows
        def initialize
            read
        end

        def each(&block)
            @rows.each &block
        end
    end
end

class RubyCsv
    include ActsAsCsv
    acts_as_csv
end

puts "\nTesting CSV functionality\n"
m = RubyCsv.new
puts "\nInspecting Headers\n"
puts m.headers.inspect
puts "\nInspecting Rows\n"
puts m.rows.inspect

puts "\nCalling row.one for each row\n"
m.each {|row| puts row.one}
puts "\nCalling row.two for each row\n"
m.each {|row| puts row.two}
puts "\nCalling row.three for each row\n"
m.each {|row| puts row.three}
