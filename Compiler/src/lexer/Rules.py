# Simple rules for regular expresions


from src.lexer.Tokens import *

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
