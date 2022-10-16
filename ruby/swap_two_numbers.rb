class SwapExample
    def swapNumbers
        a = 10
        b = 20

        puts("The value of a before swap is " + a.to_s)
        puts("The value of b before swap is " + b.to_s)

        # Swapping of two numbers without using third variable
        a = a + b
        b = a - b
        a = a - b

        puts("The value of a after swap is " + a.to_s)
        puts("The value of b after swap is " + b.to_s)
    end
end

obj = SwapExample.new
obj.swapNumbers

class SwapExample
    def swapNumbers
        a = 13
        b = 22

        puts("The value of a before swap is " + a.to_s)
        puts("The value of b before swap is " + b.to_s)

        # Swapping of two numbers using arithmetic operations
        a = a + b
        b = a - b
        a = a - b

        puts("The value of a after swap is " + a.to_s)
        puts("The value of b after swap is " + b.to_s)
    end
end

obj = SwapExample.new
obj.swapNumbers
