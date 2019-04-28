*** Settings ***
Documentation  admin_wash_user
Resource  ../resources.robot
Library  robot_car_wash_server_library.wash_user.WashUserLibrary
Force Tags  model:admin_wash_user  虾洗后台


*** Test Cases ***
post admin wash users clear by userid Fail Without Login
   [Documentation]  接口名:用户数据清除${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  mobile=${mobile}  
   ${unessential_params}  create list  
   run every case by params  post admin wash users clear by userid Fail 403  ${essential_params}  ${unessential_params}    userid/clear=${userid/clear}  userid/wash_user_group=${userid/wash_user_group}

get admin wash users Fail Without Login
   [Documentation]  接口名:用户查询${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  page_num=${page_num}  page_size=${page_size}  
   ${unessential_params}  create list  userid=${userid}  wash_user_group_id=${wash_user_group_id}  created_section=${created_section}  
   run every case by params  get admin wash users Fail 403  ${essential_params}  ${unessential_params}

get admin wash users userid Fail Without Login
   [Documentation]  接口名:用户信息查询${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
    get admin wash users userid Fail 403

get admin wechat info Fail Without Login
   [Documentation]  接口名:微信信息查询${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  userid=${userid}  
   run every case by params  get admin wechat info Fail 403  ${essential_params}  ${unessential_params}

patch admin wash users wash user group by userid Fail Without Login
   [Documentation]  接口名:修改用户分组${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  wash_user_group_id=${wash_user_group_id}  
   ${unessential_params}  create list  
   run every case by params  patch admin wash users wash user group by userid Fail 403  ${essential_params}  ${unessential_params}    userid/clear=${userid/clear}  userid/wash_user_group=${userid/wash_user_group}


*** Variables ***
${userid/clear}  12345678909876543
${userid/wash_user_group}  12345678909876543


*** Keywords ***
post admin wash users clear by userid Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post admin wash users clear by userid  &{kwargs}
   expect status is 403  ${resp}  

get admin wash users Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin wash users  &{kwargs}
   expect status is 403  ${resp}  

get admin wash users userid Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin wash users userid  &{kwargs}
   expect status is 403  ${resp}  

get admin wechat info Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin wechat info  &{kwargs}
   expect status is 403  ${resp}  

patch admin wash users wash user group by userid Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch admin wash users wash user group by userid  &{kwargs}
   expect status is 403  ${resp}  

