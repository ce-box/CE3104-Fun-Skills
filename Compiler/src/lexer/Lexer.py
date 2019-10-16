# ------------------------------------------------------------

# ------------------------------------------------------------
import ply.lex as lex
from src.lexer.Rules import *


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
