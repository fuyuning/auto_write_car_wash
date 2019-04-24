*** Settings ***
Documentation  admin_wash_user
Resource  ../resources.robot
Library  robot_car_wash_server_library.wash_user.WashUserLibrary
Force Tags  model:admin_wash_user  虾洗后台


*** Test Cases ***
Post Clear By Userid Fail Without Login
   [Documentation]  接口名:用户数据清除${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  mobile=${mobile}  
   ${unessential_params}  create list  
   run every case by params  Post Clear By Userid Fail 403  ${essential_params}  ${unessential_params}  userid/clear=${userid/clear}

Get Admin Wash Users Fail Without Login
   [Documentation]  接口名:用户查询${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  page_num=${page_num}  page_size=${page_size}  
   ${unessential_params}  create list  userid=${userid}  wash_user_group_id=${wash_user_group_id}  created_section=${created_section}  
   run every case by params  Get Admin Wash Users Fail 403  ${essential_params}  ${unessential_params}

Get wash Users userid Fail Without Login
   [Documentation]  接口名:用户信息查询${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
    Get wash Users userid Fail 403

Get Admin Wechat Info Fail Without Login
   [Documentation]  接口名:微信信息查询${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  userid=${userid}  
   run every case by params  Get Admin Wechat Info Fail 403  ${essential_params}  ${unessential_params}

Patch wash User Group by userid Fail Without Login
   [Documentation]  接口名:修改用户分组${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  wash_user_group_id=${wash_user_group_id}  
   ${unessential_params}  create list  
   run every case by params  Patch wash User Group by userid Fail 403  ${essential_params}  ${unessential_params}  userid/wash_user_group=${userid/wash_user_group}


*** Variables ***
${userid/clear}  12345678909876543
${userid/wash_user_group}  12345678909876543


*** Keywords ***
Post Clear By Userid Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Post Clear By Userid   &{kwargs}
   expect status is 403  ${resp}  

Get Admin Wash Users Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Wash Users   &{kwargs}
   expect status is 403  ${resp}  

Get wash Users userid Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get wash Users userid   &{kwargs}
   expect status is 403  ${resp}  

Get Admin Wechat Info Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Wechat Info   &{kwargs}
   expect status is 403  ${resp}  

Patch wash User Group by userid Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Patch wash User Group by userid   &{kwargs}
   expect status is 403  ${resp}  

