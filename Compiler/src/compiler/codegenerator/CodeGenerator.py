from src.compiler.datastructures.TreeNode import *
from src.json.json_balloon import *


def iterateTree(tree):
    for child in tree.children:
        if isinstance(child, TreeNode):
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
    balloon_values = balloon()
    balloon_values.set_repeats(iterations)
    variables_names = {}
    for reserved_function in loop_content[1:]:
        function_content = reserved_function.children
        function_name = function_content[0]
        function_args = function_content[1].children
        balloonGameValues(function_name, function_args, variables_names, balloon_values)
    balloon_values.build_json()


def balloonGameValues(function_name, function_args, variables_names, json):
    if function_name == "balloon":
        variables_names["height"] = function_args[0].value
        variables_names["length"] = function_args[1].value
        json.set_position(function_args[0].children[0], function_args[1].children[0])
    elif function_name == "inc":
        if variables_names["height"] == function_args[0].value:
            json.set_height_increment(function_args[1])
        elif variables_names["length"] == function_args[0].value:
            json.set_length_increment(function_args[1])
    elif function_name == "dec":
        if variables_names["height"] == function_args[0].value:
            json.set_height_decrement(function_args[1])
        elif variables_names["length"] == function_args[0].value:
            json.set_length_decrement(function_args[1])
