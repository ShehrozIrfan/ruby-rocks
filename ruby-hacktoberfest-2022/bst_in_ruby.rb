class Tree
  attr_accessor :value, :left, :right

  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end

  def add_value(value, root = self)
    if root.nil?
      return root = Tree.new(value)
    elsif value > root.value
      root.right = add_value(value, root.right)
      return root
    elsif value < root.value
      root.left = add_value(value, root.left)
      return root
    else
      raise ArgumentError.new "Value already exists in tree."
    end
  end

  def has_value?(value, root = self)
    if root.nil?
      return false
    elsif value == root.value
      return true
    elsif value > root.value
      has_value?(value, root.right)
    elsif value < root.value
      has_value?(value, root.left)
    end
  end

  def size(root = self)
    return 0 if root.nil?
    1 + size(root.left) + size(root.right)
  end

  def leaf?
    left.nil? && right.nil?
  end

  def total_leaves(root = self)
    return 0 if root.nil?
    return 1 if root.leaf?
    total_leaves(root.left) + total_leaves(root.right)
  end

  # def height(root = self, max = 0, counter = 0)
  #   if root.leaf?
  #     max = counter if counter > max
  #   else
  #     counter += 1
  #     max = height(root.left, max, counter) unless root.left.nil?
  #     max = height(root.right, max, counter) unless root.right.nil?
  #   end
  #   max
  # end

  # slicker, though harder-to-parse version
  def height(root = self)
    return 0 if root.nil? || root.leaf?
    1 + [height(root.left), height(root.right)].max
  end

  def height_balanced?(root = self, levels = 0, max = self.height)
    if root.leaf?
      levels + 1 >= max
    else
      levels += 1
      if root.left.nil?
        height_balanced?(root.right, levels, max)
      elsif root.right.nil?
        height_balanced?(root.left, levels, max)
      else
        height_balanced?(root.left, levels, max) && height_balanced?(root.right, levels, max)
      end
    end
  end

  def identical_trees?(tree2, tree1 = self)
    if tree1.nil? && tree2.nil?
      return true
    elsif tree1.nil? || tree2.nil?
      return false
    elsif tree1.value != tree2.value
      return false
    else
      identical_trees?(tree1.left, tree2.left) && identical_trees?(tree1.right, tree2.right)
    end
  end

  def subtree_of?(prospective_parent)
    if prospective_parent.nil?
      return false
    elsif prospective_parent.value == subtree.value
      return prospective_parent.identical_trees?(self)
    else
      subtree_of?(prospective_parent.left) || subtree_of?(prospective_parent.right)
    end
  end

  # works properly (destructively) in most situations...
  # however, when deleting value at root of tree if one (or both) of its branches is nil,
  # then #delete will return the correct tree, but do so non-destructively
  # NB. this (I believe) has to do with how Ruby treats self
  def delete_value(value, root = self)
    if root.nil?
      return
    elsif value > root.value
      root.right = delete_value(value, root.right)
    elsif value < root.value
      root.left = delete_value(value, root.left)
    else # i.e. value == root.value
      if root.left.nil?  # also catches cases when both child nodes are empty
        root = root.right
      elsif root.right.nil?
        root = root.left
      else
        root = shift_values(root)
      end
    end
    root
  end

  ### three helper methods for #delete ###
  def shift_values(root)
    root.value = get_next_value(root.right)
    root.right = right_subtree_without_next_value(root.right)
    root
  end

  def get_next_value(root)
    if root.left.nil?
      root.value
    else
      get_next_value(root.left)
    end
  end

  def right_subtree_without_next_value(root)
    if root.left.nil?
      return root.right
    else
      root.left = right_subtree_without_next_value(root.left)
    end
    root
  end
  ### end helper methods for #delete ###

  def valid_bst?(root = self, min = -1.0/0.0, max = 1.0/0.0)
    if root.value > min && root.value < max
      if root.leaf?
        return true
      elsif root.right.nil?
        valid_bst?(root.left, min, root.value)
      elsif root.left.nil?
        valid_bst?(root.right, root.value, max)
      else
        valid_bst?(root.left, min, root.value) && valid_bst?(root.right, root.value, max)
      end
    else
      false
    end
  end

  # alt method for valid_bst?
  # convert to linked list, then check whether it's sorted (works in O(n))
  def alt_valid_bst?
    self.to_ll.sorted?
  end

  # BREADTH-FIRST TRAVERSAL #

  def breadth_first(root = self)
    q = Queue.new
    arr = []
    q.enqueue(root)
    until q.empty?
      pointer = q.dequeue
      arr << pointer.value
      q.enqueue(pointer.left)  unless pointer.left.nil?
      q.enqueue(pointer.right) unless pointer.right.nil?
    end
    arr
  end

  # DEPTH-FIRST TRAVERSALS #

  ### both of these conversion methods are in-order traversals, ###
  ### i.e. left node, current node, right node                  ###
  def to_a (root = self, array = [])
    to_a(root.left, array) unless root.left.nil?
    array << root.value
    to_a(root.right, array) unless root.right.nil?
    array
  end

  def to_ll (root = self, list = List.new)
    to_ll(root.left, list) unless root.left.nil?
    list.value.nil? ? list.value = root.value : list << root.value
    to_ll(root.right, list) unless root.right.nil?
    list
  end


  # pre-order traversal (current, left, right)
  def preorder (root = self, array = [])
    array << root.value
    preorder(root.left, array) unless root.left.nil?
    preorder(root.right, array) unless root.right.nil?
    array
  end

  # post-order traversal (left, right, current)
  def postorder (root = self, array = [])
    postorder(root.left, array) unless root.left.nil?
    postorder(root.right, array) unless root.right.nil?
    array << root.value
    array
  end

end

class Node
  attr_accessor :value, :next

  def initialize(value = nil)
    @value = value
    @next = nil
  end
end

class Queue
  def initialize
    @first = nil
    @last = nil
  end

  def enqueue(value)
    node = Node.new(value)
    if self.empty?
      @first = node
      @last = node
    else
      @last.next = node
      @last = @last.next    
    end
    self
  end

  def dequeue
    value = @first.value
    @first = @first.next
    value
  end

  def empty?
    @first.nil?
  end
end

class List
  attr_accessor :value, :next

  def initialize(value = nil)
    @value = value
    @next = nil
  end

  def << (value, pointer = self)
    if pointer.next
      pointer.next << value
    else
      pointer.next = List.new(value)
    end
    self
  end

  def sorted?(pointer = self)
    while pointer.next
      return false unless pointer.value < pointer.next.value
      pointer = pointer.next
    end
    true
  end
end

class Array

  # convert a pre-sorted array into a balanced binary search tree
  # (could also call #sort on self to handle unsorted arrays, but this costs efficiency)
  def to_bst(arr = self, tree = nil)
    return if arr.length == 0
    mid = arr.length / 2
    unless tree.nil?
      tree.add_value(arr[mid])
    else
      tree = Tree.new(arr[mid])
    end
    to_bst(arr[0...mid], tree)
    to_bst(arr[mid+1..-1], tree)
    tree
  end

end