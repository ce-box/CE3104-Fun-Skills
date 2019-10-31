# ------------------------------------------------------------
# File: Lexer.py
# Developed by: Errick Barrantes, Jessica Espinoza
# Project: FunSkills-Compiler
# version: 1.2
#
# Description: Tokenizer for a simple expression evaluator for
# numbers and +,-,*,/
#
# TEC 2019 | CE3104 - Lenguajes, Compiladores e Interpretes
# ------------------------------------------------------------
import ply.lex as lex
from src.compiler.lexer.Rules import *


# Main function to analyze a received data (source code string) and returns a list with tuples, containing
# the token value and the token type for each lexeme found.
def analyzeData(data):
    # Build the lexer
    lexer = lex.lex()
    # Receive input
    lexer.input(data)
    # Create tokens list
    token_list = []
    while True:
        tok = lexer.token()
        if not tok:
            break  # No more input
        #print(tok)
        token_list.append((tok.value, tok.type))
    return token_list