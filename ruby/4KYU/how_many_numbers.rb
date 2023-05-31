# We want to generate all the numbers of three digits where:

# the sum of their digits is equal to 10
# their digits are in increasing order (the numbers may have two or more equal contiguous digits)
# The numbers that fulfill these constraints are: [118, 127, 136, 145, 226, 235, 244, 334]. There're 8 numbers in total with 118 being the lowest and 334 being the greatest.

# Task
# Implement a function which receives two arguments:

# the sum of digits (sum)
# the number of digits (count)
# This function should return three values:

# the total number of values which have count digits that add up to sum and are in increasing order
# the lowest such value
# the greatest such value
# Note: if there're no values which satisfy these constaints, you should return an empty value (refer to the examples to see what exactly is expected).

# Examples
# find_all(10, 3)  =>  [8, 118, 334]
# find_all(27, 3)  =>  [1, 999, 999]
# find_all(84, 4)  =>  []
# Features of the random tests:

# Number of tests: 112
# Sum of digits value between 20 and 65
# Amount of digits between 2 and 17



def find_all(n, k)
  final_numbers = [*((10 ** (k - 1))..(10 ** k) - 1)].filter_map do |elm|
    next unless elm.digits.sort.reverse == elm.digits

    if elm.digits.sum == n
      elm
    end
  end
  
  final_numbers.empty? ? [] : [final_numbers.length, *final_numbers.minmax]
end


# another solution
def find_all(n, k)
  valid_numbers = [*((10 ** (k - 1))..(10 ** k))].select do |elm|
    elm.digits.sort.reverse == elm.digits
  end
  
  final_numbers = valid_numbers.select { |number| number.digits.sum == n }

  final_numbers.empty? ? [] : [final_numbers.length, *final_numbers.minmax]
end

# optimal solution
def find_all(n, k)
  a = (1..9).to_a.repeated_combination(k).select{|c| c.reduce(&:+) == n}
  a.empty? ? [] : [a.size, a.first.join.to_i, a.last.join.to_i]
end
