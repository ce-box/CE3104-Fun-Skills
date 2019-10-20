# ------------------------------------------------------------
# File: Loops.py
# Developed by: Erick Barrantes, Jessica Espinoza
# Project: FunSkills-Compiler
# version: 1
#
# Last modified 20 / 10 /19
# Description: Grammar for loops.
#
# TEC 2019 | CE3104 - Lenguajes, Compiladores e Interpretes
# -------------------------------------------------------------


from Compiler.src.syntactic.Statements import *


def p_loop_dow(p):
    'loop : DOW args statements ENDDO SEMICOLON'


def p_loop_for(p):
    'loop : FOR atom TIMES USING ID statements FOREND SEMICOLON'


def p_loop_forAssignWord(p):
    'loop : FORASSIGNWORD args DO\
            ASSIGNWORD args SEMICOLON'