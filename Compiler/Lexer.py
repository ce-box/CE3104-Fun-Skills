# ------------------------------------------------------------
# calclex.py
#
# tokenizer for a simple expression evaluator for
# numbers and +,-,*,/
# ------------------------------------------------------------
import ply.lex as lex

# Regular expression rules for simple tokens
t_OPERATOR = r'\+ | \- | \* | \/'
t_LPAREN = r'\('
t_RPAREN = r'\)'
t_SEMICOLON = r'\;'

# Reserved tokens (terminals
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
    'end': 'END',
    'int': 'INT',
    'texto': 'TEXTO',
    'times': 'TIMES',
    'using': 'USING'
}

# List of tokens
tokens = ['LPAREN', 'RPAREN', 'OPERATOR', 'ID', 'NUMBER', 'SEMICOLON'] + list(reserved.values())


# Definition for variables
def t_ID(t):
    r'[a-z][a-zA-Z_0-9_&-@]*'
    t.type = reserved.get(t.value, 'ID')  # Check for reserved words
    return t

# A regular expression rule with some action code
def t_NUMBER(t):
    r'\d+'
    t.value = int(t.value)
    return t


# Define a rule so we can track line numbers
def t_newline(t):
    r'\n+'
    t.lexer.lineno += len(t.value)


# A string containing ignored characters (spaces and tabs)
t_ignore = ' \t'


# Error handling rule
def t_error(t):
    print("Illegal character '%s'" % t.value[0])
    t.lexer.skip(1)


# Build the lexer
lexer = lex.lex()


# Test it out
data = '''
poop_&-@555 555 5popo
'''

# Give the lexer some input
lexer.input(data)

# Tokenize
while True:
    tok = lexer.token()
    if not tok:
        break  # No more input
    print(tok)