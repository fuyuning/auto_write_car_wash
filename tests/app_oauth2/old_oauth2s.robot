*** Settings ***
Documentation  app_oauth2
Resource  ../resources.robot
Library  robot_washing_expert_library.oauth2.Oauth2Library
Suite Setup  Login  ${username}   ${password}
Force Tags  model:app_oauth2  虾客APP


