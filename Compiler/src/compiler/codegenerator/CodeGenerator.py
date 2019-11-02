from src.compiler.datastructures.TreeNode import *


def iterateTree(tree):
    for child in tree.children:
        if isinstance(child, TreeNode):
            print(child.value)
            if child.value == "loop":
                evaluateLoop(child.children)
            else:
                iterateTree(child)


def evaluateLoop(loop):
    loopName = loop[0]
    if loopName == "dow":
        dowLoop(loop[1:])
    elif loopName == "for":
        return
    elif loopName == "forAssign":
        return


def dowLoop(loop_content):
    iterations = loop_content[0]
    args = []
    balloon_values = []
    for instruction in loop_content[1:]:
        if instruction.value == "function":
            function = instruction.children
            function_name = function[0]
            args = function[1].children
            if isinstance(args[0], TreeNode) and isinstance(args[1], TreeNode):
                print(args[0].children, args[1].children)
            # if function_name == "balloon":
            #     balloon_values.append(str(args[0]) + "," + str(args[1]))
