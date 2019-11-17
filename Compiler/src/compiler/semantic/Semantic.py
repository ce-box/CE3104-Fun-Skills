# ------------------------------------------------------------
# File: Semantic.py
# Developed by: Erick Barrantes, Jessica Espinoza
# Project: FunSkills-Compiler
# version: 1
#
# Last modified 1 /11 /19
# Description:
#
# TEC 2019 | CE3104 - Lenguajes, Compiladores e Interpretes
# -------------------------------------------------------------

import src.ide.globals as globals

def symbolAnalysis(st):
    for dict in st.values():
        for value in dict.values():
            type = value[0]
            for index2 in range(1, len(value)):
                result = isinstance(value[index2], eval(type))
                if not result:
                    raise TypeError
    return result


def checkVariables(st):
    a = 0
    for dict in st.values():
        a += len(dict)
    if a > 0:
        error_message = "Semantic Error: Must at least use one identifier"
        file = open(globals.projectFolderPath + "/src/tmp/error_log.txt", "w")
        file.write(error_message)
        file.close()
        return
    else:
        raise Exception