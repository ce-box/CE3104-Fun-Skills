# ------------------------------------------------------------
# File: json_balloon.py
# Developed by: Esteban Alvarado Vargas
# Project: FunSkills-[Compiler]
# version: 1.0
# last edited by: Esteban Alvarado:: 4/11/19 14.30
#
# Description: This module allows the configuration of the json
#              file of the games, providing the individual
#              functionalities to customize each game.
#
# TEC 2019 | CE3104 - Lenguajes, Compiladores e Interpretes
# ------------------------------------------------------------

from src.json.json_utils import *

# Game 2 serializer: Balloon
class balloon():

    # Constructor that is responsible for the initialization
    # of the attributes
    def __init__(self):
        self.__json = get_json()

        # Configuration Attributes
        self.__height = 10
        self.__length = 20
        self.__h_inc = 0
        self.__h_dec = 0
        self.__l_inc = 0
        self.__l_dec = 0
        self.__repeat = 1

    # -------------------------------- #
    #       Parameter Costumizer       #
    # -------------------------------- #
    def set_position(self,height,length):
        self.__height = height
        self.__length = length

    def set_height_increment(self,inc_val):
        self.__h_inc = inc_val

    def set_height_decrement(self,dec_val):
        self.__h_dec = dec_val

    def set_length_increment(self, inc_val):
        self.__l_inc = inc_val

    def set_length_decrement(self, dec_val):
        self.__l_dec = dec_val

    def set_repeats(self,repeat):
        self.__repeat = repeat

    # -------------------------------- #
    #       Util Functionalities       #
    # -------------------------------- #
    def __get_this_game(self):
        return self.__json["balloon"]

    # -------------------------------- #
    #            JSON Builder          #
    # -------------------------------- #
    def build_json(self):
        game = self.__get_this_game()

        # starting positions
        game["height"] = self.__height
        game["length"] = self.__length

        # increase\decrease factors
        game["h_inc"] = self.__h_inc
        game["h_dec"] = self.__h_dec
        game["l_inc"] = self.__l_inc
        game["l_dec"] = self.__l_dec

        # iteration control
        game["repeat"] = self.__repeat
        #print(game)
        save_json(self.__json)
