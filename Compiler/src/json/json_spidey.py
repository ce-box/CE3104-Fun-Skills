# ------------------------------------------------------------
# File: json_spidey.py
# Developed by: Esteban Alvarado Vargas
# Project: FunSkills-[Compiler]
# version: 1.0
# last edited by: Esteban Alvarado:: 4/11/19 15.30
#
# Description: This module allows the configuration of the json
#              file of the games, providing the individual
#              functionalities to customize each game.
#
# TEC 2019 | CE3104 - Lenguajes, Compiladores e Interpretes
# ------------------------------------------------------------

from src.json.json_utils import *

# Game 3 serializer: Spidey
class spidey():

    # Constructor that is responsible for the initialization
    # of the attributes
    def __init__(self):
        self.__json = get_json()

        # Configuration Attributes
        self.__words = ["river", "waterfall", "ocean", "rain", "water"]
        self.__points = [5, 10, 15, 20, 30]
        self.__rows = 2
        self.__cols = 2

    # -------------------------------- #
    #       Parameter Costumizer       #
    # -------------------------------- #
    def set_words(self,words):
        self.__words = words

    def set_points(self,points):
        self.__points = points

    def set_rows(self,rows):
        self.__rows = rows

    def set_cols(self, cols):
        self.__cols = cols

    # -------------------------------- #
    #       Util Functionalities       #
    # -------------------------------- #
    def __get_this_game(self):
        return self.__json["spidey"]

    # -------------------------------- #
    #            JSON Builder          #
    # -------------------------------- #
    def build_json(self):
        game = self.__get_this_game()

        # starting arrays
        game["words"] = self.__words
        game["points"] = self.__points

        # matrix values
        game["rows"] = self.__rows
        game["cols"] = self.__cols


        print(game)

        save_json(self.__json)
