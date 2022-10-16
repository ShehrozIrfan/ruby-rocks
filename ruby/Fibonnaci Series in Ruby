def fibonacci(n)
    a = 0
    b = 1

    # Compute Fibonacci number in the desired position.
    n.times do
        temp = a
        a = b
        # Add up previous two numbers in sequence.
        b = temp + b
    end

    return a
end

# Write first 15 Fibonacci numbers in sequence.
3.times do |n|
    result = fibonacci(n)
    puts result
end
