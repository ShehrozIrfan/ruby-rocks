def factorial_iterative(n)
  if n < 0
    return "Factorial is not defined for negative numbers."
  elsif n == 0
    return 1
  else
    result = 1
    while n > 0
      result *= n
      n -= 1
    end
    return result
  end
end
