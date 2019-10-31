# ------------------------------------------------------------
# File: IDE.py
# Developed by: Esteban Alvarado Vargas
# Project: FunSkills-[Compiler]
# version: 3.0
# last edited by: Esteban Alvarado:: 24/10/19 17.30
#
# Description: Contains the functions that creates and puts
#              together all the necessary widgets and commands
#              for the compiler IDE.
#
# TEC 2019 | CE3104 - Lenguajes, Compiladores e Interpretes
# ------------------------------------------------------------

import sys
from PyQt5.QtWidgets import *
from PyQt5.QtGui import *
from PyQt5.QtCore import *
from src.ide.Qt_IDE.editor import ScintillaEditor
import ntpath
import src.ide.Qt_IDE.globals as globals

'''================================================================================'''
'''|                                TABMASTER                                     |'''
'''================================================================================'''
class TabMaster(QTabWidget):

    def __init__(self):
        super(TabMaster, self).__init__()

    ''''''

    def showFile(self, filepath):
        f = open(filepath, "r")
        text = f.read()
        f.close()

        newtab = ScintillaEditor(text, self.showSymbol)
        newtabName = ntpath.basename(filepath)

        self.addTab(newtab, newtabName)
        self.setCurrentWidget(newtab)

        self.setStyleSheet("QWidget { background-color: #caebea ; color: #000000; font: bold}")

        newtab.setCursorPosition(0, 0)
        newtab.ensureCursorVisible()
        newtab.setFocus()

    ''''''


    def showSymbol(self, filepath, linefocus = 0, colfocus = 0):
        for i in range(self.count()):
            tabname = str(self.tabText(i))
            if tabname == ntpath.basename(filepath):
                # Tab already exists
                self.setCurrentIndex(i)
                self.widget(i).setCursorPosition(linefocus, colfocus)
                self.widget(i).ensureCursorVisible()
                self.widget(i).setFocus()
                return
            ###
        ###

        # Make new tab
        f = open(filepath, "r")
        text = f.read()
        f.close()

        newtab = ScintillaEditor(text, self.showSymbol)
        newtabName = ntpath.basename(filepath)

        self.addTab(newtab, newtabName)
        self.setCurrentWidget(newtab)

        newtab.setCursorPosition(linefocus, colfocus)
        newtab.ensureCursorVisible()
        newtab.setFocus()


        ###

    ''''''

'''=== end class ==='''

'''================================================================================'''
'''|                           CUSTOM MAIN WINDOW                                 |'''
'''================================================================================'''
class CustomMainWindow(QMainWindow):

    def __init__(self):
        super(CustomMainWindow, self).__init__()

        self.__text_code = ""

        # -------------------------------- #
        #           Window setup           #
        # -------------------------------- #

        # 1. Define the geometry of the main window
        # ------------------------------------------
        self.setGeometry(100, 100, 800, 800)
        self.setWindowTitle("FunSkills - Playground")

        # 2. Create frame and layout
        # ---------------------------
        self.__frm = QFrame(self)
        self.__frm.setStyleSheet("QWidget { background-color: #03152e }")
        self.__lyt = QGridLayout()
        self.__btn_lyt = QHBoxLayout()

        self.__frm.setLayout(self.__lyt)
        self.setCentralWidget(self.__frm)
        self.__myFont = QFont()
        self.__myFont.setPointSize(14)

        # 3. Place run button
        # ------------------
        self.__run_btn = QPushButton("")
        self.__run_btn.setIcon(QIcon("/home/esteban/Documentos/TEC/2S 2019/Lenguajes-Compiladores-Intérpretes/2. Compiladores/2. Proyecto/CE3104-Fun-Skills/Compiler/src/img/play_btn.png"))
        self.__run_btn.setIconSize(QSize(50,50))
        self.__run_btn.setFixedWidth(50)
        self.__run_btn.setFixedHeight(50)
        self.__run_btn.clicked.connect(self.__run_btn_action)
        self.__run_btn.setFont(self.__myFont)
        self.__run_btn.setStyleSheet("QWidget { background: #03152e}")
        self.__btn_lyt.addWidget(self.__run_btn,alignment=Qt.AlignLeft)

        # 4. Place open file button
        # ------------------
        self.__open_btn = QPushButton("")
        self.__open_btn.setIcon(QIcon("/home/esteban/Documentos/TEC/2S 2019/Lenguajes-Compiladores-Intérpretes/2. Compiladores/2. Proyecto/CE3104-Fun-Skills/Compiler/src/img/Open_btn.png"))
        self.__open_btn.setIconSize(QSize(50, 50))
        self.__open_btn.setFixedWidth(50)
        self.__open_btn.setFixedHeight(50)
        self.__open_btn.clicked.connect(self.__open_btn_action)
        self.__open_btn.setFont(self.__myFont)
        self.__open_btn.setStyleSheet("QWidget { background-color: #03152e }")
        self.__btn_lyt.addWidget(self.__open_btn,alignment=Qt.AlignLeft)

        # Add an empty space to fill Layout spaces between open and run buttons and save button
        self.__btn_lyt.addStretch(20)

        # 5. Place save file button
        # ------------------
        self.__save_btn = QPushButton("")
        self.__save_btn.setIcon(QIcon("/home/esteban/Documentos/TEC/2S 2019/Lenguajes-Compiladores-Intérpretes/2. Compiladores/2. Proyecto/CE3104-Fun-Skills/Compiler/src/img/save_btn.png"))
        self.__save_btn.setIconSize(QSize(50,50))
        self.__save_btn.setFixedWidth(50)
        self.__save_btn.setFixedHeight(50)
        self.__save_btn.clicked.connect(self.__save_btn_action)
        self.__save_btn.setFont(self.__myFont)
        self.__save_btn.setStyleSheet("QWidget { background-color: #03152e }")
        self.__btn_lyt.addWidget(self.__save_btn,alignment=Qt.AlignLeft)

        self.__lyt.addLayout(self.__btn_lyt,0,0)
        self.__btn_lyt.addStretch(1) # Add an empty space to fill Layout spaces

        # 6. Insert the TabMaster
        # ------------------------
        self.__tabMaster = TabMaster()
        self.__tabMaster.showFile(globals.projectCurrentFile)
        self.__lyt.addWidget(self.__tabMaster,1,0)
        self.show()

        #7. Insert message Text Box
        # -------------------------
        self.__textbox = QLineEdit()
        self.__textbox.setStyleSheet("QWidget { background-color: #000000; color: #bd4f00}") # Black Bg
        self.__textbox.setText("Welcome to FunSkills Playground!")
        self.__lyt.addWidget(self.__textbox,3,0)

        # 7. Insert message Text Box
        # -------------------------
        self.__ = QLineEdit()
        self.__textbox.setStyleSheet("QWidget { background-color: #000000; color: #bd4f00}")  # Black Bg
        self.__textbox.setText("Welcome to FunSkills Playground!")
        self.__lyt.addWidget(self.__textbox, 3, 0)




    ''''''

    def __run_btn_action(self):
        print("Run File")
        f = open(globals.projectTempFile, "r")
        text = f.read()
        f.close()
        print('run: ',text)

    def __open_btn_action(self):
        print("Open File")
        self.getfileWindow()


    def __save_btn_action(self):
        print("Save File")

        buttonReply = QMessageBox.question(self, 'Save File', "Are you sure you want to save the changes?",
                                           QMessageBox.Yes | QMessageBox.No, QMessageBox.No)
        if buttonReply == QMessageBox.Yes:


            # If the file is the default then you will access to save it as a new file
            if('sketch.fsk' in globals.projectCurrentFile):
                self.saveFileWindow()
            else:
                self.saveFile()


    def saveFile(self, new = False):


        # First you get the text from the temp file
        f = open(globals.projectTempFile, "r")
        text = f.read()
        f.close()

        action = "w"
        if new:
            action = "w+"
        # Then, save it in the original file
        tf = open(globals.projectCurrentFile, action)
        tf.write(text)
        tf.close()

    '''================================================================================'''
    '''|                           FILE DIALOG WINDOWS                                 |'''
    '''================================================================================'''
    def getfileWindow(self):
        fileName = QFileDialog.getOpenFileName(self, 'Open',
                                            'c:\\', "Code Files (*.fsk *.txt)")
        print("Filename:", fileName[0])

        if(fileName[0] != ''):
            globals.projectCurrentFile = fileName[0]
            self.__tabMaster.removeTab(0)
            self.__tabMaster.showFile(globals.projectCurrentFile)

    def saveFileWindow(self):
        fileName = QFileDialog.getSaveFileName(self, 'Save',
                                            'c:\\', "Code Files (*.fsk *.txt)")
        print("Filename:", fileName[0])
        if (fileName[0] != ''):
            globals.projectCurrentFile = fileName[0]
            self.saveFile(True)
            self.__tabMaster.removeTab(0)
            self.__tabMaster.showFile(globals.projectCurrentFile)





    ''''''

'''=== end class ==='''


if __name__ == '__main__':
    app = QApplication(sys.argv)
    QApplication.setStyle(QStyleFactory.create('Fusion'))
    myGUI = CustomMainWindow()
    sys.exit(app.exec_())

''''''