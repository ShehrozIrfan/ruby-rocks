# Obtain the maximum depth of a tree, from a given node to a leaf node
def max_depth(node)
    return 0 if node.nil?
    return [max_depth(node.left), max_depth(node.right)].max + 1
end
