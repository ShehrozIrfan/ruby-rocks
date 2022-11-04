def insertion_sort(array)
    for i in 1...(array.length)
        j = i # Step 2
        while j > 0 # Step 3
            if array[j-1] > array[j]
                temp = array[j]
                array[j] = array[j-1]
                array[j-1] = temp
            else
                break
            end
            j = j - 1 # Step 5
        end
    end
    return array
end
