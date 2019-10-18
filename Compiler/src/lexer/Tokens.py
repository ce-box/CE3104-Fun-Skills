# ------------------------------------------------------------
# File: Tokens.py
# Developed by: Errick Barrantes, Jessica Espinoza
# Project: FunSkills-Compiler
# version: 1.2
#
# Description: Definition for simple tokens and reserved words
#
# TEC 2019 | CE3104 - Lenguajes, Compiladores e Interpretes
# ------------------------------------------------------------


# Regular expression rules for tokens
t_PLUS = r'\+'
t_MINUS = r'\-'
t_MULT = r'\*'
t_DIVIDE = r'\/'
t_EQUAL = r'\='
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
    'if': 'IF',
    'then': 'THEN',
    'else': 'ELSE',
    'while': 'WHILE',
    'for': 'FOR',
    'dow': 'DOW',
    'enddo': 'ENDDO',
    'forend': 'FOREND',
    'do': 'DO',
    'fend': 'FEND',
    'begin': 'BEGIN',
    'end': 'END',
    'int': 'INT',
    'texto': 'TEXTO',
    'times': 'TIMES',
    'using': 'USING',
    'main': 'MAIN',
    'balloon': 'BALLOON',
    'random': 'RANDOM',
    'telaArana': 'TELAARANA',
    'forAsignWord':'FORASIGNWORD',
    'asignWord':'ASIGNWORD',
    'object': 'OBJECT',
}

# List of tokens
tokens = ['LPAREN', 'RPAREN', 'LBRACE', 'RBRACE', 'LBRACKET', 'RBRACKET', 'PLUS', 'MINUS', 'MULT', 'DIVIDE',
          'EQUAL', 'ID', 'NUMBER', 'SEMICOLON', 'GAME', 'RESERVED', 'COMMA', 'STRING'] + list(reserved.values())