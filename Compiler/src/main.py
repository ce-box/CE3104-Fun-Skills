# ------------------------------------------------------------
# File: main.py
# Developed by: Erick Barrantes, Jessica Espinoza
# Project: FunSkills-[Compiler]
# version: 1.0
# last edited by: Erick Barrantes, Jessica Espinoza:: 13/10/19 22.24
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
from src.compiler.datastructures.TreeNode import *


def main():
    # display_IDE_window()
    data = '''
    // Comentario inicial
    begin
    main{
    }
    game1{
        int a = 3;
        int x = 0;
        int y = 10;
        dow(a)
            balloon(x, y);
            inc(x, 1);
            dec(y, 1);
        enddo;   
    }
    game2{
        int a = 0;
        for 5 times using a
            random("color", 0, 0);
            inc(0, 3);
            dec(0, 10);
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
    print(ast.children[2].children[0].children)
    # checkSymbolTable = Semantic.symbolAnalysis(variables)


if __name__ == '__main__':
    main()