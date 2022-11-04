class MyLinkedList

=begin
    Initialize your data structure here.
=end
    def initialize()
        @head = nil
    end

=begin
    Get the value of the index-th node in the linked list. If the index is invalid, return -1.
    :type index: Integer
    :rtype: Integer
=end
    def get(index)
        counter = index
        cursor = @head
        val = -1
        while cursor != nil do
            if counter == 0
                break
            end
            counter = counter -1
            cursor = cursor.next
        end
        
        if counter == 0 && cursor != nil
            val = cursor.val
        end
        return val
            
    end


=begin
    Add a node of value val before the first element of the linked list. After the insertion, the new node will be the first node of the linked list.
    :type val: Integer
    :rtype: Void
=end
    def add_at_head(val)
        new_node = Node.new(val, nil, nil)
        if @head == nil
            @head = new_node
        else
            new_node.next = @head
            @head.prev = new_node
            @head = new_node
        end
            
    end


=begin
    Append a node of value val to the last element of the linked list.
    :type val: Integer
    :rtype: Void
=end
    def add_at_tail(val)
        new_node = Node.new(val,nil,nil)
        if @head == nil
            @head = new_node
        else
            cursor = @head
            while cursor.next != nil do
                cursor=cursor.next
            end
            new_node.prev = cursor
            cursor.next = new_node
        end
        
    end


=begin
    Add a node of value val before the index-th node in the linked list. If index equals to the length of linked list, the node will be appended to the end of linked list. If index is greater than the length, the node will not be inserted.
    :type index: Integer
    :type val: Integer
    :rtype: Void
=end
    def add_at_index(index, val)
        if index == 0
            add_at_head(val)
        else
            counter = index
            cursor = @head
            while cursor.next != nil
                if counter == 0
                    break 
                end
                
                counter = counter -1
                cursor = cursor.next
            end
            
            if counter == 1 && cursor.next == nil
                add_at_tail(val)
            else 
                if counter == 0 
                    new_node = Node.new(val, nil, nil)
                    new_node.prev = cursor.prev
                    cursor.prev.next = new_node
                    new_node.next= cursor
                    cursor.prev = new_node
                end
            end
        end          
    end


=begin
    Delete the index-th node in the linked list, if the index is valid.
    :type index: Integer
    :rtype: Void
=end
    def delete_at_index(index)
        if @head != nil
            if index == 0
                if @head.next == nil
                    @head = nil
                else 
                    @head.next.prev = nil
                    @head = @head.next
                end
            else
                counter = index
                cursor = @head
                while cursor.next != nil
                    if counter == 0
                        break 
                    end

                    counter = counter -1
                    cursor = cursor.next
                end

                if counter == 0 
                    if cursor.next == nil
                        cursor.prev.next = nil
                    else 
                        cursor.prev.next = cursor.next
                        cursor.next.prev = cursor.prev
                    end
                end
            end
        end
    end


end

class Node
    attr_accessor :val, :prev, :next
    def initialize(val=nil, prev=nil, next_=nil)
        @val = val
        @prev = prev
        @next = next_
    end
end
