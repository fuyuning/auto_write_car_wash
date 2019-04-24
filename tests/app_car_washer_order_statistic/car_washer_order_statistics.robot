*** Settings ***
Documentation  app_car_washer_order_statistic
Resource  ../resources.robot
Library  robot_car_wash_app_library.car_washer_order_statistic.CarWasherOrderStatisticLibrary
Suite Setup  Login  ${app_username}  ${app_password}

Force Tags  model:app_car_washer_order_statistic  虾客APP


*** Test Cases ***
Get car Washers order statistic Fail With Wrong Url
   [Documentation]  接口名:车辆信息详情${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
    Get car Washers order statistic Fail 404

Get car Washers order statistic Success 
   [Documentation]  接口名:车辆信息详情${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为  列表。
   [Tags]           Respcode:200
    Get car Washers order statistic Success 200


*** Keywords ***
Get car Washers order statistic Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  Get car Washers order statistic   &{kwargs}
   expect status is 404  ${resp}  

Get car Washers order statistic Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Get car Washers order statistic   &{kwargs}
   expect status is 200  ${resp}  app_car_washer_order_statistic/Get_car_Washers_order_statistic_200.json

