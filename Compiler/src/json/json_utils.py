# ------------------------------------------------------------
# File: json_utils.py
# Developed by: Esteban Alvarado Vargas
# Project: FunSkills-[Compiler]
# version: 1.0
# last edited by: Esteban Alvarado:: 3/11/19 5.30
#
# Description: This code is responsible for reading and
#              modifying the json file of game settings.
#
# TEC 2019 | CE3104 - Lenguajes, Compiladores e Interpretes
# ------------------------------------------------------------

import os
import json

file_dir = os.path.dirname(os.path.abspath(__file__))
directory_file = os.path.dirname(file_dir)
config_path =  directory_file + '/tmp_file/config.json'

# @brief - It is responsible for reading the configuration
#          json and returns it as a dictionary.
def get_json():
    with open(config_path, 'r') as json_file:
        config_json = json.load(json_file)
    return config_json

# @brief - Write the new dictionary with the new configuration in the json
# @param new_json_dict
def save_json(new_setup):
    with open(config_path, 'w') as json_file:
        json.dump(new_setup, json_file,indent=4)

if __name__ == '__main__':
    print(get_json())
    save_json({'a':1})