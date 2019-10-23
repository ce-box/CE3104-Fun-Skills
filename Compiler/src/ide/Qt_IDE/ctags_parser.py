# ------------------------------------------------------------
# File: ctags_parser.py
# Developed by: Esteban Alvarado
# Project: FunSkills-[Compiler]
# version: 1.0
# last edited by: Esteban Alvarado:: 22/10/19 17.00
#
# Description: This file defines the Ctags_parser class.
#              An object from this class will run ctags
#              build an sqlite database. You've seen
#              something fairly similar in A useful
#              database chapter.
#
# TEC 2019 | CE3104 - Lenguajes, Compiladores e Interpretes
# ------------------------------------------------------------

import os
import subprocess
import time
import json
import sqlite3
import src.ide.Qt_IDE.globals as globals
from src.ide.Qt_IDE.singleton import Singleton

'''================================================================================'''
'''|                               CTAGS PARSER                                   |'''
'''================================================================================'''


@Singleton
class Ctags_parser():

    def __init__(self):
        self.json_string = None
        self.json_data = None
        self.conn = None
        self.cursor = None
        self.build_ctags()

    ''''''

    def build_ctags(self):
        os.chdir(globals.projectFolderPath)
        print("Launching ctags on: " + globals.projectFolderPath)
        proc = subprocess.Popen(["ctags", "-R", "--output-format=json",
                                 "--fields=+n", "--c-types=+l"],
                                stdout=subprocess.PIPE, shell=True)
        time.sleep(0.1)
        print("Waiting for ctags to finish")
        time.sleep(0.1)
        self.json_string = (proc.communicate()[0]).decode('utf-8')
        print("")
        print("")

        self.build_ctags_database()

    ''''''

    def build_ctags_database(self):
        self.json_string = self.json_string.replace("}\r\n", "},\r\n")
        self.json_string = "[" + self.json_string + "]"
        self.json_string = self.json_string.replace("},\r\n]", "}\r\n]")

        try:
            self.json_data = json.loads(self.json_string)
        except:
            print("Could not convert json_string to json_data")

        self.conn = sqlite3.connect(":memory:")
        self.cursor = self.conn.cursor()
        self.cursor.execute("""
            CREATE TABLE IF NOT EXISTS main
            (_type TEXT, name TEXT, path TEXT, pattern TEXT, line TEXT,
            typeref TEXT, kind TEXT, scope TEXT, scopeKind TEXT)
        """)

        for entry in self.json_data:
            self.cursor.execute("""
            INSERT INTO main
            (_type, name, path, pattern, line, typeref, kind, scope, scopeKind)
            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)""",
                                (entry["_type"] if "_type" in entry else None,
                                 entry["name"] if "name" in entry else None,
                                 entry["path"] if "path" in entry else None,
                                 entry["pattern"] if "pattern" in entry else None,
                                 entry["line"] if "line" in entry else None,
                                 entry["typeref"] if "typeref" in entry else None,
                                 entry["kind"] if "kind" in entry else None,
                                 entry["scope"] if "scope" in entry else None,
                                 entry["scopeKind"] if "scopeKind" in entry else None
                                 )
                                )
        ###

    ''''''

    def get_symbol_kind(self, name):
        data = None
        try:
            self.cursor.execute("SELECT name,kind FROM main WHERE name = \"{n}\"".format(n=name))
            data = self.cursor.fetchone()
        except:
            pass

        if data is None:
            return ("", "")
        else:
            return (data[0], data[1])
        ###

    ''''''

    def where_to_jump(self, name):
        try:
            self.cursor.execute("SELECT path,line FROM main WHERE name = \"{n}\"".format(n=name))
            data = self.cursor.fetchone()
        except:
            pass

        if data is None:
            return ""
        else:
            return (data[0], data[1])
        ###

    ''''''

    def __del__(self):
        if self.conn is not None:
            self.conn.commit()
            self.conn.close()
        print("Database closed")

    ''''''


'''=== end Class ==='''