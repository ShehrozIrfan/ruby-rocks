@@ -0,0 +1,41 @@
puts ("Enter first number")
z = gets.chomp.to_f
puts ("Enter operation")
option = gets.chomp
puts ("Enter second number")
y = gets.chomp.to_f
puts "#{z} #{option} #{y}\n\n"

puts ("OPTIONS: ")
puts ("Addition (A) (+)")
puts ("Subtraction (S) (-)")
puts ("Multiplication (M) (*)")
puts ("Division (D) (/)\n\n")

if option.upcase == "A" or option == "Addition" or option == "+"
    x = z+y
    puts "Addition: #{z}+#{y}=#{x}"
    puts ("%.2f" % x) 

elsif option.upcase == "S" or option == "Subtraction" or option == "-"
    x = z-y
    puts "Subtraction: #{z}-#{y}=#{x}"
    puts ("%.2f" % x)

elsif option.upcase == "M" or option == "Multiplication" or option == "*"
    x = z*y
    puts "Multiplication: #{z}*#{y}=#{x}"
    puts ("%.2f" % x)

elsif option.upcase == "D" or option == "Division" or option == "/"
    x = z/y
    r = z%y
    puts "Division #{z}/#{y}=#{x.to_i} r#{r.to_i}"
    puts ("%.2f" % x)

else
    print("SOMETHING IS WRONG,")
    print("I REPEAT,")
    print("SOMETHING IS WRONG.")
    print("MADAY. MADAY.") 
end
