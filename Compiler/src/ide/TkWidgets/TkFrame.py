# ------------------------------------------------------------
# File: TkFrame.py
# Developed by: Erick Barrantes
# Project: FunSkills-[Compiler]
# version: 1.0
# last edited by: Erick Barrantes:: 13/10/19 22.24
#
# Description: Wrapper class for Tkinter frame widget.
#
# TEC 2019 | CE3104 - Lenguajes, Compiladores e Interpretes
# ------------------------------------------------------------

from tkinter import Frame


class TkFrame:

    # TkFrame constructor. Configures the tkinter window to its initial status.
    def __init__(self, master, width, height, x_pos, y_pos, background):
        self.frame = Frame(master, width = width, height = height, bg = background)
        self.frame.place(x = x_pos, y = y_pos)
