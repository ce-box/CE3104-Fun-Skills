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

projectFolderPath = '/home/esteban/Documentos/TEC/2S 2019/Lenguajes-Compiladores-Intérpretes/2. Compiladores/2. Proyecto/CE3104-Fun-Skills/Compiler/'
projectMainFile = os.path.join(projectFolderPath, 'src/FunSkills Projects/sketch001.fsk')
projectCurrentFile = projectMainFile
projectTempFile = os.path.join(projectFolderPath, 'src/tmp_file/tmp.fsk')

#--------------------------
# NOTE: *.fsk will be the
# fun skills command pro-
# gram files extensions
# -------------------------