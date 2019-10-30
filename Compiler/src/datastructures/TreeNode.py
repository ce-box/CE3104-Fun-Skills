

class TreeNode:
    def __init__(self, x):
        self.value = x
        self.children = []

    def add_child(self, child):
        self.children.append(TreeNode(child))