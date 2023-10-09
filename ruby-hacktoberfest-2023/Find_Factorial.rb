n=gets.to_i

def factorial(n)
  if n == 0 || n == 1
    1
  else
    n * factorial(n-1)
  end
end

puts "\nThe factorial of #{n} is #{factorial(n)}"
