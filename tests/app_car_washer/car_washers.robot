*** Settings ***
Documentation  app_car_washer
Resource  ../resources.robot
Library  robot_washing_expert_library.car_washer.CarWasherLibrary
Suite Setup  Login  ${username}   ${password}
Force Tags  model:app_car_washer  虾客APP


*** Test Cases ***
get car wash promoter qrcode Success 
   [Documentation]  接口名:获取虾客二维码${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为  列表。
   [Tags]           Respcode:200
    get car wash promoter qrcode success 200

get car wash promoter statistic Success 
   [Documentation]  接口名:获取虾克拉新统计${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为  列表。
   [Tags]           Respcode:200
    get car wash promoter statistic success 200


*** Keywords ***
get car wash promoter qrcode Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get car wash promoter qrcode  &{kwargs}
   expect status is 200  ${resp}  app_car_washer/get_car_wash_promoter_qrcode_200.json

get car wash promoter statistic Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get car wash promoter statistic  &{kwargs}
   expect status is 200  ${resp}  app_car_washer/get_car_wash_promoter_statistic_200.json

