# Ruby program to search an item into the array 
# using linear search

arr = [12,34,54,13,45,66];

i    =   0;
item =   0;
flag =   0;

print "Enter item: ";
item = gets.chomp.to_i;  

flag = -1
while(i<arr.size)
    if(arr[i]==item)
        flag = i;
        break;
    end
    i = i + 1;
end

        
if(flag>=0)
    print "Item found at index: ",flag,"\n"; 
else
    print "Item not found\n"; 
end
