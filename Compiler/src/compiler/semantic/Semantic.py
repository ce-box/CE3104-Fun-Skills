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


def symbolAnalysis(st):
    for dict in st.values():
        for value in dict.values():
            type = value[0]
            for index2 in range(1, len(value)):
                result = isinstance(value[index2], eval(type))
                if not result:
                    raise TypeError
    return result

