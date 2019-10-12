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
    expected_tok_list = [('Game1', 'GAME'), ('{', 'LBRACE'), ('Int', 'INT'), ('alt', 'ID'), ('=', 'EQUAL'),
                         (2, 'NUMBER'), (';', 'SEMICOLON'), ('int', 'INT'), ('lat', 'ID'), ('=', 'EQUAL'),
                         (4, 'NUMBER'), (';', 'SEMICOLON'), ('Balloon', 'BALLOON'), ('(', 'LPAREN'), ('alt', 'ID'),
                         (',', 'COMMA'), ('lat', 'ID'), (')', 'RPAREN'), (';', 'SEMICOLON'), ('Balloon', 'BALLOON'),
                         ('(', 'LPAREN'), (2, 'NUMBER'), (',', 'COMMA'), (4, 'NUMBER'), (')', 'RPAREN'),
                         (';', 'SEMICOLON'), ('int', 'INT'), ('cantidad', 'ID'), ('=', 'EQUAL'), (5, 'NUMBER'),
                         (';', 'SEMICOLON'), ('Dow', 'DOW'), ('(', 'LPAREN'), ('cantidad', 'ID'), (')', 'RPAREN'),
                         ('Balloon', 'BALLOON'), ('(', 'LPAREN'), ('alt', 'ID'), (',', 'COMMA'), ('lat', 'ID'),
                         (')', 'RPAREN'), (';', 'SEMICOLON'), ('Inc', 'ID'), ('(', 'LPAREN'), ('alt', 'ID'),
                         (',', 'COMMA'), (1, 'NUMBER'), (')', 'RPAREN'), (';', 'SEMICOLON'), ('Dec', 'ID'),
                         ('(', 'LPAREN'), ('lat', 'ID'), (',', 'COMMA'), (2, 'NUMBER'), (')', 'RPAREN'),
                         (';', 'SEMICOLON'), ('Enddo', 'ENDDO'), (';', 'SEMICOLON'), ('}', 'RBRACE')]

    assert analyzed_tok_list == expected_tok_list