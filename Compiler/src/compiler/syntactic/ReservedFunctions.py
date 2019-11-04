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


def p_reservedFunction_balloon1(p):
    'reservedFunction : BALLOON idArgs SEMICOLON'
    functionNode = TreeNode("function")
    functionNode.add_children([p[1], p[2]])
    p[0] = functionNode


def p_reservedFunction_balloon2(p):
    'reservedFunction : BALLOON intArgs SEMICOLON'
    functionNode = TreeNode("function")
    functionNode.add_children([p[1], p[2]])
    p[0] = functionNode


def p_reservedFunction_inc(p):
    'reservedFunction : INC intArgs SEMICOLON'
    functionNode = TreeNode("function")
    functionNode.add_children([p[1], p[2]])
    p[0] = functionNode


def p_reservedFunction_dec(p):
    'reservedFunction : DEC intArgs SEMICOLON'
    functionNode = TreeNode("function")
    functionNode.add_children([p[1], p[2]])
    p[0] = functionNode


def p_reservedFunction_telaarana(p):
    'reservedFunction : TELAARANA intArgs SEMICOLON'
    functionNode = TreeNode("function")
    functionNode.add_children([p[1], p[2]])
    p[0] = functionNode


def p_intArgs(p):
    '''intArgs : LPAREN expression COMMA expression RPAREN'''
    argsNode = TreeNode("args")
    argsNode.add_children([p[2], p[4]])
    p[0] = argsNode


def p_idArgs(p):
    '''idArgs : LPAREN ID COMMA ID RPAREN'''
    argsNode = TreeNode("args")
    id1Node = TreeNode(p[2])
    id1Node.add_child(variables[p[2]][-1])
    id2Node = TreeNode(p[4])
    id2Node.add_child(variables[p[4]][-1])
    argsNode.add_children([id1Node, id2Node])
    p[0] = argsNode


def p_reservedFunction_assignword(p):
    'reservedFunction : ASSIGNWORD assignWordArgs SEMICOLON'
    functionNode = TreeNode("function")
    functionNode.add_children([p[1], p[2]])
    p[0] = functionNode


def p_assignWordArgs(p):
    '''assignWordArgs : LPAREN STRING COMMA expression RPAREN'''
    # Validar que primer parametro sea Texto y segundo sea entero.
    functionNode = TreeNode("function")
    functionNode.add_children([p[2], p[4]])
    p[0] = functionNode


def p_reservedFunction_random(p):
    'reservedFunction : RANDOM randomArgs SEMICOLON'
    functionNode = TreeNode("function")
    functionNode.add_children([p[1], p[2]])
    p[0] = functionNode


def p_randomArgs(p):
    '''randomArgs : LPAREN STRING COMMA expression COMMA expression RPAREN'''
    # Validar que primer parametro sea Texto y que el segundo y tercero sean enteros.
    argsNode = TreeNode("args")
    argsNode.add_children([p[2], p[4], p[6]])
    p[0] = argsNode


def p_reservedFunction_object(p):
    'reservedFunction : OBJECT objectArgs SEMICOLON'
    functionNode = TreeNode("function")
    functionNode.add_children([p[1], p[2]])
    p[0] = functionNode


def p_objectArgs(p):
    '''objectArgs : LPAREN expression COMMA expression COMMA expression RPAREN'''
    # Validar que todas las expressions sean enteros.
    argsNode = TreeNode("args")
    argsNode.add_children([p[2], p[4], p[6]])
    p[0] = argsNode