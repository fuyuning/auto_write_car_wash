*** Settings ***
Documentation  app_car_washer_order_statistic
Resource  ../resources.robot
Library  robot_washing_expert_library.car_washer_order_statistic.CarWasherOrderStatisticLibrary
Suite Setup  Login  ${username}   ${password}
Force Tags  model:app_car_washer_order_statistic  虾客APP


