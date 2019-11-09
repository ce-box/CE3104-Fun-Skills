# ------------------------------------------------------------
# File: main.py
# Developed by: Erick Barrantes, Jessica Espinoza
# Project: FunSkills-[Compiler]
# version: 1.0
# last edited by:// Comentario inicial
#     begin
#     main{
#         int a;
#     }
#     game1{
#         int x = 0;
#         int y = 15;
#         int cant = 5;
#         dow(cant)
#             balloon(x, y);
#             inc(x, 1);
#             dec(y, 2);
#         enddo;
#     }
#     game2{
#     }
#     game3{
#     }
#     game4{
#     }
#     end; Erick Barrantes, Jessica Espinoza:: 13/10/19 22.24
#
# Description: Calls all the functions to create the main flow
#              for the compiler/ide application.
#
# TEC 2019 | CE3104 - Lenguajes, Compiladores e Interpretes
# ------------------------------------------------------------

import ply.lex as lex
from src.compiler.lexer.Rules import *
from src.compiler.semantic import Semantic
from src.compiler.syntactic.Parser import *
from src.compiler.codegenerator.CodeGenerator import *
from src.compiler.datastructures.TreeNode import *


def main():
    # display_IDE_window()
    data = '''
    
    
    '''
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


if __name__ == '__main__':
    main()