
import ply.lex as lex
from src.compiler.lexer.Rules import *
from src.compiler.semantic import Semantic
from src.compiler.syntactic.Parser import *
from src.compiler.codegenerator.CodeGenerator import *
from src.compiler.datastructures.TreeNode import *


def compile(data):
    # Build the lexer
    lexer = lex.lex()
    # Receive input
    lexer.input(data)
    ast = parse(lexer)
    try:
        checkSymbolTable = Semantic.symbolAnalysis(symbolsTable)
        print(checkSymbolTable)
    except TypeError:
        print("TypeError")
    iterateTree(ast)