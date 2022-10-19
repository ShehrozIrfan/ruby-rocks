def remove(value, node = self.root)
    removeHelper(value, node = self.root)
    @size -= 1
    node
end
private
#this helper method will avoid the multiple size decreses in recursion
def removeHelper(value, node = self.root)
    if node == nil
        return nil
    end
    if node.value > value
        node.left = removeHelper(value, node.left)
    elsif node.value < value
        node.right = removeHelper(value, node.right)
    else
        if node.left != nil && node.right != nil
            temp = node
            min_of_right_subtree = find_min(node.right)
            node.value = min_of_right_subtree.value
            node.right = removeHelper(min_of_right_subtree.value, node.right)
        elsif node.left != nil
            node = node.left
        elsif node.right != nil
            node = node.right
        else
            node = nil
        end
    end
    return node
end
