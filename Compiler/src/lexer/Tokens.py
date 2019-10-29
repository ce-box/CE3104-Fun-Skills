# ------------------------------------------------------------
# File: Tokens.py
# Developed by: Erick Barrantes, Jessica Espinoza
# Project: FunSkills-Compiler
# version: 1.2
#
# Description: Definition for simple tokens and reserved words
#
# TEC 2019 | CE3104 - Lenguajes, Compiladores e Interpretes
# ------------------------------------------------------------


# Regular expression rules for tokens


# Operators
t_PLUS = r'\+'
t_MINUS = r'\-'
t_MULT = r'\*'
t_DIVIDE = r'\/'
t_EQUAL = r'\='


# Symbols
t_LPAREN = r'\('
t_RPAREN = r'\)'
t_SEMICOLON = r'\;'
t_LBRACE = r'{'
t_RBRACE = r'}'
t_LBRACKET = r'\['
t_RBRACKET = r'\]'
t_COMMA = r','


# Reserved tokens (terminals)
reserved = {
    # Conditionals
    'if': 'IF',
    'then': 'THEN',
    'else': 'ELSE',
    'main': 'MAIN',

     # Loops
    'while': 'WHILE',
    'for': 'FOR',
    'dow': 'DOW',
    'enddo': 'ENDDO',
    'forend': 'FOREND',
    'do': 'DO',
    'times': 'TIMES',
    'using': 'USING',
    'fend': 'FEND',
    'begin': 'BEGIN',
    'end': 'END',

    # Types
    'int': 'INT',
    'texto': 'TEXTO',

    # Reserved functions
    'balloon': 'BALLOON',
    'random': 'RANDOM',
    'telaArana': 'TELAARANA',
    'forAssignWord':'FORASSIGNWORD',
    'assignWord':'ASSIGNWORD',
    'object': 'OBJECT',
    'inc' : 'INC',
    'dec' : 'DEC'
}

# List of tokens
tokens = ['LPAREN', 'RPAREN', 'LBRACE', 'RBRACE', 'LBRACKET', 'RBRACKET', 'PLUS', 'MINUS', 'MULT', 'DIVIDE',
          'EQUAL', 'ID', 'NUMBER', 'SEMICOLON', 'GAME', 'RESERVED', 'COMMA', 'STRING'] + list(reserved.values())