*** Settings ***
Documentation  app_car_series
Resource  ../resources.robot
Library  robot_washing_expert_library.car_series.CarSeriesLibrary
Suite Setup  Login  ${username}   ${password}
Force Tags  model:app_car_series  虾客APP


