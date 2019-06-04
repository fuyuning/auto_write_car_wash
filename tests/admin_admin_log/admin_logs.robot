*** Settings ***
Documentation  admin_admin_log
Resource  ../resources.robot
Library  robot_car_wash_server_library.admin_log.AdminLogLibrary
Suite Setup  Login  ${username}   ${password}
Suite Teardown  Logout
Force Tags  model:admin_admin_log  虾洗后台


*** Test Cases ***
get admin admin logs Success 
   [Documentation]  接口名:查询操作记录${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 AdminLog 列表。
   [Tags]           Respcode:200
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  user=${user}  created_section=${created_section}  page_num=${page_num}  page_size=${page_size}  
   run every case by params   get admin admin logs success 200   ${essential_params}  ${unessential_params}

get admin admin logs Fail With Wrong Params
   [Documentation]  接口名:查询操作记录${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  user=${user_422}  created_section=${created_section_422}  page_num=${page_num_422}  page_size=${page_size_422}  
   run every case by params   get admin admin logs fail 422   ${essential_params}  ${unessential_params}  success=False


*** Keywords ***
get admin admin logs Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin admin logs  &{kwargs}
   expect status is 200  ${resp}  admin_admin_log/get_admin_admin_logs_200.json

get admin admin logs Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get admin admin logs  &{kwargs}
   expect status is 422  ${resp}  

