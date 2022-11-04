class CircularList
	class Node
		attr_accessor :next, :data
		def initialize data
			self.data = data
			self.next = nil
		end
	end

	attr_accessor :head, :current, :length

	# Initialize an empty lits.
	# Complexity: O(1).
	def initialize
		self.head   = nil
		self.length = 0
	end


	# Inserts a new item at the end of the list.
	# Complexity: O(n).
	def insert data
		return insert_next(nil, data)       if (self.length == 0)
		return insert_next(self.head, data) if (self.length == 1)

		# We have to find the last node and insert the
		# new node right next to it.
		self.current = head
		i = 0;
		while ((i += 1) < self.length)
			move_next
		end

		# current == "tail".
		return insert_next(self.current, data)
	end

	# Inserts a new node next to the specified node.
	# Complexity: O(1).
	def insert_next prev_node, data
		new_node = Node.new data
		if self.length == 0
			self.head = new_node.next = new_node
		else
			new_node.next = prev_node.next
			prev_node.next = new_node
		end
		self.length += 1
	end

	# Removes an item from the list.
	# Complexity: O(n).
	def remove node
		return nil unless node
		return nil unless self.length > 0

		# head?
		return remove_next node if (self.length == 1)

		# Find the precedent node to the node we 
		# want to remove.
		prev = nil
		self.current = self.head
		while ((prev = self.move_next) != node)
		end
		remove_next prev
	end


	# Removes the node that is next to the specified node.
	# Complexity: O(1).
	def remove_next prev_node
		return nil unless self.length > 0

        unless prev_node
            # remove head.
            self.head = self.head.next
        else
            if prev_node.next == prev_node
                self.head = nil
            else
                old = prev_node.next
                prev_node.next = prev_node.next&.next
                if (old == self.head)
                    self.head = old.next
                end
            end
        end

    	self.length -= 1
	end


	# Removes all items form the list.
	# Complexity: O(n).
	def clear
		while self.length > 0
			remove self.head
		end
	end

	# Moves to the next node.
	def move_next
		self.current = self.current&.next
	end

	# Conviniece methods

	# Traverse all of the elements from the list
	# without wrapping around. 
	# (Starts from the head node and halts when 
	# gets back to it.) 
	def full_scan
		return nil unless block_given?

		self.current = self.head
		# If you are not familiar with ruby this
		# is the recommended way to write: do { p } while (q);
		loop do
			yield self.current
			break if (move_next == self.head)
		end
	end

	# Finds the first occurence that matched
	# the given predicate.
	# Complexity: O(n).
	def find_first &predicate
		return nil unless block_given?

		self.current = self.head
		loop do
			return self.current if predicate.call(self.current)
			break if (move_next == self.head)
		end
	end

	# Prints the contents of the list.
	# Complexity: O(n).
	def print
		if self.length == 0
			puts "empty"
		else
			self.full_scan { |item| puts item.data }
		end
	end

end
