*** Settings ***
Documentation  admin_car_washer_statistic
Resource  ../resources.robot
Library  robot_car_wash_server_library.car_washer_statistic.CarWasherStatisticLibrary
Suite Setup  Login  ${admin_username}   ${admin_password}
Suite Teardown  Logout
Force Tags  model:admin_car_washer_statistic  虾洗后台


*** Test Cases ***
Get Admin Car Washer Statistics Fail With Wrong Url
   [Documentation]  接口名:统计列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  
   ${unessential_params}  create list  username=${username}  mobile=${mobile}  section=${section}  order_by=${order_by}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get Admin Car Washer Statistics Fail 404  ${essential_params}  ${unessential_params}

Get Admin Car Washer Statistics Success 
   [Documentation]  接口名:统计列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 CarWasherStatistic 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  
   ${unessential_params}  create list  username=${username}  mobile=${mobile}  section=${section}  order_by=${order_by}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get Admin Car Washer Statistics Success 200  ${essential_params}  ${unessential_params}

Get Admin Car Washer Statistics Fail With Wrong Params
   [Documentation]  接口名:统计列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  username=${username}  mobile=${mobile}  section=${section}  order_by=${order_by}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get Admin Car Washer Statistics Fail 422  ${essential_params}  ${unessential_params}

Patch Visible By Username Fail With Wrong Url
   [Documentation]  接口名:统计数据隐藏${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  visible=False  
   ${unessential_params}  create list  
   run every case by params  Patch Visible By Username Fail 404  ${essential_params}  ${unessential_params}  username/visible=${wrong_url_id}

Patch Visible By Username Success 
   [Documentation]  接口名:统计数据隐藏${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create list  visible=False  
   ${unessential_params}  create list  
   run every case by params  Patch Visible By Username Success 204  ${essential_params}  ${unessential_params}  username/visible=${username/visible}

Patch Visible By Username Fail With Wrong Params
   [Documentation]  接口名:统计数据隐藏${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  visible=False  
   ${unessential_params}  create list  
   run every case by params  Patch Visible By Username Fail 422  ${essential_params}  ${unessential_params}  username/visible=${username/visible}


*** Variables ***
${username/visible}


*** Keywords ***
Get Admin Car Washer Statistics Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Car Washer Statistics   &{kwargs}
   expect status is 404  ${resp}  

Get Admin Car Washer Statistics Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Car Washer Statistics   &{kwargs}
   expect status is 200  ${resp}  admin_car_washer_statistic/Get_Admin_Car_Washer_Statistics_200.json
   ${username/visible}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][username/visible]}
   set global variable   ${username/visible}

Get Admin Car Washer Statistics Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Car Washer Statistics   &{kwargs}
   expect status is 422  ${resp}  

Patch Visible By Username Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  Patch Visible By Username   &{kwargs}
   expect status is 404  ${resp}  

Patch Visible By Username Success 204
   [Arguments]  &{kwargs}
   ${resp}=  Patch Visible By Username   &{kwargs}
   expect status is 204  ${resp}  

Patch Visible By Username Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Patch Visible By Username   &{kwargs}
   expect status is 422  ${resp}  

