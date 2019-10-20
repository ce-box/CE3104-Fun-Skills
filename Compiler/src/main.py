# ------------------------------------------------------------
# File: main.py
# Developed by: Erick Barrantes
# Project: FunSkills-[Compiler]
# version: 1.0
# last edited by: Erick Barrantes:: 13/10/19 22.24
#
# Description: Calls all the functions to create the main flow
#              for the compiler/ide application.
#
# TEC 2019 | CE3104 - Lenguajes, Compiladores e Interpretes
# ------------------------------------------------------------

from Compiler.src.lexer.Lexer import analyzeData
from Compiler.src.Syntactic.parser import parse


def main():
    # display_IDE_window()
    data = "3 * 3"
    analyzeData(data)
    parse(data)


if __name__ == '__main__':
    main()