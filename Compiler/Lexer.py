# ------------------------------------------------------------
# calclex.py
#
# tokenizer for a simple expression evaluator for
# numbers and +,-,*,/
# ------------------------------------------------------------
import ply.lex as lex

# Regular expression rules for simple tokens
t_PLUS = r'\+'
t_MINUS = r'\-'
t_MULT = r'\*'
t_DIVIDE = r'\/'
t_LPAREN = r'\('
t_RPAREN = r'\)'
t_SEMICOLON = r'\;'
t_LBRACE = r'{'
t_RBRACE = r'}'

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
    'telaaraña': 'TELARAÑA',
    'forasignword':'FORASIGNWORD',
    'asignword':'ASIGNWORD',
    'object': 'OBJECT',

}

# List of tokens
tokens = ['LPAREN', 'RPAREN', 'LBRACE', 'RBRACE', 'PLUS', 'MINUS', 'MULT', 'DIVIDE', 'ID', 'NUMBER', 'SEMICOLON', 'GAME',
          'RESERVED'] \
         + list(reserved.values())



def t_ID(t):
    r'[a-z][a-zA-Z_0-9_&-@]*'
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
    print("Illegal character '%s'" % t.value[0])
    t.lexer.skip(1)


# A function that ignores commentaries
def t_COMMENT(t):
    r'\//.*'
    pass
    # No return value. Token discarded


# Build the lexer
lexer = lex.lex()
# Test it out
data = '''
For
FOR
for
fOr
FoR
FOr
fOR
Begin
begin
asdasas
aFDEC
a899Ddas@&-_
'''
# Give the lexer some input
lexer.input(data)
# Tokenize
while True:
    tok = lexer.token()
    if not tok:
        break  # No more input
    print(tok)
