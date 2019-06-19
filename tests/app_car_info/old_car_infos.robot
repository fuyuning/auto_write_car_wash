*** Settings ***
Documentation  app_car_info
Resource  ../resources.robot
Library  robot_washing_expert_library.car_info.CarInfoLibrary
Suite Setup  Login  ${username}   ${password}
Force Tags  model:app_car_info  虾客APP


