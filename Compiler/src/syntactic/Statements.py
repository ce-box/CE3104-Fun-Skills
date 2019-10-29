# ------------------------------------------------------------
# File: Statements.py
# Developed by: Erick Barrantes, Jessica Espinoza
# Project: FunSkills-Compiler
# version: 1
#
# Last modified 19 /10 /19
# Description: Grammar for assignments
#
# TEC 2019 | CE3104 - Lenguajes, Compiladores e Interpretes
# -------------------------------------------------------------

from Compiler.src.syntactic.Operations import *
from Compiler.src.syntactic.Loops import *


# Definition for function content
def p_statements(p):
    '''statements : assignment statements
                | declaration statements
                | expression SEMICOLON statements
                | reservedFunctions statements
                | loop statements
                | COMMENT statements
                | empty'''


# Definition for reserved functions
def p_reservedFunctions(p):
    'reservedFunctions : functions args SEMICOLON'


def p_functions(p):
    '''functions : BALLOON
                | INC
                | DEC
                | RANDOM
                | ASSIGNWORD
                | TELAARANA
                | OBJECT'''


# Arguments for functions
def p_args(p):
    '''args : LPAREN atom args
            | COMMA atom args
            | RPAREN'''


# Definition for assignment of variables with typification
def p_assignment(p):
    '''assignment : type ID EQUAL atom SEMICOLON
                | ID EQUAL atom SEMICOLON'''

    ID = None
    value = None

    if len(p) == 6:
        ID = p[2]
        value = p[4]
    elif len(p) == 5:
        ID = p[1]
        value = p[3]

    if len(ID) <= 10:
        variables[ID] = value
    else:
        print("Syntactic Error: Variable %s identifier is too long." % ID)


# Definition for declaration of variables with typification
def p_declaration(p):
    'declaration : type ID SEMICOLON'
    if len(p[2]) <= 10:
        variables[p[2]] = None
    else:
        print("Syntactic Error: Variable %s identifier is too long." % p[2])


# Typification of variables
def p_type(p):
    '''type : INT
            | TEXTO LPAREN NUMBER RPAREN'''
    p[0] = p[1]


def p_atom(p):
    '''atom : STRING
            | expression'''
    p[0] = p[1]

