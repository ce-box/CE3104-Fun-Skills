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
import copy

symbolsTable = {}
astRoot = TreeNode("structure")
start = 'structure'


# Main structure for program
def p_structure(p):
    '''structure : COMMENT\
    BEGIN\
    main\
    game\
    game\
    game\
    game\
    optionalComment\
    END SEMICOLON'''

    keyList = ["main", "game1", "game2", "game3", "game4"]
    index = 0
    for i in range(3, 8):
        node = TreeNode(keyList[index])
        if p[i]:
            node.add_child(p[i])
        astRoot.add_child(node)
        index += 1

    p[0] = astRoot


def p_main(p):
    '''main : COMMENT main
            | MAIN LBRACE statements RBRACE'''
    if len(p) == 5:
        symbolsTable["main"] = copy.deepcopy(variables)
        variables.clear()
        p[0] = p[3]


def p_game(p):
    '''game : COMMENT game
            | GAME LBRACE statements RBRACE'''
    if len(p) == 5:
        symbolsTable["game" + str(len(symbolsTable))] = copy.deepcopy(variables)
        variables.clear()
        p[0] = p[3]


def p_optionalComment(p):
    '''optionalComment : COMMENT optionalComment
                      | empty'''


# Build the parser
def parse(lex):
    parser = yacc.yacc()
    astTree = parser.parse(lexer = lex)
    print(symbolsTable)
    return astTree
