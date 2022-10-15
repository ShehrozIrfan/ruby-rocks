def fact(n)
    if n==1
        return false
    end
    for i in 2..Math.sqrt(n)
        if n%i==0
            return false
        end
    end
    return true
end

puts "Enter a Number: "
a = gets.chomp.to_i

if fact(a)==true
    puts "#{a} is a Prime Number"
else
    puts "#{a} is not a Prime Number"
end