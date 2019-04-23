*** Settings ***
Documentation  admin_wash_user
Resource  ../resources.robot
Library  robot_car_wash_server_library.wash_user.WashUserLibrary
Suite Setup  Login  ${admin_username}   ${admin_password}
Suite Teardown  Logout
Force Tags  model:admin_wash_user  虾洗后台


*** Test Cases ***
Post wash_user By Id Success 
   [Documentation]  接口名:用户数据清除${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create list  mobile=${mobile}  
   ${unessential_params}  create list  
   run every case by params  Post admin wash users By Id Success 204  ${essential_params}  ${unessential_params}  userid/clear=${userid/clear}



Post wash_user By Id Fail Without Login
   [Documentation]  接口名:用户数据清除${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  mobile=${mobile}  
   ${unessential_params}  create list  
   run every case by params  Post admin wash users By Id Fail 403  ${essential_params}  ${unessential_params}  userid/clear=${userid/clear}



Post wash_user By Id Fail With Wrong Params
   [Documentation]  接口名:用户数据清除${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  mobile=${mobile}  
   ${unessential_params}  create list  
   run every case by params  Post admin wash users By Id Fail 422  ${essential_params}  ${unessential_params}  userid/clear=${userid/clear}



Post wash_user By Id Fail With Wrong Url
   [Documentation]  接口名:用户数据清除${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  mobile=${mobile}  
   ${unessential_params}  create list  
   run every case by params  Post admin wash users By Id Fail 404  ${essential_params}  ${unessential_params}  userid/clear=${wrong_url_id}



Get wash_user Fail Without Login
   [Documentation]  接口名:用户查询${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  page_num=${page_num}  page_size=${page_size}  
   ${unessential_params}  create list  userid=${userid}  wash_user_group_id=${wash_user_group_id}  created_section=${created_section}  
   run every case by params  Get admin wash users Fail 403  ${essential_params}  ${unessential_params}



Get wash_user Success 
   [Documentation]  接口名:用户查询${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为  列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  page_num=${page_num}  page_size=${page_size}  
   ${unessential_params}  create list  userid=${userid}  wash_user_group_id=${wash_user_group_id}  created_section=${created_section}  
   run every case by params  Get admin wash users Success 200  ${essential_params}  ${unessential_params}



Get wash_user Fail With Wrong Params
   [Documentation]  接口名:用户查询${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  page_num=${page_num}  page_size=${page_size}  
   ${unessential_params}  create list  userid=${userid}  wash_user_group_id=${wash_user_group_id}  created_section=${created_section}  
   run every case by params  Get admin wash users Fail 422  ${essential_params}  ${unessential_params}



Get wash_user Fail With Wrong Url
   [Documentation]  接口名:用户信息查询${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
    Get wash users userid Fail 404


Get wash_user Fail Without Login
   [Documentation]  接口名:用户信息查询${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
    Get wash users userid Fail 403


Get wash_user Success 
   [Documentation]  接口名:用户信息查询${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 WashUser 列表。
   [Tags]           Respcode:200
    Get wash users userid Success 200


Get wash_user Fail Without Login
   [Documentation]  接口名:微信信息查询${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  userid=${userid}  
   run every case by params  Get admin wechat info Fail 403  ${essential_params}  ${unessential_params}



Get wash_user Success 
   [Documentation]  接口名:微信信息查询${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为  列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  
   ${unessential_params}  create list  userid=${userid}  
   run every case by params  Get admin wechat info Success 200  ${essential_params}  ${unessential_params}



Get wash_user Fail With Wrong Params
   [Documentation]  接口名:微信信息查询${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  userid=${userid}  
   run every case by params  Get admin wechat info Fail 422  ${essential_params}  ${unessential_params}



Patch wash_user By Id Success 
   [Documentation]  接口名:修改用户分组${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create list  wash_user_group_id=${wash_user_group_id}  
   ${unessential_params}  create list  
   run every case by params  Patch admin wash users By Id Success 204  ${essential_params}  ${unessential_params}  userid/wash_user_group=${userid/wash_user_group}



Patch wash_user By Id Fail With Wrong Url
   [Documentation]  接口名:修改用户分组${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  wash_user_group_id=${wash_user_group_id}  
   ${unessential_params}  create list  
   run every case by params  Patch admin wash users By Id Fail 404  ${essential_params}  ${unessential_params}  userid/wash_user_group=${wrong_url_id}



Patch wash_user By Id Fail With Wrong Params
   [Documentation]  接口名:修改用户分组${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  wash_user_group_id=${wash_user_group_id}  
   ${unessential_params}  create list  
   run every case by params  Patch admin wash users By Id Fail 422  ${essential_params}  ${unessential_params}  userid/wash_user_group=${userid/wash_user_group}



Patch wash_user By Id Fail Without Login
   [Documentation]  接口名:修改用户分组${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  wash_user_group_id=${wash_user_group_id}  
   ${unessential_params}  create list  
   run every case by params  Patch admin wash users By Id Fail 403  ${essential_params}  ${unessential_params}  userid/wash_user_group=${userid/wash_user_group}



*** Variables ***
${userid/clear}
${userid/wash_user_group}


*** Keywords ***
Post Admin wash users By Id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  post clear by userid  &{kwargs}
   expect status is 204  ${resp}  

Post Admin wash users By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post clear by userid  &{kwargs}
   expect status is 403  ${resp}  

Post Admin wash users By Id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post clear by userid  &{kwargs}
   expect status is 422  ${resp}  

Post Admin wash users By Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  post clear by userid  &{kwargs}
   expect status is 404  ${resp}  

Get Admin wash users Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin wash users   &{kwargs}
   expect status is 403  ${resp}  

Get Admin wash users Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin wash users   &{kwargs}
   expect status is 200  ${resp}  admin_wash_user/Get_Admin_wash_users_200.json
   ${userid/clear}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][userid/clear]}
   set global variable   ${userid/clear}
   ${userid/wash_user_group}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][userid/wash_user_group]}
   set global variable   ${userid/wash_user_group}

Get Admin wash users Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get admin wash users   &{kwargs}
   expect status is 422  ${resp}  

Get Wash users userid Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  get wash users userid   &{kwargs}
   expect status is 404  ${resp}  

Get Wash users userid Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get wash users userid   &{kwargs}
   expect status is 403  ${resp}  

Get Wash users userid Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get wash users userid   &{kwargs}
   expect status is 200  ${resp}  admin_wash_user/Get_Wash_users_userid_200.json
   ${userid/clear}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][userid/clear]}
   set global variable   ${userid/clear}
   ${userid/wash_user_group}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][userid/wash_user_group]}
   set global variable   ${userid/wash_user_group}

Get Admin wechat info Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin wechat info   &{kwargs}
   expect status is 403  ${resp}  

Get Admin wechat info Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin wechat info   &{kwargs}
   expect status is 200  ${resp}  admin_wash_user/Get_Admin_wechat_info_200.json
   ${userid/clear}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][userid/clear]}
   set global variable   ${userid/clear}
   ${userid/wash_user_group}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][userid/wash_user_group]}
   set global variable   ${userid/wash_user_group}

Get Admin wechat info Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get admin wechat info   &{kwargs}
   expect status is 422  ${resp}  

Patch Admin wash users By Id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  patch wash user group by userid  &{kwargs}
   expect status is 204  ${resp}  

Patch Admin wash users By Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  patch wash user group by userid  &{kwargs}
   expect status is 404  ${resp}  

Patch Admin wash users By Id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  patch wash user group by userid  &{kwargs}
   expect status is 422  ${resp}  

Patch Admin wash users By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch wash user group by userid  &{kwargs}
   expect status is 403  ${resp}  

