*** Settings ***
Documentation  wxmp_wash_record
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.wash_record.WashRecordLibrary
Suite Setup  Login By Openid  ${openid}
Force Tags  model:wxmp_wash_record  车主微信端


