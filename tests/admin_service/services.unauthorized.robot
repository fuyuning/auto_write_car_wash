*** Settings ***
Documentation  admin_service
Resource  ../resources.robot
Library  robot_car_wash_server_library.service.ServiceLibrary
Force Tags  model:admin_service  虾洗后台


*** Test Cases ***
post admin services Fail Without Login
   [Documentation]  接口名:新增服务${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   post admin services fail 403   service_name=${service_name}  cost_price=${cost_price}  price=${price}  wash_normal_price=${wash_normal_price}  wash_group_price=${wash_group_price}  member_price=${member_price}  commission_price=${commission_price}  standard_time=${standard_time}    description=${description}  order_by=${order_by}  

get admin services Fail Without Login
   [Documentation]  接口名:服务列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get admin services fail 403     page_num=${page_num}  page_size=${page_size}  

put admin services by service id Fail Without Login
   [Documentation]  接口名:更改服务${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   put admin services by service id fail 403     service_id=${service_id}  service_name=${service_name}  cost_price=${cost_price}  price=${price}  wash_normal_price=${wash_normal_price}  wash_group_price=${wash_group_price}  member_price=${member_price}  commission_price=${commission_price}  standard_time=${standard_time}    description=${description}  order_by=${order_by}  

delete admin services by service id Fail Without Login
   [Documentation]  接口名:删除服务${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   delete admin services by service id fail 403     service_id=${service_id}


*** Variables ***
${service_id}  1a2b3c4d5e6f7zz


*** Keywords ***
post admin services Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post admin services  &{kwargs}
   expect status is 403  ${resp}  

get admin services Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin services  &{kwargs}
   expect status is 403  ${resp}  

put admin services by service id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  put admin services by service id  &{kwargs}
   expect status is 403  ${resp}  

delete admin services by service id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  delete admin services by service id  &{kwargs}
   expect status is 403  ${resp}  

