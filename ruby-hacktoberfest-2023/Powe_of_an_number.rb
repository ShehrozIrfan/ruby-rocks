=begin
Ruby program to calculate power of a number.	
=end

def pow(a,b)
	power=1
	for i in 1..b
		power=power*a
	end
	return power
end

puts "Enter Base:-"
base=gets.chomp.to_i

puts "Enter exponent:-"
expo=gets.chomp.to_i

puts "The power is #{pow(base,expo)}"
