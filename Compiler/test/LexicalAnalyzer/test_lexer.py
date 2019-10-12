# ------------------------------------------------------------
# File: test_lexer.py
# Developed by: Errick Barrantes
# Project: FunSkills-Compiler
# version: 1.2
#
# Description: Test functions fot Lexer.py
#
# TEC 2019 | CE3104 - Lenguajes, Compiladores e Interpretes
# ------------------------------------------------------------

import src.LexicalAnalizer.Lexer as Lexer

# -------------------------------------------------
#                       TESTS
# -------------------------------------------------


def test_lexer_game1():
    data = """
    Game1{
        Int alt = 2;
        int lat = 4;

        Balloon (alt, lat);
        Balloon (2,4);
        int cantidad=5;

        Dow (cantidad)
            Balloon (alt,lat);
            Inc (alt, 1);
            Dec (lat, 2);
        Enddo;
    }
    """

    analyzed_tok_list = Lexer.analyzeData(data)
    expected_tok_list = [('Game1', 'GAME'), ('{', 'LBRACE'),
                         ('Int', 'INT'), ('alt', 'ID'), ('=', 'EQUAL'), (2, 'NUMBER'), (';', 'SEMICOLON'),
                         ('int', 'INT'), ('lat', 'ID'), ('=', 'EQUAL'), (4, 'NUMBER'), (';', 'SEMICOLON'),
                         ('Balloon', 'BALLOON'), ('(', 'LPAREN'), ('alt', 'ID'), (',', 'COMMA'), ('lat', 'ID'), (')', 'RPAREN'), (';', 'SEMICOLON'),
                         ('Balloon', 'BALLOON'), ('(', 'LPAREN'), (2, 'NUMBER'), (',', 'COMMA'), (4, 'NUMBER'), (')', 'RPAREN'), (';', 'SEMICOLON'),
                         ('int', 'INT'), ('cantidad', 'ID'), ('=', 'EQUAL'), (5, 'NUMBER'), (';', 'SEMICOLON'),
                         ('Dow', 'DOW'), ('(', 'LPAREN'), ('cantidad', 'ID'), (')', 'RPAREN'),
                         ('Balloon', 'BALLOON'), ('(', 'LPAREN'), ('alt', 'ID'), (',', 'COMMA'), ('lat', 'ID'), (')', 'RPAREN'), (';', 'SEMICOLON'),
                         ('Inc', 'ID'), ('(', 'LPAREN'), ('alt', 'ID'),(',', 'COMMA'), (1, 'NUMBER'), (')', 'RPAREN'), (';', 'SEMICOLON'),
                         ('Dec', 'ID'), ('(', 'LPAREN'), ('lat', 'ID'), (',', 'COMMA'), (2, 'NUMBER'), (')', 'RPAREN'), (';', 'SEMICOLON'),
                         ('Enddo', 'ENDDO'), (';', 'SEMICOLON'),
                         ('}', 'RBRACE')]

    assert analyzed_tok_list == expected_tok_list


def test_lexer_game2():
    data = """
    GAME2{
        texto(10)  Color[10];
        int puntaje[10];
        Color[1] = "Azul";
        puntaje[1] = 10;

        int tiempo = 60;
        int cant = 3;

        FOR 5 times using Color
            Random(Color, Cantidad, tiempo);
            Inc(cant, 3);
            Dec(tiempo, 10);
        FOREND;
    }
    """

    analyzed_tok_list = Lexer.analyzeData(data)
    print(analyzed_tok_list)
    expected_tok_list = [('GAME2', 'GAME'), ('{', 'LBRACE'),
                         ('texto', 'TEXTO'), ('(', 'LPAREN'), (10, 'NUMBER'), (')', 'RPAREN'), ('Color', 'ID'), ('[', 'LBRACKET'), (10, 'NUMBER'), (']', 'RBRACKET'), (';', 'SEMICOLON'),
                         ('int', 'INT'), ('puntaje', 'ID'), ('[', 'LBRACKET'), (10, 'NUMBER'), (']', 'RBRACKET'), (';', 'SEMICOLON'),
                         ('Color', 'ID'), ('[', 'LBRACKET'), (1, 'NUMBER'), (']', 'RBRACKET'), ('=', 'EQUAL'), ('"', 'QUOTE'), ('Azul', 'ID'), ('"', 'QUOTE'), (';', 'SEMICOLON'),
                         ('puntaje', 'ID'), ('[', 'LBRACKET'), (1, 'NUMBER'), (']', 'RBRACKET'), ('=', 'EQUAL'), (10, 'NUMBER'), (';', 'SEMICOLON'),
                         ('int', 'INT'), ('tiempo', 'ID'), ('=', 'EQUAL'), (60, 'NUMBER'), (';', 'SEMICOLON'),
                         ('int', 'INT'), ('cant', 'ID'), ('=', 'EQUAL'), (3, 'NUMBER'), (';', 'SEMICOLON'),
                         ('FOR', 'FOR'), (5, 'NUMBER'), ('times', 'TIMES'), ('using', 'USING'), ('Color', 'ID'),
                         ('Random', 'RANDOM'), ('(', 'LPAREN'), ('Color', 'ID'), (',', 'COMMA'), ('Cantidad', 'ID'), (',', 'COMMA'), ('tiempo', 'ID'), (')', 'RPAREN'), (';', 'SEMICOLON'),
                         ('Inc', 'ID'), ('(', 'LPAREN'), ('cant', 'ID'), (',', 'COMMA'), (3, 'NUMBER'), (')', 'RPAREN'), (';', 'SEMICOLON'),
                         ('Dec', 'ID'), ('(', 'LPAREN'), ('tiempo', 'ID'), (',', 'COMMA'), (10, 'NUMBER'), (')', 'RPAREN'), (';', 'SEMICOLON'),
                         ('FOREND', 'FOREND'), (';', 'SEMICOLON'),
                         ('}', 'RBRACE')]

    assert analyzed_tok_list == expected_tok_list


def test_lexer_game3():
    data = """
    game3{
        int MiFila = 5;
        int MiCol  = 5;
        
        Texto(10) MiArr[25];
        MiArr[1] = "Azul";
        MiArr[2] = "Rojo";
        
        int MiPuntaje[25];
        MiPuntaje[1] = 10;
        MiPuntaje[2] = 15;
        
        TelaArana(MiFila, MiCol);
        ForAsignWord(MiFila, MiCol) DO
            AsignWord(MiArr, MiPuntaje);
    }
    """

    analyzed_tok_list = Lexer.analyzeData(data)
    print(analyzed_tok_list)
    expected_tok_list = [('game3', 'GAME'), ('{', 'LBRACE'),
                         ('int', 'INT'), ('MiFila', 'ID'), ('=', 'EQUAL'), (5, 'NUMBER'), (';', 'SEMICOLON'),
                         ('int', 'INT'), ('MiCol', 'ID'), ('=', 'EQUAL'), (5, 'NUMBER'), (';', 'SEMICOLON'),
                         ('Texto', 'TEXTO'), ('(', 'LPAREN'), (10, 'NUMBER'), (')', 'RPAREN'), ('MiArr', 'ID'), ('[', 'LBRACKET'), (25, 'NUMBER'), (']', 'RBRACKET'), (';', 'SEMICOLON'),
                         ('MiArr', 'ID'), ('[', 'LBRACKET'), (1, 'NUMBER'), (']', 'RBRACKET'), ('=', 'EQUAL'), ('"', 'QUOTE'), ('Azul', 'ID'), ('"', 'QUOTE'), (';', 'SEMICOLON'),
                         ('MiArr', 'ID'), ('[', 'LBRACKET'), (2, 'NUMBER'), (']', 'RBRACKET'), ('=', 'EQUAL'), ('"', 'QUOTE'), ('Rojo', 'ID'), ('"', 'QUOTE'), (';', 'SEMICOLON'),
                         ('int', 'INT'), ('MiPuntaje', 'ID'), ('[', 'LBRACKET'), (25, 'NUMBER'), (']', 'RBRACKET'), (';', 'SEMICOLON'),
                         ('MiPuntaje', 'ID'), ('[', 'LBRACKET'), (1, 'NUMBER'), (']', 'RBRACKET'), ('=', 'EQUAL'), (10, 'NUMBER'), (';', 'SEMICOLON'),
                         ('MiPuntaje', 'ID'), ('[', 'LBRACKET'), (2, 'NUMBER'), (']', 'RBRACKET'), ('=', 'EQUAL'), (15, 'NUMBER'), (';', 'SEMICOLON'),
                         ('TelaArana', 'TELAARANA'), ('(', 'LPAREN'), ('MiFila', 'ID'), (',', 'COMMA'), ('MiCol', 'ID'), (')', 'RPAREN'), (';', 'SEMICOLON'),
                         ('ForAsignWord', 'FORASIGNWORD'), ('(', 'LPAREN'), ('MiFila', 'ID'), (',', 'COMMA'), ('MiCol', 'ID'), (')', 'RPAREN'), ('DO', 'DO'),
                         ('AsignWord', 'ASIGNWORD'), ('(', 'LPAREN'), ('MiArr', 'ID'), (',', 'COMMA'), ('MiPuntaje', 'ID'), (')', 'RPAREN'), (';', 'SEMICOLON'),
                         ('}', 'RBRACE')]

    assert analyzed_tok_list == expected_tok_list


def test_lexer_game4():
    data = """
    Game4{
        int Dist[5];
        Dist[1] = 2;
        Dist[2] = 5;
        Dist[3] = 1;
        Dist[4] = 7;
        Dist[5] = 1;
        FOR  5  Times using Var1
            Object(2, Dist[Var1], 25);
        FEnd;
    }
    """

    analyzed_tok_list = Lexer.analyzeData(data)
    expected_tok_list = [('Game4', 'GAME'), ('{', 'LBRACE'),
                         ('int', 'INT'), ('Dist', 'ID'), ('[', 'LBRACKET'), (5, 'NUMBER'), (']', 'RBRACKET'), (';', 'SEMICOLON'),
                         ('Dist', 'ID'), ('[', 'LBRACKET'), (1, 'NUMBER'), (']', 'RBRACKET'), ('=', 'EQUAL'), (2, 'NUMBER'), (';', 'SEMICOLON'),
                         ('Dist', 'ID'), ('[', 'LBRACKET'), (2, 'NUMBER'), (']', 'RBRACKET'), ('=', 'EQUAL'), (5, 'NUMBER'), (';', 'SEMICOLON'),
                         ('Dist', 'ID'), ('[', 'LBRACKET'), (3, 'NUMBER'), (']', 'RBRACKET'), ('=', 'EQUAL'), (1, 'NUMBER'), (';', 'SEMICOLON'),
                         ('Dist', 'ID'), ('[', 'LBRACKET'), (4, 'NUMBER'), (']', 'RBRACKET'), ('=', 'EQUAL'), (7, 'NUMBER'), (';', 'SEMICOLON'),
                         ('Dist', 'ID'), ('[', 'LBRACKET'), (5, 'NUMBER'), (']', 'RBRACKET'), ('=', 'EQUAL'), (1, 'NUMBER'), (';', 'SEMICOLON'),
                         ('FOR', 'FOR'), (5, 'NUMBER'), ('Times', 'TIMES'), ('using', 'USING'), ('Var1', 'ID'),
                         ('Object', 'OBJECT'), ('(', 'LPAREN'), (2, 'NUMBER'), (',', 'COMMA'), ('Dist', 'ID'), ('[', 'LBRACKET'), ('Var1', 'ID'), (']', 'RBRACKET'), (',', 'COMMA'), (25, 'NUMBER'), (')', 'RPAREN'), (';', 'SEMICOLON'),
                         ('FEnd', 'FEND'), (';', 'SEMICOLON'),
                         ('}', 'RBRACE')]

    assert analyzed_tok_list == expected_tok_list
