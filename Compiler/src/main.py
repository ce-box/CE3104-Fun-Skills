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
from Compiler.src.lexer.Rules import *
from Compiler.src.syntactic.Parser import parse
from Compiler.src.datastructures.TreeNode import *


def main():
    # display_IDE_window()
    data = '''
    //caca2
    begin
    main{
    }
    game1{
    int a = 5;
    dow(a)
        balloon(2, 3);
    enddo;    
    }
    game2{
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


if __name__ == '__main__':
    main()