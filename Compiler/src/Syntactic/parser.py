import ply.yacc as yacc

# Get the token map from the lexer.  This is required.
from Compiler.src.lexer.Rules import tokens


def p_expression_plus(p):
    'expression : expression PLUS term'
    p[0] = p[1] + p[3]


def p_expression_minus(p):
    'expression : expression MINUS term'
    p[0] = p[1] - p[3]


start = 'structure'

def p_structure(p):
    '''structure : BEGIN\
    MAIN LBRACE\
    statements\
    RBRACE\
    GAME LBRACE\
    statements\
    RBRACE\
    GAME LBRACE\
    statements\
    RBRACE\
    GAME LBRACE\
    statements\
    RBRACE\
    GAME LBRACE\
    statements\
    RBRACE\
    END SEMICOLON'''

def p_term_times(p):
    'term : term MULT factor'
    p[0] = p[1] * p[3]

def p_statements(p):
    '''statements : assignment statements
                | declaration statements
                | expression SEMICOLON statements
                | reservedFunctions statements
                | empty'''
# loop



# Error rule for syntax errors
def p_error(p):
    print("Syntax error in input!")


def parse(data):
    # Build the parser
    parser = yacc.yacc()
    result = parser.parse(data)
    print(result)