# ------------------------------------------------------------
# File: json_object.py
# Developed by: Esteban Alvarado Vargas
# Project: FunSkills-[Compiler]
# version: 1.0
# last edited by: Esteban Alvarado:: 3/11/19 6.30
#
# Description: This module allows the configuration of the json
#              file of the games, providing the individual
#              functionalities to customize each game.
#
# TEC 2019 | CE3104 - Lenguajes, Compiladores e Interpretes
# ------------------------------------------------------------

from src.json.json_utils import *

# Game 1 serializer: objects
class object():

    # Constructor that is responsible for the initialization
    # of the attributes
    def __init__(self):
        self.__json = get_json()
        self.__pos = []
        self.__height = 10
        self.__length = 20
        self.__time =  15
        self.__repeat = 1

    # -------------------------------- #
    #       Parameter Costumizer       #
    # -------------------------------- #
    def set_position(self,height,length):
        self.__height = height
        self.__length = length

    def set_time(self,time):
        self.__time = time

    def set_repeats(self,repeat):
        self.__repeat = repeat

    def set_positions(self,pos):
        self.__pos = pos

    # -------------------------------- #
    #       Util Functionalities       #
    # -------------------------------- #
    def __get_this_game(self):
        return self.__json["object"]

    # -------------------------------- #
    #            JSON Builder          #
    # -------------------------------- #
    def build_json(self):

        game = self.__get_this_game()

        # starting positions
        game["pos"] = self.__pos
        game["height"] = self.__height
        game["length"] = self.__length

        # iteration control
        game["time"] = self.__time
        game["repeat"] = self.__repeat

        #print(game)
        save_json(self.__json)

