# ------------------------------------------------------------
# File: globals.py
# Developed by: Esteban Alvarado
# Project: FunSkills-[Compiler]
# version: 1.0
# last edited by: Esteban Alvarado:: 31/10/19 00.10
#
# Description: This little file contains two global variables:
#              projectFolderPath and projectMainFile. These
#              variables point to your project.
#              Fill these variables in according to your needs!
#
# TEC 2019 | CE3104 - Lenguajes, Compiladores e Interpretes
# ------------------------------------------------------------

import os

file_dir = os.path.dirname(os.path.abspath(__file__))
directory_path = os.path.dirname(file_dir)
projectFolderPath = os.path.dirname(directory_path)

projectMainFile = os.path.join(projectFolderPath, 'FunSkills Projects/sketch001.fsk')
projectCurrentFile = projectMainFile
projectTempFile = os.path.join(projectFolderPath, 'src/tmp_file/tmp.fsk')

#--------------------------
# NOTE: *.fsk is the
# fun skills command pro-
# gram files extensions
# -------------------------