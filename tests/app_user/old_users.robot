*** Settings ***
Documentation  app_user
Resource  ../resources.robot
Library  robot_washing_expert_library.user.UserLibrary
Suite Setup  Login  ${username}   ${password}
Force Tags  model:app_user  虾客APP


