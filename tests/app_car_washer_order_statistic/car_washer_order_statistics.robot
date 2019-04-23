*** Settings ***
Documentation  app_car_washer_order_statistic
Resource  ../resources.robot
Library  robot_car_wash_app_library.car_washer_order_statistic.CarWasherOrderStatisticLibrary
Suite Setup  Login  ${app_username}  ${app_password}

Force Tags  model:app_car_washer_order_statistic  虾客APP


*** Test Cases ***
Get car_washer_order_statistic By Id Fail Without Login
   [Documentation]  接口名:车辆信息详情${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  mouth=${mouth}  
   ${unessential_params}  create list  
   run every case by params  Get car washer order statistic By Id Fail 403  ${essential_params}  ${unessential_params}  car_washer_order_statistic_id=${car_washer_order_statistic_id}



Get car_washer_order_statistic By Id Success 
   [Documentation]  接口名:车辆信息详情${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为  对象。
   [Tags]           Respcode:200
   ${essential_params}  create list  mouth=${mouth}  
   ${unessential_params}  create list  
   run every case by params  Get car washer order statistic By Id Success 200  ${essential_params}  ${unessential_params}  car_washer_order_statistic_id=${car_washer_order_statistic_id}



Get car_washer_order_statistic By Id Fail With Wrong Params
   [Documentation]  接口名:车辆信息详情${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  mouth=${mouth}  
   ${unessential_params}  create list  
   run every case by params  Get car washer order statistic By Id Fail 422  ${essential_params}  ${unessential_params}  car_washer_order_statistic_id=${car_washer_order_statistic_id}



Get car_washer_order_statistic By Id Fail With Wrong Url
   [Documentation]  接口名:车辆信息详情${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  mouth=${mouth}  
   ${unessential_params}  create list  
   run every case by params  Get car washer order statistic By Id Fail 404  ${essential_params}  ${unessential_params}  car_washer_order_statistic_id=${wrong_url_id}



*** Variables ***
${car_washer_order_statistic_id}


*** Keywords ***
Get Car washer order statistic By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get car washer order statistic by car washer order statistic id  &{kwargs}
   expect status is 403  ${resp}  

Get Car washer order statistic By Id Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get car washer order statistic by car washer order statistic id  &{kwargs}
   expect status is 200  ${resp}  app_car_washer_order_statistic/Get_Car_washer_order_statistic_By_Id_200.json
   ${car_washer_order_statistic_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][car_washer_order_statistic_id]}
   set global variable   ${car_washer_order_statistic_id}

Get Car washer order statistic By Id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get car washer order statistic by car washer order statistic id  &{kwargs}
   expect status is 422  ${resp}  

Get Car washer order statistic By Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  get car washer order statistic by car washer order statistic id  &{kwargs}
   expect status is 404  ${resp}  

