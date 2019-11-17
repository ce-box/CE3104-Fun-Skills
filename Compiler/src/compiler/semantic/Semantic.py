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
    checkVariables(st)
    for dict in st.values():
        for value in dict.values():
            type = value[0]
            if type.endswith('Array'):
                checkArrayType(value)
            else:
                for index in range(1, len(value)):
                    if not isinstance(value[index], eval(type)):
                        error_message = "Type error in " + value[index]
                        file = open(globals.projectFolderPath + "/src/tmp/error_log.txt", "w")
                        file.write(error_message)
                        file.close()
                        raise Exception
                    else:
                        continue
    return


def checkArrayType(list):
    if list[0].startswith('str'):
        for value in list[1]:
            if isinstance(value, str) or not value:
                continue
            else:
                error_message = "Type error in strArray"
                file = open(globals.projectFolderPath + "/src/tmp/error_log.txt", "w")
                file.write(error_message)
                file.close()
                raise Exception
    elif list[0].startswith('int'):
        for value in list[1]:
            if isinstance(value, int) or not value:
                continue
            else:
                error_message = "Type error in intArray"
                file = open(globals.projectFolderPath + "/src/tmp/error_log.txt", "w")
                file.write(error_message)
                file.close()
                raise Exception


def checkVariables(st):
    a = 0
    for dict in st.values():
        a += len(dict)
    if a == 0:
        error_message = "Semantic Error: Must at least use one identifier"
        file = open(globals.projectFolderPath + "/src/tmp/error_log.txt", "w")
        file.write(error_message)
        file.close()
        raise Exception


