from src.compiler.datastructures.TreeNode import *
from src.json.json_balloon import *
from src.json.json_flags import *
from src.json.json_spidey import *
from src.json.json_object import *
from src.compiler.syntactic.Parser import symbolsTable

balloon_json = balloon()
flags_json = flags()
spidey_json = spidey()
object_json = object()
variables = {}


def iterateTree(tree):
    global variables
    keyList = ["main", "game1", "game2", "game3", "game4"]
    if not tree:
        return
    for child in tree.children:
        if child.value in keyList:
            variables = symbolsTable[child.value]
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
        forLoop(loop[1:])
    elif loopName == "forAssignWord":
        forAssignWordLoop(loop[1:])


def dowLoop(loop_content):
    iterations = loop_content[0]
    balloon_json.set_repeats(iterations)
    variables_names = {}
    for reserved_function in loop_content[1:]:
        function_content = reserved_function.children
        function_name = function_content[0]
        function_args = function_content[1].children
        balloon_game_values(function_name, function_args, variables_names, balloon_json)
    balloon_json.build_json()


def balloon_game_values(function_name, function_args, variables_names, json):
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


def forLoop(loop_content):
    iterations = loop_content[0]
    if variables[loop_content[1]][0][3:] == "Array":
        flags_json.set_repeats(iterations)
        colors = variables[loop_content[1]][1]
        flags_json.set_colors(colors)
        score = variables.get("score", [])
        if not score:
            cont = 5
            for i in range(len(colors)):
                score.append(cont)
                cont += 5
        else:
            score = score[-1]
        flags_json.set_points(score)
        for reserved_function in loop_content[2:]:
            function_content = reserved_function.children
            function_name = function_content[0]
            function_args = function_content[1].children
            flags_game_values(function_name, function_args, flags_json)
        flags_json.build_json()
    else:
        object_json.set_repeats(iterations)
        object_args = loop_content[2].children[1].children
        object_json.set_position(object_args[0], 0)
        object_json.set_time(object_args[3])
        object_json.set_positions(object_args[1].children[0])
        object_json.build_json()
    # They need to be build
    flags_json.build_json()


def flags_game_values(function_name, function_args, json):
    if function_name == "random":
        json.set_amnt(function_args[0].children[0])
        json.set_time(function_args[1].children[0])
    elif function_name == "inc":
        json.set_amnt_inc(function_args[1])
    elif function_name == "dec":
        json.set_time_dec(function_args[1])


def forAssignWordLoop(loop_content):
    spidey_json.set_rows(loop_content[0])
    spidey_json.set_cols(loop_content[1])

    function_content = loop_content[2].children
    function_args = function_content[1].children
    spidey_json.set_words(variables[function_args[0].value][-1])
    spidey_json.set_points(variables[function_args[1].value][-1])

    spidey_json.build_json()

