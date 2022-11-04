def selection_sort(array)
  # Create a loop that iterates through the array
  # and finds the smallest element in the array
  # and places it at the beginning of the array
  # and repeats until the array is sorted
  for i in 0..array.length-1
    min = i
    for j in i+1..array.length-1
      if array[j] < array[min]
        min = j
      end
    end
    array[i], array[min] = array[min], array[i]
  end
  return array
end
