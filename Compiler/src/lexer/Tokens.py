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
    'forasignword':'FORASIGNWORD',
    'asignword':'ASIGNWORD',
    'object': 'OBJECT',
}

# List of tokens
tokens = ['LPAREN', 'RPAREN', 'LBRACE', 'RBRACE', 'LBRACKET', 'RBRACKET', 'QUOTE', 'PLUS', 'MINUS', 'MULT', 'DIVIDE',
          'EQUAL', 'ID', 'NUMBER', 'SEMICOLON', 'GAME', 'RESERVED', 'COMMA'] + list(reserved.values())