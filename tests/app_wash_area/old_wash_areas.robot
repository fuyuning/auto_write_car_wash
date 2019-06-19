*** Settings ***
Documentation  app_wash_area
Resource  ../resources.robot
Library  robot_washing_expert_library.wash_area.WashAreaLibrary
Suite Setup  Login  ${username}   ${password}
Force Tags  model:app_wash_area  虾客APP


