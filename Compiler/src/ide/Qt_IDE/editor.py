# ------------------------------------------------------------
# File: editor.py
# Developed by: Esteban Alvarado Vargas
# Project: FunSkills-[Compiler]
# version: 2.0
# last edited by: Esteban Alvarado:: 31/10/19 01.30
#
# Description: Text editor that allows syntax highlighting.
#
# TEC 2019 | CE3104 - Lenguajes, Compiladores e Interpretes
# ------------------------------------------------------------

import functools
from PyQt5.QtCore import *
from PyQt5.QtGui import *
from PyQt5.Qsci import *
import src.ide.Qt_IDE.globals as globals
from src.ide.Qt_IDE.lexer import MyLexer

'''================================================================================'''
'''|                                  EDITOR                                      |'''
'''================================================================================'''


class ScintillaEditor(QsciScintilla):

    def __init__(self, text, show_symbol_handle):
        super(ScintillaEditor, self).__init__()
        self.__show_symbol_handle = show_symbol_handle

        # -------------------------------- #
        #     QScintilla editor setup      #
        # -------------------------------- #

        self.setText(text)
        self.setLexer(None)  # We install lexer later
        self.setUtf8(True)  # Set encoding to UTF-8

        # 1. Text wrapping
        # -----------------
        self.setWrapMode(QsciScintilla.WrapWord)
        self.setWrapVisualFlags(QsciScintilla.WrapFlagByText)
        self.setWrapIndentMode(QsciScintilla.WrapIndentIndented)

        # 2. End-of-line mode
        # --------------------
        self.setEolMode(QsciScintilla.EolWindows)
        self.setEolVisibility(False)

        # 3. Indentation
        # ---------------
        self.setIndentationsUseTabs(False)
        self.setTabWidth(4)
        self.setIndentationGuides(True)
        self.setTabIndents(True)
        self.setAutoIndent(True)

        # 4. Caret | Cursor ... this one -> |
        # ---------
        self.setCaretForegroundColor(QColor("#000000"))
        self.setCaretLineVisible(True)
        self.setCaretLineBackgroundColor(QColor("#1f0000ff"))
        self.setCaretWidth(2)

        # 5. Margins
        # -----------
        self.setMarginType(0, QsciScintilla.NumberMargin)
        self.setMarginWidth(0, 35)
        self.setColor(QColor("#293382"))
        self.setMarginsForegroundColor(QColor("#293352"))

        # -------------------------------- #
        #          Install lexer           #
        # -------------------------------- #
        self.__lexer = MyLexer(self)
        self.setLexer(self.__lexer)

        # -------------------------------- #
        #  Connect function to indicators  #
        # -------------------------------- #
        self.indicatorClicked.connect(self.indicator_clicked)


        print(self.text())

    def indicator_clicked(self, line, index, keys):
        print('cambio')
        QTimer.singleShot(100, functools.partial(
            self.indicator_clicked_delayed, line, index, keys))

    ''''''

    def indicator_clicked_delayed(self, line, index, keys):

        pos = self.positionFromLineIndex(line, index)
        start = self.SendScintilla(QsciScintilla.SCI_INDICATORSTART, 0, pos)
        end = self.SendScintilla(QsciScintilla.SCI_INDICATOREND, 0, pos)
        text = self.text()[start:end]
        print("indicator '{}' clicked in line '{}', index '{}'".format(text, line, index))

        relPath, line = self.__lexer.parser.where_to_jump(text)
        linefocus = int(line) - 1
        print("jump to file: " + relPath)
        relPath = globals.projectFolderPath + '\\' + relPath
        self.__show_symbol_handle(relPath, linefocus=linefocus, colfocus=0)

    ''''''


'''=== end class ==='''