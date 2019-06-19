*** Settings ***
Documentation  app_call_user
Resource  ../resources.robot
Library  robot_washing_expert_library.call_user.CallUserLibrary
Suite Setup  Login  ${username}   ${password}
Force Tags  model:app_call_user  虾客APP


