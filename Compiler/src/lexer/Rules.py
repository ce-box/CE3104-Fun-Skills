# ------------------------------------------------------------
# File: Rules.py
# Developed by: Erick Barrantes, Jessica Espinoza
# Project: FunSkills-Compiler
# version: 1.2
#
# Description: Simple rules for regular expressions
#
# TEC 2019 | CE3104 - Lenguajes, Compiladores e Interpretes
# ------------------------------------------------------------
from ply.lex import TOKEN

from Compiler.src.lexer.Tokens import *


def t_GAME(t):
    r'game[0-4]'
    return t


def t_ID(t):
    r'[a-z]([a-zA-Z0-9&@_-])*'
    t.type = reserved.get(t.value, 'ID')    # Check for reserved words
    return t


def t_NUMBER(t):
    r'\d+'
    t.value = int(t.value)
    return t


def t_STRING(t):
    r'(\")[a-zA-Z |0-9]*(\")'
    t.value = str(t.value[1:-1])
    return t


# Define a rule for tracking line numbers
def t_newline(t):
    r'\n+'
    t.lexer.lineno += len(t.value)


# A string containing ignored characters (spaces and tabs)
t_ignore = ' \t'


# Error handling rules
def t_error(t):
    print("SYNTAX ERROR: Invalid character", t.value[0], "at line number", t.lexer.lineno)
    t.lexer.skip(1)


# A function that ignores comments
def t_COMMENT(t):
    r'\//.*'
    t.value = "comment"
    return t
