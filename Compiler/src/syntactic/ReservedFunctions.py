from src.syntactic.Statements import *


def p_reservedFunction_balloon(p):
    'reservedFunction : BALLOON intArgs SEMICOLON'


def p_reservedFunction_inc(p):
    'reservedFunction : INC intArgs SEMICOLON'


def p_reservedFunction_dec(p):
    'reservedFunction : DEC intArgs SEMICOLON'


def p_reservedFunction_telaarana(p):
    'reservedFunction : TELAARANA intArgs SEMICOLON'


def p_intArgs(p):
    '''intArgs : LPAREN expression COMMA expression RPAREN'''
    # Validar que ambas expressions sean enteros.


def p_reservedFunction_assignword(p):
    'reservedFunction : ASSIGNWORD assignWordArgs SEMICOLON'


def p_assignWordArgs(p):
    '''assignWordArgs : LPAREN atom COMMA expression RPAREN'''
    # Validar que primer parametro sea Texto y segundo sea entero.


def p_reservedFunction_random(p):
    'reservedFunction : RANDOM randomArgs SEMICOLON'


def p_randomArgs(p):
    '''randomArgs : LPAREN atom COMMA expression COMMA expression RPAREN'''
    # Validar que primer parametro sea Texto y que el segundo y tercero sean enteros.


def p_reservedFunction_object(p):
    'reservedFunction : OBJECT objectArgs SEMICOLON'


def p_objectArgs(p):
    '''objectArgs : LPAREN expression COMMA expression COMMA expression RPAREN'''
    # Validar que todas las expressions sean enteros.
