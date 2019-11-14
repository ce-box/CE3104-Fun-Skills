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
    data = '''// Comentario inicial
    begin
    main{
        int a;
    }
    game1{
        int x = 3;
        int y = 10;
        int cant = 5;
        dow(cant)
            balloon(x, y);
            inc(x, 4);
            dec(y, 1);
        enddo;
    }
    game2{
        int tiempo = 60;
        int cant = 3;
        str(10) color[3];
        color[0] = "Azul";
        color[1] = "Rojo";
        color[2] = "Verde";
        for 5 times using color
            random(cant, tiempo);
            inc(cant, 1);
            dec(tiempo, 10);
        forend;
    }
    game3{
    }
    game4{
    }
    end;
    '''
    # Build the lexer
    lexer = lex.lex()
    # Receive input
    lexer.input(data)
    ast = parse(lexer)
    print("\n", symbolsTable)
    print("\n\n", ast.children[2].children[0].children, "\n\n")
    # try:
    #     checkSymbolTable = Semantic.symbolAnalysis(symbolsTable)
    # except TypeError:
    #     print("TypeError")
    iterateTree(ast)


if __name__ == '__main__':
    main()