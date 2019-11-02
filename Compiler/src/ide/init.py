import sys
from PyQt5.QtCore import *
from PyQt5.QtGui import *
from PyQt5.QtWidgets import *
import time
import threading
import src.ide.IDE as ide

TIME_LIMIT = 100
BAR_STYLE = """QProgressBar{
    border: 0px;
    text-align: center;
    background:transparent
}

QProgressBar::chunk{
    background: #ffffff
}"""


directory_path = "/home/esteban/Documentos/TEC/2S 2019/Lenguajes-Compiladores-Intérpretes/2. Compiladores/2. Proyecto/CE3104-Fun-Skills/Compiler/"
img_path = directory_path + "src/img/intro.png"

class init_window(QWidget):

    def __init__(self, parent=None):
        super().__init__(parent)
        self.width = 640
        self.height = 480
        self.left = 400
        self.top = 300

        self.setWindowFlags(Qt.FramelessWindowHint)
        self.setGeometry(self.left, self.top, self.width, self.height)

        # Create widget
        label = QLabel(self)
        pixmap = QPixmap(img_path)
        label.setPixmap(pixmap)
        self.resize(pixmap.width(), pixmap.height())

        # Create Progress Bar
        self.progress = QProgressBar(self)
        self.progress.setGeometry(140, 210, 200, 5)
        self.progress.setMaximum(100)
        self.progress.setTextVisible(False)
        self.progress.setStyleSheet(BAR_STYLE)


def count(app,window):
    count = 0
    while count < TIME_LIMIT:
        count += 1
        time.sleep(0.1)
        window.progress.setValue(count)
    time.sleep(1)
    app.quit()

def init_IDE():
    app = QApplication(sys.argv)
    window = init_window()
    window.show()

    x = threading.Thread(target=count,args=(app,window,))
    x.start()
    app.exec_()

if __name__ == '__main__':
    init_IDE()
    ide.run_IDE()
