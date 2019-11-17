

class TreeNode:
    def __init__(self, x):
        self.value = x
        self.children = []

    def add_child(self, child):
        self.children.append(child)

    def add_children(self, children):
        for child in children:
            self.add_child(child)

    # def print_tree(self, node, tab):
    #     self.print_tree(tab + "\t")