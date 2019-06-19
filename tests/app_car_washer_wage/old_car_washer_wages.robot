*** Settings ***
Documentation  app_car_washer_wage
Resource  ../resources.robot
Library  robot_washing_expert_library.car_washer_wage.CarWasherWageLibrary
Suite Setup  Login  ${username}   ${password}
Force Tags  model:app_car_washer_wage  虾客APP


