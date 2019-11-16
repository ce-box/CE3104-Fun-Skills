# ------------------------------------------------------------
# File: launcher.py
# Developed by: Esteban Alvarado Vargas
# Project: FunSkills-[Compiler]
# version: 3.0
# last edited by: Esteban Alvarado:: 1/11/19 03.30
#
# Description: Initial window with an animation of loading
#              progress, is the previous one of the program in
#              the style of the editors of jetbrains.
#
# TEC 2019 | CE3104 - Lenguajes, Compiladores e Interpretes
# ------------------------------------------------------------

import sys
import PyQt5.QtCore as QCore
import PyQt5.QtGui as QGui
import PyQt5.QtWidgets as QWgt
import time
import threading
import src.ide.IDE as ide
import src.ide.globals as globals

# Path variables
directory_path = globals.projectFolderPath
img_path = directory_path + "/img/intro.png"

TIME_LIMIT = 100
BAR_STYLE = """QProgressBar{
    border: 0px;
    text-align: center;
    background:transparent
}

QProgressBar::chunk{
    background: #ffffff
}"""

# Init window class
class launcher_window(QWgt.QWidget):

    # Constructor
    def __init__(self, parent=None):
        super().__init__(parent)
        self.width = 640
        self.height = 480
        self.left = 400
        self.top = 300

        self.setWindowFlags(QCore.Qt.FramelessWindowHint)
        self.setGeometry(self.left, self.top, self.width, self.height)

        # Create widget
        label = QWgt.QLabel(self)
        pixmap = QGui.QPixmap(img_path)
        label.setPixmap(pixmap)
        self.resize(pixmap.width(), pixmap.height())

        # Create Progress Bar
        self.progress = QWgt.QProgressBar(self)
        self.progress.setGeometry(140, 210, 200, 5)
        self.progress.setMaximum(100)
        self.progress.setTextVisible(False)
        self.progress.setStyleSheet(BAR_STYLE)


# @brief - progress counter of the progress bar, runs in a separate thread
def count(app,window):
    count = 0
    while count < TIME_LIMIT:
        count += 1
        time.sleep(0.1)
        window.progress.setValue(count)
    time.sleep(1)
    app.quit()

# @brief - main function that runs the animation and launches
#          the code editor
def init_IDE():
    app = QWgt.QApplication(sys.argv)
    window = launcher_window()
    window.show()

    x = threading.Thread(target=count,args=(app,window,))
    x.start()
    app.exec_()


if __name__ == '__main__':
    init_IDE()
    ide.run_IDE()
