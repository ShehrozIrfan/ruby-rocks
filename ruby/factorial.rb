puts "Enter the number"
num=gets.chomp.to_i

i = 1
fact = 1

while i <= num  #implementation of while loop
    fact *= i
    i += 1
end

puts "The factorial of #{num} is #{fact}"

puts "Enter the number:"
num=gets.chomp.to_i

fact=1
if (num==0)
	puts "Error! Could not find the factorial of one"
else
	i=1
	while(i<=num)
		fact=fact*i
		i+=1
	end
end
		puts "factorial of #{num} is #{fact}"
