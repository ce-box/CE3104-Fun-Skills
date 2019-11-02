# ------------------------------------------------------------
# File: Statements.py
# Developed by: Erick Barrantes, Jessica Espinoza
# Project: FunSkills-Compiler
# version: 1
#
# Last modified 26 /10 /19
# Description: Grammar for assignments
#
# TEC 2019 | CE3104 - Lenguajes, Compiladores e Interpretes
# -------------------------------------------------------------

from src.compiler.syntactic.Operations import *
from src.compiler.syntactic.Loops import *
from src.compiler.syntactic.ReservedFunctions import *
from src.compiler.datastructures.TreeNode import *


# Definition for function content
def p_statements_1(p):
    '''statements : assignment statements
                | declaration statements
                | reservedFunction statements
                | loop statements'''
    node = TreeNode("statements")
    node.add_child(p[1])
    if p[2]:
        node.add_child(p[2])
    p[0] = node


def p_statements_2(p):
    '''statements : expression SEMICOLON statements'''
    node = TreeNode("statements")
    node.add_child(p[1])
    if p[2]:
        node.add_child(p[3])
    p[0] = node


def p_statements_3(p):
    '''statements : COMMENT statements'''
    node = TreeNode("statements")
    if p[2]:
        node.add_child(p[2])
    p[0] = node


def p_statements_4(p):
    '''statements : empty'''


# Definition for assignment of variables with typification
def p_assignment(p):
    '''assignment : type ID EQUAL atom SEMICOLON
                  | ID EQUAL atom SEMICOLON'''

    ID = None
    value = None
    assignmentNode = TreeNode("assignment")

    if len(p) == 6:
        ID = p[2]
        value = [p[1], p[4]]
        assignmentNode.add_children([p[1], p[2], p[4]])
        p[0] = assignmentNode
    elif len(p) == 5:
        if p[1] in variables:
            ID = p[1]
            value = variables[ID] + [p[3]]
            assignmentNode.add_children([p[1], p[3]])
            p[0] = assignmentNode
        else:
            print("Syntactic Error: Variable %s has not been declared." % p[1])

    if ID:
        if len(ID) <= 10:
            variables[ID] = value
        else:
            print("Syntactic Error: Variable %s identifier is too long." % ID)


# Definition for declaration of variables with typification
def p_declaration(p):
    '''declaration : type ID SEMICOLON
                   | type array SEMICOLON'''
    if len(p[2]) <= 10:
        variables[p[2]] = [p[1]]
    else:
        print("Syntactic Error: Variable %s identifier is too long." % p[2])


# Typification of variables
def p_type(p):
    '''type : INT
            | STR LPAREN NUMBER RPAREN'''
    p[0] = p[1]


def p_array(p):
    '''array : ID LBRACKET NUMBER RBRACKET'''
    p[0] = p[1]


def p_atom(p):
    '''atom : STRING
            | expression'''
    p[0] = p[1]

