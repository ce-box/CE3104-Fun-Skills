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

from src.compiler.lexer.Tokens import *
from src.ide.ide_compile import *
import src.ide.globals as globals


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
    error_message = "LEXICAL ERROR: Invalid character '" + t.value[0] + "' at line number " + str(t.lexer.lineno)
    file = open(globals.projectFolderPath+"/src/tmp/error_log.txt", "w")
    file.write(error_message)
    file.close()
    raise SyntaxError


# A function that ignores comments
def t_COMMENT(t):
    r'\//.*'
    t.value = "comment"
    return t
