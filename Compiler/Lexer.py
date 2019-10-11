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
t_EQUAL = r'='
t_LPAREN = r'\('
t_RPAREN = r'\)'
t_SEMICOLON = r'\;'
t_LBRACE = r'{'
t_RBRACE = r'}'
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
    'telaarana': 'TELAARANA',
    'forasignword':'FORASIGNWORD',
    'asignword':'ASIGNWORD',
    'object': 'OBJECT',

}

# List of tokens
tokens = ['LPAREN', 'RPAREN', 'LBRACE', 'RBRACE', 'PLUS', 'MINUS', 'MULT', 'DIVIDE', 'EQUAL', 'ID', 'NUMBER', 'SEMICOLON',
          'GAME', 'RESERVED', 'COMMA'] + list(reserved.values())


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
BEGIN
Main{
    Game1()
    Game2()
    Game3()
    Game4()
}

Game1{
    Int alt = 2
    int lat = 4
    
    Balloon (alt, lat)
    Balloon (2,4)
    int cantidad=5
    
    Dow (cantidad)
        Balloon (alt,lat)
        Inc (alt, 1)
        Dec (lat, 2)
}
game2{}
GAME3{}
Game4{}
END
'''
# Give the lexer some input
lexer.input(data)
# Tokenize
while True:
    tok = lexer.token()
    if not tok:
        break  # No more input
    print(tok)
