*** Settings ***
Documentation  admin_car_washer
Resource  ../resources.robot
Library  robot_car_wash_server_library.car_washer.CarWasherLibrary
Suite Setup  Login  ${admin_username}   ${admin_password}
Suite Teardown  Logout
Force Tags  model:admin_car_washer  虾洗后台


*** Test Cases ***
Get order Count by username Success 
   [Documentation]  接口名:虾客接单数量${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为  对象。
   [Tags]           Respcode:200
   ${essential_params}  create list  
   ${unessential_params}  create list  section=${section}  
   run every case by params  Get order Count by username Success 200  ${essential_params}  ${unessential_params}  username/order_count=${username/order_count}

Get order Count by username Fail With Wrong Params
   [Documentation]  接口名:虾客接单数量${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  section=${section_422}  
   run every case by params  Get order Count by username Fail 422  ${essential_params}  ${unessential_params}  username/order_count=${username/order_count}

Get order Count by username Fail With Wrong Url
   [Documentation]  接口名:虾客接单数量${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  
   ${unessential_params}  create list  section=${section}  
   run every case by params  Get order Count by username Fail 404  ${essential_params}  ${unessential_params}  username/order_count=${wrong_url_id}


*** Variables ***
${username/order_count}  


*** Keywords ***
Get order Count by username Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Get order Count by username   &{kwargs}
   expect status is 200  ${resp}  admin_car_washer/Get_order_Count_by_username_200.json
   ${username/order_count}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][username/order_count]}
   set global variable   ${username/order_count}

Get order Count by username Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Get order Count by username   &{kwargs}
   expect status is 422  ${resp}  

Get order Count by username Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  Get order Count by username   &{kwargs}
   expect status is 404  ${resp}  

