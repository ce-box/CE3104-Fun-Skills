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



def p_assignment(p):
    '''assignment : type ID EQUAL atom SEMICOLON
                | ID EQUAL atom SEMICOLON'''
    if len(p) == 6:
        p[0] = p[4]

    elif len(p) == 5:
        p[0] = p[3]


def p_declaration(p):
    'declaration : type ID SEMICOLON'


def p_type(p):
    '''type : INT
            | TEXTO LPAREN NUMBER RPAREN'''
    p[0] = p[1]


def p_atom(p):
    '''atom : STRING
            | ID
            | expression'''
    p[0] = p[1]

