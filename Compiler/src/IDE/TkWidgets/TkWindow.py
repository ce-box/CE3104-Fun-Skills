# ------------------------------------------------------------
# File: TkWindow.py
# Developed by: Erick Barrantes
# Project: FunSkills-[Compiler]
# version: 1.0
# last edited by: Erick Barrantes:: 13/10/19 22.24
#
# Description: Wrapper class for Tkinter window widget.
#
# TEC 2019 | CE3104 - Lenguajes, Compiladores e Interpretes
# ------------------------------------------------------------


from tkinter import Tk, Menu


class TkWindow:

    # TkWindow constructor. Configures the tkinter window to its initial status.
    def __init__(self, width, height, title):
        self.window = Tk()
        self.window.title(title)
        self.window.config(width=width, height=height)
        self.window.resizable(False, False)
        self.menu_bar = None

    # Configures the menu bar of the window.
    # cascade_list: List with strings that has the name of each drop down label in the menu bar.
    # labels: List with strings that has the label of each option in the drop down sub menu.
    # commands: List with strings to be evaluated that has the name of the command for each
    #           option in the drop down sub menu.
    def set_menu_bar(self, cascade_list, labels, commands):
        self.menu_bar = Menu(self.window)
        self.window.config(menu=self.menu_bar)
        file_menu = Menu(self.menu_bar)

        for cascade, label_list, command_list in zip(cascade_list, labels, commands):
            self.menu_bar.add_cascade(label=cascade, menu=file_menu)
            for label, command in zip(label_list, command_list):
                file_menu.add_command(label=label, command=eval("self." + command))

    # onExit command: Closes the window when activated.
    def onExit(self):
        self.window.quit()
