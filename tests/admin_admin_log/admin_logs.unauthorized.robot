*** Settings ***
Documentation  admin_admin_log
Resource  ../resources.robot
Library  robot_car_wash_server_library.admin_log.AdminLogLibrary
Force Tags  model:admin_admin_log  虾洗后台


*** Test Cases ***
get admin admin logs Fail Without Login
   [Documentation]  接口名:查询操作记录${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get admin admin logs fail 403     user=${user}  created_section=${created_section}  page_num=${page_num}  page_size=${page_size}  


*** Keywords ***
get admin admin logs Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin admin logs  &{kwargs}
   expect status is 403  ${resp}  

