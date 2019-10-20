# ------------------------------------------------------------
# File: Parser.py
# Developed by: Erick Barrantes, Jessica Espinoza
# Project: FunSkills-Compiler
# version: 1
#
# Last modified 19 /10 /19
# Description: Grammar for main structures
#
# TEC 2019 | CE3104 - Lenguajes, Compiladores e Interpretes
# -------------------------------------------------------------

import ply.yacc as yacc

from Compiler.src.syntactic.Statements import *

# Get the token map from the lexer.
from Compiler.src.lexer.Lexer import tokens


start = 'structure'


# Main structure for program
def p_structure(p):
    '''structure : BEGIN\
    MAIN LBRACE\
    statements\
    RBRACE\
    GAME LBRACE\
    statements\
    RBRACE\
    GAME LBRACE\
    statements\
    RBRACE\
    GAME LBRACE\
    statements\
    RBRACE\
    GAME LBRACE\
    statements\
    RBRACE\
    END SEMICOLON'''


# Build the parser
def parse(data):
    parser = yacc.yacc()
    result = parser.parse(data)
    print(result)