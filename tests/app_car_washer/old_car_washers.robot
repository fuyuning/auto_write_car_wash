*** Settings ***
Documentation  app_car_washer
Resource  ../resources.robot
Library  robot_washing_expert_library.car_washer.CarWasherLibrary
Suite Setup  Login  ${username}   ${password}
Force Tags  model:app_car_washer  虾客APP


