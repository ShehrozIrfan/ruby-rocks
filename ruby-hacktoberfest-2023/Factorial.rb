def factorial(n)
  return 1 if n == 0
  n * factorial(n - 1)
end

puts "Enter a positive integer:"
number = gets.chomp.to_i

if number < 0
  puts "Please enter a non-negative number."
else
  puts "Factorial of #{number} is: #{factorial(number)}"
end
