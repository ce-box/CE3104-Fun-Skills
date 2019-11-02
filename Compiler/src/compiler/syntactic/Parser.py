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

# Get the token map from the lexer.
from src.compiler.syntactic.Statements import *
from src.compiler.lexer.Lexer import tokens
from src.compiler.datastructures.TreeNode import *


astRoot = TreeNode("structure")
start = 'structure'


# Main structure for program
def p_structure(p):
    '''structure : COMMENT\
    BEGIN\
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

    for i in range(3, 22, 4):
        node = TreeNode(p[i])
        i += 2
        if p[i]:
            node.add_child(p[i])
        astRoot.add_child(node)

    p[0] = astRoot


# Build the parser
def parse(lex):
    parser = yacc.yacc()
    astTree = parser.parse(lexer = lex)
    print(variables)