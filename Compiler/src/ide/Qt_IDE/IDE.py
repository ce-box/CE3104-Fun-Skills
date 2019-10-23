import sys
from PyQt5.QtWidgets import *
from PyQt5.QtGui import *
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
        self.setWindowTitle("QScintilla Test")

        # 2. Create frame and layout
        # ---------------------------
        self.__frm = QFrame(self)
        self.__frm.setStyleSheet("QWidget { background-color: #ffeaeaea }")
        self.__lyt = QVBoxLayout()
        self.__frm.setLayout(self.__lyt)
        self.setCentralWidget(self.__frm)
        self.__myFont = QFont()
        self.__myFont.setPointSize(14)

        # 3. Place a button
        # ------------------
        self.__btn = QPushButton("Qsci")
        self.__btn.setFixedWidth(50)
        self.__btn.setFixedHeight(50)
        self.__btn.clicked.connect(self.__btn_action)
        self.__btn.setFont(self.__myFont)
        self.__lyt.addWidget(self.__btn)

        # 4. Insert the TabMaster
        # ------------------------
        self.__tabMaster = TabMaster()
        self.__tabMaster.show_file(globals.projectMainFile)
        self.__lyt.addWidget(self.__tabMaster)
        self.show()

    ''''''

    def __btn_action(self):
        print("Hello World")

    ''''''

'''=== end class ==='''




if __name__ == '__main__':
    app = QApplication(sys.argv)
    QApplication.setStyle(QStyleFactory.create('Fusion'))
    myGUI = CustomMainWindow()
    sys.exit(app.exec_())

''''''