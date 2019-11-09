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
from src.compiler.codegenerator.CodeGenerator import *
from src.compiler.datastructures.TreeNode import *


def main():
    # display_IDE_window()
    data = '''
    // Comentario inicial
    begin
    main{
        int a = 1;
        int aaaaaaaaaaaaaa;
        str(1) ppppp;
        int aaaaaaaaaaaaaazzx;
    }
    game1{
        int x = 0;
        x = 7;
        int y = 9;
        balloon(x, y);
    }
    game2{
        int g = 0;
        int y = 6;
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
    # iterateTree(ast)
    # checkSymbolTable = Semantic.symbolAnalysis(variables)


if __name__ == '__main__':
    main()