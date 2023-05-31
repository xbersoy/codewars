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
