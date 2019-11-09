# ------------------------------------------------------------
# File: ReservedFuncitions.py
# Developed by: Erick Barrantes, Jessica Espinoza
# Project: FunSkills-Compiler
# version: 1
#
# Last modified 26 /10 /19
# Description: Grammar for reserved functions
#
# TEC 2019 | CE3104 - Lenguajes, Compiladores e Interpretes
# -------------------------------------------------------------

from src.compiler.syntactic.Operations import variables
from src.compiler.datastructures.TreeNode import *


def p_reservedFunction_balloon(p):
    'reservedFunction : BALLOON balloonArgs SEMICOLON'
    functionNode = TreeNode("function")
    functionNode.add_children([p[1], p[2]])
    p[0] = functionNode


def p_balloonArgs(p):
    '''balloonArgs : LPAREN ID COMMA ID RPAREN'''
    argsNode = TreeNode("args")
    id1Node = TreeNode(p[2])
    id1Node.add_child(variables[p[2]][-1])
    id2Node = TreeNode(p[4])
    id2Node.add_child(variables[p[4]][-1])
    argsNode.add_children([id1Node, id2Node])
    p[0] = argsNode


def p_reservedFunction_inc(p):
    'reservedFunction : INC incDecArgs SEMICOLON'
    functionNode = TreeNode("function")
    functionNode.add_children([p[1], p[2]])
    p[0] = functionNode


def p_reservedFunction_dec(p):
    'reservedFunction : DEC incDecArgs SEMICOLON'
    functionNode = TreeNode("function")
    functionNode.add_children([p[1], p[2]])
    p[0] = functionNode


def p_incDecArgs(p):
    '''incDecArgs : LPAREN ID COMMA expression RPAREN'''
    argsNode = TreeNode("args")
    id1Node = TreeNode(p[2])
    id1Node.add_child(variables[p[2]][-1])
    argsNode.add_children([id1Node, p[4]])
    p[0] = argsNode


def p_reservedFunction_random(p):
    'reservedFunction : RANDOM randomObjectArgs SEMICOLON'
    functionNode = TreeNode("function")
    functionNode.add_children([p[1], p[2]])
    p[0] = functionNode


def p_randomObjectArgs(p):
    '''randomObjectArgs : LPAREN ID COMMA ID COMMA ID RPAREN'''
    argsNode = TreeNode("args")
    id1Node = TreeNode(p[2])
    id1Node.add_child(variables[p[2]][-1])
    id2Node = TreeNode(p[4])
    id2Node.add_child(variables[p[4]][-1])
    id3Node = TreeNode(p[6])
    id3Node.add_child(variables[p[6]][-1])
    argsNode.add_children([id1Node, id2Node, id3Node])
    p[0] = argsNode


def p_reservedFunction_telaarana(p):
    'reservedFunction : TELAARANA expression COMMA expression SEMICOLON'
    functionNode = TreeNode("function")
    functionNode.add_children([p[1], p[2], p[4]])
    p[0] = functionNode


def p_reservedFunction_assignword(p):
    'reservedFunction : ASSIGNWORD assignWordArgs SEMICOLON'
    functionNode = TreeNode("function")
    functionNode.add_children([p[1], p[2]])
    p[0] = functionNode


def p_assignWordArgs(p):
    '''assignWordArgs : LPAREN STRING COMMA expression RPAREN'''
    # Validar que primer parametro sea Texto y segundo sea entero.
    argsNode = TreeNode("args")
    id1Node = TreeNode(p[2])
    id1Node.add_child(variables[p[2]][-1])
    id2Node = TreeNode(p[4])
    id2Node.add_child(variables[p[4]][-1])
    argsNode.add_children([id1Node, id2Node])
    p[0] = argsNode


def p_reservedFunction_object(p):
    'reservedFunction : OBJECT randomObjectArgs SEMICOLON'
    functionNode = TreeNode("function")
    functionNode.add_children([p[1], p[2]])
    p[0] = functionNode
