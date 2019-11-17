# ------------------------------------------------------------
# File: Loops.py
# Developed by: Erick Barrantes, Jessica Espinoza
# Project: FunSkills-Compiler
# version: 1
#
# Last modified 26 / 10 /19
# Description: Grammar for loops.
#
# TEC 2019 | CE3104 - Lenguajes, Compiladores e Interpretes
# -------------------------------------------------------------

from src.compiler.datastructures.TreeNode import *
from src.compiler.syntactic.Operations import *


def p_loop_dow(p):
    'loop : DOW LPAREN expression RPAREN statements ENDDO SEMICOLON'
    loopNode = TreeNode("loop")
    loopNode.add_children([p[1], p[3]])
    for child in funcList:
        loopNode.add_child(child)
    p[0] = loopNode
    funcList.clear()


def p_loop_for(p):
    'loop : FOR expression TIMES USING ID statements FOREND SEMICOLON'
    loopNode = TreeNode("loop")
    loopNode.add_children([p[1], p[2], p[5]])
    for child in funcList:
        loopNode.add_child(child)
    p[0] = loopNode
    funcList.clear()


def p_loop_forAssignWord(p):
    'loop : FORASSIGNWORD LPAREN expression COMMA expression RPAREN DO\
            statements FOREND SEMICOLON'

    loopNode = TreeNode("loop")
    loopNode.add_children([p[1], p[3], p[5]])
    for child in funcList:
        loopNode.add_child(child)
    p[0] = loopNode
    funcList.clear()
