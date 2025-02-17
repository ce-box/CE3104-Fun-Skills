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
        self.__colors = ["red","blue","yellow","orange","green"]
        self.__points = [5,10,15,20,25]

        # Flags amount
        self.__amnt = 3
        self.__amnt_inc = 1
        self.__amnt_dec = 0

        # Wait time
        self.__time_inc = 0
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


    def set_time(self,time):
        self.__time = time

    def set_time_inc(self,time_inc):
        self.__time_inc = time_inc

    def set_time_dec(self,time_dec):
        self.__time_dec = time_dec


    def set_amnt(self, amnt):
        self.__amnt = amnt

    def set_amnt_inc(self, amnt_inc):
        self.__amnt_inc = amnt_inc

    def set_amnt_dec(self, amnt_dec):
        self.__amnt_dec = amnt_dec


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
        print("points: ",self.__points)
        game["points"] = self.__points

        # increase\decrease factors
        game["amnt_inc"] = self.__amnt_inc
        game["amnt_dec"] = self.__amnt_dec
        game["time_inc"] = self.__time_inc
        game["time_dec"] = self.__time_dec

        # iteration control
        game["amnt"] = self.__amnt
        game["time"] = self.__time
        game["repeat"] = self.__repeat


        self.__json["flags"] = game
        save_json(self.__json)
