*** Settings ***
Documentation  app_car_position
Resource  ../resources.robot
Library  robot_washing_expert_library.car_position.CarPositionLibrary
Suite Setup  Login  ${username}   ${password}
Force Tags  model:app_car_position  虾客APP


