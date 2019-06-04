*** Settings ***
Documentation  admin_inspection
Resource  ../resources.robot
Library  robot_car_wash_server_library.inspection.InspectionLibrary
Force Tags  model:admin_inspection  虾洗后台


*** Test Cases ***
post admin inspections Fail Without Login
   [Documentation]  接口名:新增检查${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   post admin inspections fail 403   username=${username}  order_no=${order_no}  inspection_time=${inspection_time}  score=${score}  inspector=${inspector}    images=${images}  

get admin inspections Fail Without Login
   [Documentation]  接口名:获取检查列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get admin inspections fail 403   username=${username}    section=${section}  page_num=${page_num}  page_size=${page_size}  

get admin inspections by inspection id Fail Without Login
   [Documentation]  接口名:获取检查详情${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get admin inspections by inspection id fail 403     inspection_id=${inspection_id}

put admin inspections by inspection id Fail Without Login
   [Documentation]  接口名:编辑虾客${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   put admin inspections by inspection id fail 403     inspection_id=${inspection_id}  username=${username}  order_no=${order_no}  inspection_time=${inspection_time}  score=${score}  inspector=${inspector}    images=${images}  


*** Variables ***
${inspection_id}  1a2b3c4d5e6f7zz


*** Keywords ***
post admin inspections Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post admin inspections  &{kwargs}
   expect status is 403  ${resp}  

get admin inspections Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin inspections  &{kwargs}
   expect status is 403  ${resp}  

get admin inspections by inspection id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin inspections by inspection id  &{kwargs}
   expect status is 403  ${resp}  

put admin inspections by inspection id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  put admin inspections by inspection id  &{kwargs}
   expect status is 403  ${resp}  

