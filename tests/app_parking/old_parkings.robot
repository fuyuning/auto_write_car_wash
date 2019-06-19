*** Settings ***
Documentation  app_parking
Resource  ../resources.robot
Library  robot_washing_expert_library.parking.ParkingLibrary
Suite Setup  Login  ${username}   ${password}
Force Tags  model:app_parking  虾客APP


