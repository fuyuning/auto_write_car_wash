*** Settings ***
Documentation  app_wash_record
Resource  ../resources.robot
Library  robot_washing_expert_library.wash_record.WashRecordLibrary
Suite Setup  Login  ${username}   ${password}
Force Tags  model:app_wash_record  虾客APP


