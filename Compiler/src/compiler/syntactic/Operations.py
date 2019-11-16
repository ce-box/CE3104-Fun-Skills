# ------------------------------------------------------------
# File: Operations.py
# Developed by: Erick Barrantes, Jessica Espinoza
# Project: FunSkills-Compiler
# version: 1
#
# Last modified 26 /10 /19
# Description: Grammar for mathematical operations
#
# TEC 2019 | CE3104 - Lenguajes, Compiladores e Interpretes
# -------------------------------------------------------------

import sys
import src.ide.globals as globals


funcList = []
variables = {}
precedence = (
    ('nonassoc', 'LESSTHAN', 'GREATERTHAN'),  # Nonassociative operators
    ('left', 'PLUS', 'MINUS'),
    ('left', 'TIMES', 'DIVIDE'),
    ('right', 'NEGATIVE'),  # Unary minus operator
)


# Basic operations
def p_expression_plus(p):
    'expression : expression PLUS term'
    p[0] = p[1] + p[3]


def p_expression_minus(p):
    'expression : expression MINUS term'
    p[0] = p[1] - p[3]


def p_term_times(p):
    'term : term MULT factor'
    p[0] = p[1] * p[3]


def p_term_div(p):
    'term : term DIVIDE factor'
    p[0] = p[1] / p[3]


def p_expression_negative(p):
    'expression : MINUS term %prec NEGATIVE'
    p[0] = -p[2]


# Basic atomic expressions

def p_expression_term(p):
    'expression : term'
    p[0] = p[1]


def p_term_factor(p):
    'term : factor'
    p[0] = p[1]


def p_factor_num(p):
    'factor : NUMBER'
    p[0] = p[1]


def p_factor_ID(p):
    'factor : ID'
    try:
        if isinstance(variables[p[1]][-1], int):
            p[0] = variables[p[1]][-1]
        else:
            print("'" + p[1] + "'", "must be integer")
    except KeyError:
        print("Syntactic Error: Variable %s has not been declared." % p[1])
        p[0] = 0


def p_factor_array(p):
    'factor : ID LBRACKET NUMBER RBRACKET'
    if variables[p[1]]:
        arrayList = variables[p[1]][1]
        if p[3] < len(arrayList):
            value = arrayList[p[3]]
            p[0] = value
        else:
            print("Index out of range")
    else:
        print("Syntactic Error: Variable %s has not been declared." % p[1])


def p_factor_expr(p):
    'factor : LPAREN expression RPAREN'
    p[0] = p[2]


def p_empty(p):
    "empty :"
    pass


# Error rule for syntax errors
def p_error(p):
    if p:
        error_message = "Syntax error in line: " + str(p.lineno)
        file = open(globals.projectFolderPath + "/src/tmp/error_log.txt", "w")
        file.write(error_message)
        file.close()
        raise SyntaxError
