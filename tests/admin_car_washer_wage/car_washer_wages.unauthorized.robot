*** Settings ***
Documentation  admin_car_washer_wage
Resource  ../resources.robot
Library  robot_car_wash_server_library.car_washer_wage.CarWasherWageLibrary
Force Tags  model:admin_car_washer_wage  虾洗后台


*** Test Cases ***
get admin car washer wages Fail Without Login
   [Documentation]  接口名:工资结算${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get admin car washer wages fail 403     username=${username}  name=${name}  end_time=${end_time}  page_num=${page_num}  page_size=${page_size}  

get admin car washer wages by car washer wage id Fail Without Login
   [Documentation]  接口名:工资明细${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get admin car washer wages by car washer wage id fail 403     car_washer_wage_id=${car_washer_wage_id}

get admin car washer wages export Fail Without Login
   [Documentation]  接口名:虾克工资导出${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
    get admin car washer wages export fail 403


*** Variables ***
${car_washer_wage_id}  1a2b3c4d5e6f7zz


*** Keywords ***
get admin car washer wages Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin car washer wages  &{kwargs}
   expect status is 403  ${resp}  

get admin car washer wages by car washer wage id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin car washer wages by car washer wage id  &{kwargs}
   expect status is 403  ${resp}  

get admin car washer wages export Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin car washer wages export  &{kwargs}
   expect status is 403  ${resp}  

