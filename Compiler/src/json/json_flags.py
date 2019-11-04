# ------------------------------------------------------------
# File: json_flags.py
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

# Game 4 serializer: flags
class flags():

    # Constructor that is responsible for the initialization
    # of the attributes
    def __init__(self):
        self.__json = get_json()

        # Configuration Attributes
        self.__colors = ["river", "waterfall", "ocean", "rain", "water"]
        self.__points = [5, 10, 15, 20, 30]
        self.__cnt_inc = 1
        self.__time_dec = 1
        self.__time = 15
        self.__repeat = 1

    # -------------------------------- #
    #       Parameter Costumizer       #
    # -------------------------------- #
    def set_colors(self,colors):
        self.__colors = colors

    def set_points(self,points):
        self.__points = points

    def set_time_dec(self,time_dec):
        self.__time_dec = time_dec

    def set_cnt_inc(self, cnt_inc):
        self.__cnt_inc = cnt_inc

    def set_time(self,time):
        self.__time = time

    def set_repeats(self,repeat):
        self.__repeat = repeat

    # -------------------------------- #
    #       Util Functionalities       #
    # -------------------------------- #
    def __get_this_game(self):
        return self.__json["flags"]

    # -------------------------------- #
    #            JSON Builder          #
    # -------------------------------- #
    def build_json(self):
        game = self.__get_this_game()

        # starting arrays
        game["colors"] = self.__colors
        game["points"] = self.__points

        # increase\decrease factors
        game["cnt_inc"] = self.__cnt_inc
        game["time_dec"] = self.__time_dec

        # iteration control
        game["time"] = self.__time
        game["repeat"] = self.__repeat

        save_json(self.__json)
