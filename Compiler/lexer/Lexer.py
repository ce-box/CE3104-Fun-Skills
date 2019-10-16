# ------------------------------------------------------------

# ------------------------------------------------------------
import ply.lex as lex
from Compiler.lexer.Rules import *


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
BeGiN
bEgIn
BEgIN
BeGIN
bEGIN
Game1
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
