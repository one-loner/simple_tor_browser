import os
import sys
from PyQt5.QtCore import QUrl
from PyQt5.QtWebEngineWidgets import QWebEngineView
from PyQt5.QtWidgets import QApplication, QMainWindow, QToolBar

class Browser(QMainWindow):
    def __init__(self):
        super().__init__()

        # Create a web engine view
        self.view = QWebEngineView(self)

        # Create a toolbar
        self.toolbar = QToolBar(self)
        self.addToolBar(self.toolbar)

        # Set the central widget of the main window
        self.setCentralWidget(self.view)

        # Show the main window
        self.resize(800, 600)
        self.show()

    def load(self, url):
        self.view.load(QUrl(url))

os.environ["http_proxy"] = "127.0.0.1:8118"
os.environ["https_proxy"] = "127.0.0.1:8118"

u=open('/tmp/stburl','r')
urll=u.read()
u.close()
urll=urll.replace('\n','')
app = QApplication(sys.argv)
browser = Browser()
browser.load(urll)
sys.exit(app.exec_())
