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
        int aaa;
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
        
        int score[3];
        score[0] = 5;
        score[1] = 15;
        score[2] = 50;
        
        for 5 times using color
          random(cant, tiempo);
          inc(cant, 1);
          dec(tiempo, 10);
        forend;
    }
    game3{
        int miFila = 3;
        int miCol = 5;
        
        int score[3];
        score[0] = 5;
        score[1] = 50;
        score[2] = 15;
        
        str(10) palabras[3];
        palabras[0] = "Oceano";
        palabras[1] = "Ganja";
        palabras[2] = "Pene";
        
        telaArana(miFila, miCol);
        
        forAssignWord(miFila, miCol) do
            assignWord(palabras, score);
        forend;
    }
    game4{
        int alt = 2;
        int tiempo = 25;
        int dist[5];
        dist[0] = 2;
        dist[1] = 5;
        dist[2] = 1;
        dist[3] = 7;
        dist[4] = 1;
       
        int var1 = 0; 
        for 5 times using var1
            object(alt, dist[var1], tiempo);
        forend;
        
    }
    end;
    '''
    # Build the lexer
    lexer = lex.lex()
    # Receive input
    lexer.input(data)

    try:
        ast = parse(lexer)
        print("\n", symbolsTable, "\n\n\n")
        iterateTree(ast)
    except SyntaxError:
        file = open("tmp/error_log.txt", "r")
        error_message = file.read()
        file.close()
        print(error_message)
        return error_message

    # try:
    #     checkSymbolTable = Semantic.symbolAnalysis(symbolsTable)
    # except TypeError:
    #     print("TypeError")


if __name__ == '__main__':
    main()