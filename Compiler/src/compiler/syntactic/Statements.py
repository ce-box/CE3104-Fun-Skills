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
def p_assignment_declare(p):
    'assignment : type ID EQUAL atom SEMICOLON'

    assignmentNode = TreeNode("assignment")
    ID = p[2]
    if len(ID) <= 10:
        value = [p[1], p[4]]
        variables[ID] = value
        assignmentNode.add_children([p[1], p[2], p[4]])
        p[0] = assignmentNode
    else:
        print("Syntactic Error: Variable %s identifier is too long." % ID)


# Definition for reassignment of previously defined variables
def p_assignment_value(p):
    'assignment : ID EQUAL atom SEMICOLON'

    assignmentNode = TreeNode("assignment")

    if p[1] in variables:
        ID = p[1]
        value = variables[ID] + [p[3]]
        variables[ID] = value
        assignmentNode.add_children([p[1], p[3]])
        p[0] = assignmentNode
    else:
        print("Syntactic Error: Variable %s has not been declared." % p[1])


# Definition for value of specific position in array.
def p_assignment_array(p):
    'assignment : ID LBRACKET NUMBER RBRACKET EQUAL atom SEMICOLON'

    assignmentNode = TreeNode("assignment")

    if p[1] in variables:
        ID = p[1]
        position = p[3]
        arrayList = variables[ID][1]
        if position < len(arrayList):
            arrayList[position] = p[6]
            variables[ID] = [variables[ID][0]] + [arrayList]
            assignmentNode.add_children([p[1], p[3]])
            p[0] = assignmentNode
        else:
            print("Index out of range")
    else:
        print("Syntactic Error: Variable %s has not been declared." % p[1])


# Definition for declaration of variables with typification
def p_declaration_var(p):
    'declaration : type ID SEMICOLON'
    if len(p[2]) <= 10:
        variables[p[2]] = [p[1]]
    else:
        print("Syntactic Error: Variable %s identifier is too long." % p[2])


def p_declaration_array(p):
    'declaration : type array SEMICOLON'
    if len(p[2][0]) <= 10:
        arrayList = []
        for index in range(p[2][1]):
            arrayList.append(None)
        variables[p[2][0]] = [p[1] + "Array", arrayList]
    else:
        print("Syntactic Error: Variable %s identifier is too long." % p[2])


# Typification of variables
def p_type(p):
    '''type : INT
            | STR LPAREN NUMBER RPAREN'''
    p[0] = p[1]


def p_array(p):
    '''array : ID LBRACKET NUMBER RBRACKET'''
    p[0] = [p[1], p[3]]


def p_atom(p):
    '''atom : STRING
            | expression'''
    p[0] = p[1]

