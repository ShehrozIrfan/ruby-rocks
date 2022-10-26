#Ruby code to count the number of digits in a number
=begin
Ruby program to count the number of digits
=end

puts "Enter the number:"
num=gets.chomp.to_i

temp=num
count=0

while (temp>0)
	count+=1
	temp=temp/10
end

puts "#{num} has #{count} digits"
