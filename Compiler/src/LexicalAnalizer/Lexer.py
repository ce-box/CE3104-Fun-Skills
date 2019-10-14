# ------------------------------------------------------------
# File: Lexer.py
# Developed by: Erick Barrantes, Jessica Espinoza
# Project: FunSkills-[Compiler]
# version: 1.2
# last edited by: Erick Barrantes:: 13/10/19 22.24
#
# Description: Tokenizer for a simple expression evaluator for
# numbers and +,-,*,/
#
# TEC 2019 | CE3104 - Lenguajes, Compiladores e Interpretes
# ------------------------------------------------------------

import ply.lex as lex

# ---------------------------------------------------
#   REGULAR EXPRESSIONS-KEYWORDS-TOKENS DATABASE
# ---------------------------------------------------

# Regular expression rules for simple tokens
t_PLUS = r'\+'
t_MINUS = r'\-'
t_MULT = r'\*'
t_DIVIDE = r'\/'
t_EQUAL = r'='
t_LPAREN = r'\('
t_RPAREN = r'\)'
t_SEMICOLON = r'\;'
t_LBRACE = r'{'
t_RBRACE = r'}'
t_LBRACKET = r'\['
t_RBRACKET = r'\]'
t_COMMA = r','
t_QUOTE = r'\" | \''

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
    'telaarana': 'TELAARANA',
    'forasignword': 'FORASIGNWORD',
    'asignword': 'ASIGNWORD',
    'object': 'OBJECT',

}

# List of tokens
tokens = ['LPAREN', 'RPAREN', 'LBRACE', 'RBRACE', 'LBRACKET', 'RBRACKET', 'QUOTE', 'PLUS', 'MINUS', 'MULT', 'DIVIDE',
          'EQUAL', 'ID', 'NUMBER', 'SEMICOLON', 'GAME', 'RESERVED', 'COMMA'] + list(reserved.values())


# ---------------------------------------------------
#               REGULAR EXPRESSIONS RULES
# ---------------------------------------------------

def t_GAME(t):
    r'(?i)GAME[0-4]'
    return t


def t_ID(t):
    r'[a-z]([a-zA-Z]|[0-9]|&|-|@)*'
    value = t.value.lower()
    t.type = reserved.get(value, 'ID')
    return t


def t_RESERVED(t):
    r'[a-zA-Z]+'
    value = t.value.lower()
    t.type = reserved.get(value, 'ID')
    return t


# A regular expression rule with some action code
def t_NUMBER(t):
    r'\d+'
    t.value = int(t.value)
    return t


# Define a rule for tracking line numbers
def t_newline(t):
    r'\n+'
    t.lexer.lineno += len(t.value)


# A string containing ignored characters (spaces and tabs)
t_ignore = ' \t'


# Error handling rule
def t_error(t):
    print("SYNTAX ERROR: Invalid character", t.value[0], "at line number", t.lexer.lineno)
    t.lexer.skip(1)


# A function that ignores commentaries
def t_COMMENT(t):
    r'\//.*'
    pass
    # No return value. Token discarded


# Main function to analyze a received data (source code string) and returns a list with tuples, containing
# the token value and the token type for each lexeme found.
def analyzeData(data):
    # Build the lexer
    lexer = lex.lex()
    # Give the lexer some input
    lexer.input(data)
    # Tokenize
    tok_list = []
    while True:
        tok = lexer.token()
        if not tok:
            break  # No more input
        tok_list.append((tok.value, tok.type))
    return tok_list
