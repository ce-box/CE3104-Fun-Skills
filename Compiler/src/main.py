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

from Compiler.src.lexer.Lexer import analyzeData
from Compiler.src.syntactic.Parser import parse


def main():
    # display_IDE_window()
    data = '''
    begin
    main{
    }
    game1{
    int a = 7;
    a = 7 + a;
    }
    game2{
    }
    game3{
    }
    game4{
    }
    end;
    
    '''
    analyzeData(data)
    parse(data)


if __name__ == '__main__':
    main()