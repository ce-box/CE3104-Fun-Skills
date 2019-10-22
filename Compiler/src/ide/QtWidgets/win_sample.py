import sys
from PyQt5.QtWidgets import *

def test():
    app = QApplication(sys.argv)
    button = QPushButton("Hello World", None)
    button.show()
    app.exec_()
