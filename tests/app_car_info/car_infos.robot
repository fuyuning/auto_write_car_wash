*** Settings ***
Documentation  app_car_info
Resource  ../resources.robot
Library  robot_car_wash_app_library.car_info.CarInfoLibrary
Suite Setup  Login  ${app_username}  ${app_password}

Force Tags  model:app_car_info  虾客APP


*** Test Cases ***
Get car_info Fail Without Login
   [Documentation]  接口名:车辆信息详情${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  car_ids=${car_ids}  
   ${unessential_params}  create list  
   run every case by params  Get car wash car infos Fail 403  ${essential_params}  ${unessential_params}



Get car_info Success 
   [Documentation]  接口名:车辆信息详情${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 CarInfo 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  car_ids=${car_ids}  
   ${unessential_params}  create list  
   run every case by params  Get car wash car infos Success 200  ${essential_params}  ${unessential_params}



Get car_info Fail With Wrong Params
   [Documentation]  接口名:车辆信息详情${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  car_ids=${car_ids}  
   ${unessential_params}  create list  
   run every case by params  Get car wash car infos Fail 422  ${essential_params}  ${unessential_params}



*** Variables ***


*** Keywords ***
Get Car wash car infos Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get car wash car infos   &{kwargs}
   expect status is 403  ${resp}  

Get Car wash car infos Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get car wash car infos   &{kwargs}
   expect status is 200  ${resp}  app_car_info/Get_Car_wash_car_infos_200.json

Get Car wash car infos Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get car wash car infos   &{kwargs}
   expect status is 422  ${resp}  

