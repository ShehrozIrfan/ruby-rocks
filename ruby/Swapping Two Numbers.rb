
class SwapExample
    def swapNumbers
        a = 3
        b = 6

        puts("The value of a before swap is " + a.to_s)
        puts("The value of b before swap is " + b.to_s)

        # Swapping of two numbers using temp variable
        temp = a
        a = b
        b = temp

        puts("The value of a after swap is " + a.to_s)
        puts("The value of b after swap is " + b.to_s)
    end
end

obj = SwapExample.new
obj.swapNumbers