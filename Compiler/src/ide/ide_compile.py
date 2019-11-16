# ------------------------------------------------------------
# File: ide_compiler.py
# Developed by: Esteban Alvarado Vargas
# Project: FunSkills-[Compiler]
# version: 2.0
# last edited by: Esteban Alvarado:: 9/11/19 18.00
#
# Description: Enter the text to the compiler to analyze it
#
# TEC 2019 | CE3104 - Lenguajes, Compiladores e Interpretes
# ------------------------------------------------------------

import ply.lex as lex
from src.compiler.lexer.Rules import *
from src.compiler.semantic import Semantic
from src.compiler.syntactic.Parser import *
from src.compiler.codegenerator.CodeGenerator import *
from src.compiler.datastructures.TreeNode import *
import src.ide.globals as globals


def compile(data):

    # Build the lexer
    lexer = lex.lex()
    # Receive input
    lexer.input(data)

    try:
        ast = parse(lexer)
        print("\n", symbolsTable)
        iterateTree(ast)
    except SyntaxError:
        file = open(globals.projectFolderPath+"/src/tmp/error_log.txt", "r")
        error_message = file.read()
        file.close()
        return error_message

    # Check Semantic
    # try:
    #     checkSymbolTable = Semantic.symbolAnalysis(symbolsTable)
    #     print(checkSymbolTable)
    # except TypeError:
    #     state = TypeError
    #     return state

    # # Generate Code
    # iterateTree(ast)
    return