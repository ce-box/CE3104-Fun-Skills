import ply.yacc as yacc

# Get the token map from the lexer.
from Compiler.src.lexer.Lexer import tokens


def p_initial(p):
    '''initial : BEGIN\
    MAIN LBRACE RBRACE\
    GAME LBRACE RBRACE\
    GAME LBRACE RBRACE\
    GAME LBRACE RBRACE\
    GAME LBRACE RBRACE\
    END SEMICOLON'''


def p_expression_plus(p):
    'expression : expression PLUS term'
    p[0] = p[1] + p[3]


def p_expression_minus(p):
    'expression : expression MINUS term'
    p[0] = p[1] - p[3]


def p_expression_negative(p):
    'expression : MINUS term'
    p[0] = -p[2]


def p_expression_term(p):
    'expression : term'
    p[0] = p[1]


def p_term_times(p):
    'term : term MULT factor'
    p[0] = p[1] * p[3]


def p_term_div(p):
    'term : term DIVIDE factor'
    p[0] = p[1] / p[3]


def p_term_factor(p):
    'term : factor'
    p[0] = p[1]


def p_factor_num(p):
    'factor : NUMBER'
    p[0] = p[1]


def p_factor_str(p):
    'factor : STRING'
    p[0] = p[1]


def p_factor_ID(p):
    'factor : ID'
    p[0] = p[1]


def p_factor_expr(p):
    'factor : LPAREN expression RPAREN'
    p[0] = p[2]


def p_factor_assignment(p):
    'factor : INT ID EQUAL NUMBER'
    p[0] = p[4]


# Error rule for syntax errors
def p_error(p):
    print("Syntax error")


# Build the parser
def parse(data):
    parser = yacc.yacc()
    result = parser.parse(data)
    print(result)