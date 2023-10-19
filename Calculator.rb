def add(x, y)
  x + y
end

def subtract(x, y)
  x - y
end

def multiply(x, y)
  x * y
end

def divide(x, y)
  if y == 0
    "Division by zero is not allowed."
  else
    x / y.to_f
  end
end

loop do
  puts "Options:"
  puts "Enter '1' for addition"
  puts "Enter '2' for subtraction"
  puts "Enter '3' for multiplication"
  puts "Enter '4' for division"
  puts "Enter '5' to exit"
  print "Enter your choice: "

  choice = gets.chomp.to_i

  break if choice == 5

  if choice < 1 || choice > 5
    puts "Invalid choice. Please enter a valid option."
    next
  end

  print "Enter the first number: "
  num1 = gets.chomp.to_f
  print "Enter the second number: "
  num2 = gets.chomp.to_f

  result = case choice
           when 1 then add(num1, num2)
           when 2 then subtract(num1, num2)
           when 3 then multiply(num1, num2)
           when 4 then divide(num1, num2)
           end

  puts "Result: #{result}"
end
