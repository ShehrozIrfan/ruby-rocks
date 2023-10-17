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

# Get user input
print "Enter a non-negative integer to calculate its factorial: "
num = gets.chomp.to_i

if num < 0
  puts "Factorial is not defined for negative numbers."
else
  puts "Iterative Factorial of #{num} is #{factorial_iterative(num)}"
end
