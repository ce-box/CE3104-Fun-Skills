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

# int tiempo = 60;
# int cant = 3;
# str(10) color[3];
# color[0] = "Azul";
# color[1] = "Rojo";
# color[2] = "Verde";
# for 5 times using color
#   random(cant, tiempo);
#   inc(cant, 1);
#   dec(tiempo, 10);
# forend;


def main():
    # display_IDE_window()
    data = '''
    // Comentario inicial
    begin
    main{
    int a = 0;
    int a = 8;
    }
    game1{
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

    try:
        ast = parse(lexer)
        print("\n", symbolsTable)
        iterateTree(ast)
        Semantic.symbolAnalysis(symbolsTable)
        return "CODE COMPILED SUCCESFULLY"
    except Exception:
        file = open(globals.projectFolderPath + "/src/tmp/error_log.txt", "r")
        error_message = file.read()
        file.close()
        print(error_message)
        return error_message


if __name__ == '__main__':
    main()