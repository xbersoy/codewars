# Next bigger number with the same digits

# Create a function that takes a positive integer and returns the next bigger number that can be formed by rearranging its digits. For example:

#   12 ==> 21
#  513 ==> 531
# 2017 ==> 2071
# If the digits can't be rearranged to form a bigger number, return -1 (or nil in Swift, None in Rust):

#   9 ==> -1
# 111 ==> -1
531 ==> -1

def next_bigger(number)
  valid_number_permutations = number.digits.permutation(number.digits.length).to_a.select do |n|
    n.join.to_i > number
  end

  valid_number_permutations.map { |n| n.join.to_i}.min || -1
end
