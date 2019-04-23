*** Settings ***
Documentation  admin_user_car
Resource  ../resources.robot
Library  robot_car_wash_server_library.user_car.UserCarLibrary
Suite Setup  Login  ${admin_username}   ${admin_password}
Suite Teardown  Logout
Force Tags  model:admin_user_car  虾洗后台


*** Test Cases ***
Get user_car Success 
   [Documentation]  接口名:用户车辆信息查询${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 UserCar 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  
   ${unessential_params}  create list  user_id=${user_id}  
   run every case by params  Get admin user cars Success 200  ${essential_params}  ${unessential_params}



Get user_car Fail Without Login
   [Documentation]  接口名:用户车辆信息查询${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  user_id=${user_id}  
   run every case by params  Get admin user cars Fail 403  ${essential_params}  ${unessential_params}



Get user_car Fail With Wrong Params
   [Documentation]  接口名:用户车辆信息查询${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  user_id=${user_id}  
   run every case by params  Get admin user cars Fail 422  ${essential_params}  ${unessential_params}



*** Variables ***


*** Keywords ***
Get Admin user cars Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin user cars   &{kwargs}
   expect status is 200  ${resp}  admin_user_car/Get_Admin_user_cars_200.json

Get Admin user cars Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin user cars   &{kwargs}
   expect status is 403  ${resp}  

Get Admin user cars Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get admin user cars   &{kwargs}
   expect status is 422  ${resp}  

