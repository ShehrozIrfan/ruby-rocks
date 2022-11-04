=begin 
Ruby program to add three numbers.
=end

# input the numbers and converting 
# them into integer 
puts "Enter first value: "
num1=gets.chomp.to_i
puts "Enter second value: "
num2=gets.chomp.to_i
puts "Enter third value: "
num3=gets.chomp.to_i

# finding sum 
sum=num1+num2+num3

# printing the result
puts "The sum is #{sum}"
