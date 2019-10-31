# ------------------------------------------------------------
# File: test_lexer.py
# Developed by: Erick Barrantes
# Project: FunSkills-[Compiler]
# version: 1.0
# last edited by: Erick Barrantes:: 12/10/19 14.30
#
# Description: Test functions for Lexer.py
#
# TEC 2019 | CE3104 - Lenguajes, Compiladores e Interpretes
# ------------------------------------------------------------

import src.lexer.Lexer as Lexer

# -------------------------------------------------
#                       TESTS
# -------------------------------------------------


def test_lexer_main():
    data = """
        begin   
        main{
        }
        end;
        """

    analyzed_tok_list = Lexer.analyzeData(data)
    expected_tok_list = [("begin", "BEGIN"),
                         ("main", "MAIN"), ('{', 'LBRACE'),
                         ('}', 'RBRACE'),
                         ("end", "END"), (';', 'SEMICOLON')]
    assert analyzed_tok_list == expected_tok_list


def test_lexer_game1():
    data = """
    game1{
        int alt = 2;
        int lat = 4;

        balloon (alt, lat);
        balloon (2,4);
        int cantidad=5;

        dow (cantidad)
            balloon (alt,lat);
            inc (alt, 1);
            dec (lat, 2);
        enddo;
    }
    """

    analyzed_tok_list = Lexer.analyzeData(data)
    expected_tok_list = [('game1', 'GAME'), ('{', 'LBRACE'),
                         ('int', 'INT'), ('alt', 'ID'), ('=', 'EQUAL'), (2, 'NUMBER'), (';', 'SEMICOLON'),
                         ('int', 'INT'), ('lat', 'ID'), ('=', 'EQUAL'), (4, 'NUMBER'), (';', 'SEMICOLON'),
                         ('balloon', 'BALLOON'), ('(', 'LPAREN'), ('alt', 'ID'), (',', 'COMMA'), ('lat', 'ID'), (')', 'RPAREN'), (';', 'SEMICOLON'),
                         ('balloon', 'BALLOON'), ('(', 'LPAREN'), (2, 'NUMBER'), (',', 'COMMA'), (4, 'NUMBER'), (')', 'RPAREN'), (';', 'SEMICOLON'),
                         ('int', 'INT'), ('cantidad', 'ID'), ('=', 'EQUAL'), (5, 'NUMBER'), (';', 'SEMICOLON'),
                         ('dow', 'DOW'), ('(', 'LPAREN'), ('cantidad', 'ID'), (')', 'RPAREN'),
                         ('balloon', 'BALLOON'), ('(', 'LPAREN'), ('alt', 'ID'), (',', 'COMMA'), ('lat', 'ID'), (')', 'RPAREN'), (';', 'SEMICOLON'),
                         ('inc', 'ID'), ('(', 'LPAREN'), ('alt', 'ID'),(',', 'COMMA'), (1, 'NUMBER'), (')', 'RPAREN'), (';', 'SEMICOLON'),
                         ('dec', 'ID'), ('(', 'LPAREN'), ('lat', 'ID'), (',', 'COMMA'), (2, 'NUMBER'), (')', 'RPAREN'), (';', 'SEMICOLON'),
                         ('enddo', 'ENDDO'), (';', 'SEMICOLON'),
                         ('}', 'RBRACE')]

    assert analyzed_tok_list == expected_tok_list


def test_lexer_game2():
    data = """
    game2{
        texto(10)  color[10];
        int puntaje[10];
        color[1] = "1Azul   90";
        puntaje[1] = 10;

        int tiempo = 60;
        int cant = 3;

        for 5 times using color
            random(color, cantidad, tiempo);
            inc(cant, 3);
            dec(tiempo, 10);
        forend;
    }
    """

    analyzed_tok_list = Lexer.analyzeData(data)
    expected_tok_list = [('game2', 'GAME'), ('{', 'LBRACE'),
                         ('texto', 'TEXTO'), ('(', 'LPAREN'), (10, 'NUMBER'), (')', 'RPAREN'), ('color', 'ID'), ('[', 'LBRACKET'), (10, 'NUMBER'), (']', 'RBRACKET'), (';', 'SEMICOLON'),
                         ('int', 'INT'), ('puntaje', 'ID'), ('[', 'LBRACKET'), (10, 'NUMBER'), (']', 'RBRACKET'), (';', 'SEMICOLON'),
                         ('color', 'ID'), ('[', 'LBRACKET'), (1, 'NUMBER'), (']', 'RBRACKET'), ('=', 'EQUAL'), ('1Azul   90', 'STRING'), (';', 'SEMICOLON'),
                         ('puntaje', 'ID'), ('[', 'LBRACKET'), (1, 'NUMBER'), (']', 'RBRACKET'), ('=', 'EQUAL'), (10, 'NUMBER'), (';', 'SEMICOLON'),
                         ('int', 'INT'), ('tiempo', 'ID'), ('=', 'EQUAL'), (60, 'NUMBER'), (';', 'SEMICOLON'),
                         ('int', 'INT'), ('cant', 'ID'), ('=', 'EQUAL'), (3, 'NUMBER'), (';', 'SEMICOLON'),
                         ('for', 'FOR'), (5, 'NUMBER'), ('times', 'TIMES'), ('using', 'USING'), ('color', 'ID'),
                         ('random', 'RANDOM'), ('(', 'LPAREN'), ('color', 'ID'), (',', 'COMMA'), ('cantidad', 'ID'), (',', 'COMMA'), ('tiempo', 'ID'), (')', 'RPAREN'), (';', 'SEMICOLON'),
                         ('inc', 'ID'), ('(', 'LPAREN'), ('cant', 'ID'), (',', 'COMMA'), (3, 'NUMBER'), (')', 'RPAREN'), (';', 'SEMICOLON'),
                         ('dec', 'ID'), ('(', 'LPAREN'), ('tiempo', 'ID'), (',', 'COMMA'), (10, 'NUMBER'), (')', 'RPAREN'), (';', 'SEMICOLON'),
                         ('forend', 'FOREND'), (';', 'SEMICOLON'),
                         ('}', 'RBRACE')]

    assert analyzed_tok_list == expected_tok_list


def test_lexer_game3():
    data = """
    game3{
        int miFila = 5;
        int miCol  = 5;
        
        texto(10) miArr[25];
        miArr[1] = "azul";
        miArr[2] = "Rojo";
        
        int miPuntaje[25];
        miPuntaje[1] = 10;
        miPuntaje[2] = 15;
        
        telaArana(miFila, miCol);
        forAsignWord(miFila, miCol) do
            asignWord(miArr, miPuntaje);
    }
    """

    analyzed_tok_list = Lexer.analyzeData(data)
    expected_tok_list = [('game3', 'GAME'), ('{', 'LBRACE'),
                         ('int', 'INT'), ('miFila', 'ID'), ('=', 'EQUAL'), (5, 'NUMBER'), (';', 'SEMICOLON'),
                         ('int', 'INT'), ('miCol', 'ID'), ('=', 'EQUAL'), (5, 'NUMBER'), (';', 'SEMICOLON'),
                         ('texto', 'TEXTO'), ('(', 'LPAREN'), (10, 'NUMBER'), (')', 'RPAREN'), ('miArr', 'ID'), ('[', 'LBRACKET'), (25, 'NUMBER'), (']', 'RBRACKET'), (';', 'SEMICOLON'),
                         ('miArr', 'ID'), ('[', 'LBRACKET'), (1, 'NUMBER'), (']', 'RBRACKET'), ('=', 'EQUAL'), ('azul', 'STRING'), (';', 'SEMICOLON'),
                         ('miArr', 'ID'), ('[', 'LBRACKET'), (2, 'NUMBER'), (']', 'RBRACKET'), ('=', 'EQUAL'), ('Rojo', 'STRING'), (';', 'SEMICOLON'),
                         ('int', 'INT'), ('miPuntaje', 'ID'), ('[', 'LBRACKET'), (25, 'NUMBER'), (']', 'RBRACKET'), (';', 'SEMICOLON'),
                         ('miPuntaje', 'ID'), ('[', 'LBRACKET'), (1, 'NUMBER'), (']', 'RBRACKET'), ('=', 'EQUAL'), (10, 'NUMBER'), (';', 'SEMICOLON'),
                         ('miPuntaje', 'ID'), ('[', 'LBRACKET'), (2, 'NUMBER'), (']', 'RBRACKET'), ('=', 'EQUAL'), (15, 'NUMBER'), (';', 'SEMICOLON'),
                         ('telaArana', 'TELAARANA'), ('(', 'LPAREN'), ('miFila', 'ID'), (',', 'COMMA'), ('miCol', 'ID'), (')', 'RPAREN'), (';', 'SEMICOLON'),
                         ('forAsignWord', 'FORASIGNWORD'), ('(', 'LPAREN'), ('miFila', 'ID'), (',', 'COMMA'), ('miCol', 'ID'), (')', 'RPAREN'), ('do', 'DO'),
                         ('asignWord', 'ASIGNWORD'), ('(', 'LPAREN'), ('miArr', 'ID'), (',', 'COMMA'), ('miPuntaje', 'ID'), (')', 'RPAREN'), (';', 'SEMICOLON'),
                         ('}', 'RBRACE')]

    assert analyzed_tok_list == expected_tok_list


def test_lexer_game4():
    data = """
    game4{
        int dist[5];
        dist[1] = 2;
        dist[2] = 5;
        dist[3] = 1;
        dist[4] = 7;
        dist[5] = 1;
        for  5  times using var1
            object(2, dist[var1], 25);
        fend;
    }
    """

    analyzed_tok_list = Lexer.analyzeData(data)
    expected_tok_list = [('game4', 'GAME'), ('{', 'LBRACE'),
                         ('int', 'INT'), ('dist', 'ID'), ('[', 'LBRACKET'), (5, 'NUMBER'), (']', 'RBRACKET'), (';', 'SEMICOLON'),
                         ('dist', 'ID'), ('[', 'LBRACKET'), (1, 'NUMBER'), (']', 'RBRACKET'), ('=', 'EQUAL'), (2, 'NUMBER'), (';', 'SEMICOLON'),
                         ('dist', 'ID'), ('[', 'LBRACKET'), (2, 'NUMBER'), (']', 'RBRACKET'), ('=', 'EQUAL'), (5, 'NUMBER'), (';', 'SEMICOLON'),
                         ('dist', 'ID'), ('[', 'LBRACKET'), (3, 'NUMBER'), (']', 'RBRACKET'), ('=', 'EQUAL'), (1, 'NUMBER'), (';', 'SEMICOLON'),
                         ('dist', 'ID'), ('[', 'LBRACKET'), (4, 'NUMBER'), (']', 'RBRACKET'), ('=', 'EQUAL'), (7, 'NUMBER'), (';', 'SEMICOLON'),
                         ('dist', 'ID'), ('[', 'LBRACKET'), (5, 'NUMBER'), (']', 'RBRACKET'), ('=', 'EQUAL'), (1, 'NUMBER'), (';', 'SEMICOLON'),
                         ('for', 'FOR'), (5, 'NUMBER'), ('times', 'TIMES'), ('using', 'USING'), ('var1', 'ID'),
                         ('object', 'OBJECT'), ('(', 'LPAREN'), (2, 'NUMBER'), (',', 'COMMA'), ('dist', 'ID'), ('[', 'LBRACKET'), ('var1', 'ID'), (']', 'RBRACKET'), (',', 'COMMA'), (25, 'NUMBER'), (')', 'RPAREN'), (';', 'SEMICOLON'),
                         ('fend', 'FEND'), (';', 'SEMICOLON'),
                         ('}', 'RBRACE')]

    assert analyzed_tok_list == expected_tok_list
