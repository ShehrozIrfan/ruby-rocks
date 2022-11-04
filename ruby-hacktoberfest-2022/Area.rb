=begin 
Ruby program to find Area of Rectangle and Circle.
=end

# input length and breadth, and 
# convert them to float value
puts "Enter length:"
l=gets.chomp.to_f
puts "Enter width:"
w=gets.chomp.to_f
puts "Enter radius:"
r=gets.chomp.to_f

# calculating area 
area1=l*w
area2=3.14*r*r

# printing the result
puts "Area of Rectangle is #{area1}"
puts "Area of Circle is #{area2}"
