puts "Enter the number"
num=gets.chomp.to_i

i = 1
fact = 1

while i <= num  #implementation of while loop
    fact *= i
    i += 1
end

puts "The factorial of #{num} is #{fact}"
