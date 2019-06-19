*** Settings ***
Documentation  app_car_brand
Resource  ../resources.robot
Library  robot_washing_expert_library.car_brand.CarBrandLibrary
Suite Setup  Login  ${username}   ${password}
Force Tags  model:app_car_brand  虾客APP


