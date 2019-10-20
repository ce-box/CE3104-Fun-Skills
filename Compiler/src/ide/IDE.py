# ------------------------------------------------------------
# File: ide.py
# Developed by: Erick Barrantes
# Project: FunSkills-[Compiler]
# version: 1.0
# last edited by: Erick Barrantes:: 13/10/19 22.24
#
# Description: Contains the functions that creates and puts
#              together all the necessary widgets and commands
#              for the compiler ide.
#
# TEC 2019 | CE3104 - Lenguajes, Compiladores e Interpretes
# ------------------------------------------------------------

from tkinter import DISABLED, END, Button
from Compiler.src.ide.tkwidgets.TkWindow import *
from Compiler.src.ide.tkwidgets.TkFrame import *
from Compiler.src.ide.tkwidgets.TkTextScroll import *
from Compiler.src.lexer.Lexer import analyzeData


def display_IDE_window():
    root = create_main_window()

    main_frame = TkFrame(root.window, 1100, 650, 0, 0, "#495153")

    source_code_text = TkTextScroll(main_frame.frame, 400, 1000, 50, 50, True)
    app_output_text = TkTextScroll(main_frame.frame, 150, 1000, 50, 470, False)
    app_output_text.scroll_text.config(state = DISABLED)

    run_button = Button(main_frame.frame, text = "Run",
                        command = lambda source_code=source_code_text: compile_source_code(source_code))
    run_button.place(x = 0, y = 0)

    root.window.mainloop()


def create_main_window():
    root = TkWindow(1100, 650, "Compilador sin nombre")
    root.set_menu_bar(['File'], [['Open File', 'Save File', 'Exit']], [['onExit', 'onExit', 'onExit']])
    return root


def compile_source_code(source_code_text):
    data = source_code_text.scroll_text.get("1.0", END)
    lexical_analysis = analyzeData(data)
    print(lexical_analysis)