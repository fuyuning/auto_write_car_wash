*** Settings ***
Documentation  admin_wash_user_group
Resource  ../resources.robot
Library  robot_car_wash_server_library.wash_user_group.WashUserGroupLibrary
Force Tags  model:admin_wash_user_group  虾洗后台


*** Test Cases ***
post admin wash user groups Fail Without Login
   [Documentation]  接口名:新增分组${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   post admin wash user groups fail 403   name=${name}  order_by=${order_by}    

get admin wash user groups Fail Without Login
   [Documentation]  接口名:分组列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
    get admin wash user groups fail 403

get admin wash user groups by wash user group id Fail Without Login
   [Documentation]  接口名:分组信息获取${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get admin wash user groups by wash user group id fail 403     wash_user_group_id=${wash_user_group_id}

put admin wash user groups by wash user group id Fail Without Login
   [Documentation]  接口名:编辑分组${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   put admin wash user groups by wash user group id fail 403     wash_user_group_id=${wash_user_group_id}  name=${name}  order_by=${order_by}    

delete admin wash user groups by wash user group id Fail Without Login
   [Documentation]  接口名:删除分组${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   delete admin wash user groups by wash user group id fail 403     wash_user_group_id=${wash_user_group_id}


*** Variables ***
${wash_user_group_id}  1a2b3c4d5e6f7zz


*** Keywords ***
post admin wash user groups Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post admin wash user groups  &{kwargs}
   expect status is 403  ${resp}  

get admin wash user groups Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin wash user groups  &{kwargs}
   expect status is 403  ${resp}  

get admin wash user groups by wash user group id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin wash user groups by wash user group id  &{kwargs}
   expect status is 403  ${resp}  

put admin wash user groups by wash user group id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  put admin wash user groups by wash user group id  &{kwargs}
   expect status is 403  ${resp}  

delete admin wash user groups by wash user group id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  delete admin wash user groups by wash user group id  &{kwargs}
   expect status is 403  ${resp}  

