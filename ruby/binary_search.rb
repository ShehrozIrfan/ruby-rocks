# Ruby program to search an item into the array 
# using binary search

arr = [10,20,40,50,60];

item =   0;
flag =   -1;

first = 0;
last = arr.size() - 1;
middle = (first + last) / 2;

print "Enter item: ";
item = gets.chomp.to_i;  

while(first<=last)
    if(arr[middle]<item)
        first=middle + 1;
    elsif(arr[middle]==item)
        flag=middle;
        break;
    else
        last = middle - 1;
    end
    middle = (first + last) / 2;
end

if(flag>=0)
    print "Item found at index: ",flag,"\n"; 
else
    print "Item not found\n"; 
end
