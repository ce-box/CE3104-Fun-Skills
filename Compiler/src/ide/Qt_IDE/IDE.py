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

    def show_file(self, filepath):
        f = open(filepath, "r")
        text = f.read()
        f.close()

        newtab = ScintillaEditor(text, self.show_symbol)
        newtabName = ntpath.basename(filepath)

        self.addTab(newtab, newtabName)
        self.setCurrentWidget(newtab)

        self.setStyleSheet("QWidget { background-color: #e4e8f7 ; color: #c72cb2}")

        newtab.setCursorPosition(0, 0)
        newtab.ensureCursorVisible()
        newtab.setFocus()

    ''''''

    def show_symbol(self, filepath, linefocus = 0, colfocus = 0):
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

        newtab = ScintillaEditor(text, self.show_symbol)
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

        # -------------------------------- #
        #           Window setup           #
        # -------------------------------- #

        # 1. Define the geometry of the main window
        # ------------------------------------------
        self.setGeometry(100, 100, 1200, 800)
        self.setWindowTitle("FunSkills - Playground")

        # 2. Create frame and layout
        # ---------------------------
        self.__frm = QFrame(self)
        self.__frm.setStyleSheet("QWidget { background-color: #000712 }")
        self.__lyt = QVBoxLayout()
        self.__btn_lyt = QGridLayout()
        self.__frm.setLayout(self.__lyt)
        self.setCentralWidget(self.__frm)
        self.__myFont = QFont()
        self.__myFont.setPointSize(14)

        # 3. Place run button
        # ------------------
        self.__run_btn = QPushButton("RUN")
        self.__run_btn.setFixedWidth(50)
        self.__run_btn.setFixedHeight(50)
        self.__run_btn.clicked.connect(self.__run_btn_action)
        self.__run_btn.setFont(self.__myFont)
        self.__run_btn.setStyleSheet("QWidget { background-color: #b4b8bf }")
        self.__btn_lyt.addWidget(self.__run_btn,0,0,1,1,alignment=Qt.AlignLeft)

        # 4. Place open file button
        # ------------------
        self.__open_btn = QPushButton("OPEN")
        self.__open_btn.setFixedWidth(50)
        self.__open_btn.setFixedHeight(50)
        self.__open_btn.clicked.connect(self.__open_btn_action)
        self.__open_btn.setFont(self.__myFont)
        self.__open_btn.setStyleSheet("QWidget { background-color: #b4b8bf }")
        self.__btn_lyt.addWidget(self.__open_btn,0,1,1,1,alignment=Qt.AlignLeft)

        # 5. Place save file button
        # ------------------
        self.__save_btn = QPushButton("SAVE")
        self.__save_btn.setFixedWidth(50)
        self.__save_btn.setFixedHeight(50)
        self.__save_btn.clicked.connect(self.__save_btn_action)
        self.__save_btn.setFont(self.__myFont)
        self.__save_btn.setStyleSheet("QWidget { background-color: #b4b8bf }")
        self.__btn_lyt.addWidget(self.__save_btn,0,2,1,1,alignment=Qt.AlignLeft)

        self.__lyt.addLayout(self.__btn_lyt)



        # 6. Insert the TabMaster
        # ------------------------
        self.__tabMaster = TabMaster()
        self.__tabMaster.show_file(globals.projectMainFile)
        self.__lyt.addWidget(self.__tabMaster)
        self.show()

    ''''''

    def __run_btn_action(self):
        print("Run File")

    def __open_btn_action(self):
        print("Open File")

    def __save_btn_action(self):
        print("Save File")
    ''''''

'''=== end class ==='''




if __name__ == '__main__':
    app = QApplication(sys.argv)
    QApplication.setStyle(QStyleFactory.create('Fusion'))
    myGUI = CustomMainWindow()
    sys.exit(app.exec_())

''''''