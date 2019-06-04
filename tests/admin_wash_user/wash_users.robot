*** Settings ***
Documentation  admin_wash_user
Resource  ../resources.robot
Library  robot_car_wash_server_library.wash_user.WashUserLibrary
Suite Setup  Login  ${username}   ${password}
Suite Teardown  Logout
Force Tags  model:admin_wash_user  虾洗后台


*** Test Cases ***
post admin wash users clear by userid Success 
   [Documentation]  接口名:用户数据清除${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create dictionary  mobile=${mobile}  
   ${unessential_params}  create dictionary  
   run every case by params   post admin wash users clear by userid success 204   ${essential_params}  ${unessential_params}    userid=${userid}

post admin wash users clear by userid Fail With Wrong Url
   [Documentation]  接口名:用户数据清除${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   post admin wash users clear by userid fail 404     userid=${wrong_url_id}  mobile=${mobile}    

post admin wash users clear by userid Fail With Wrong Params
   [Documentation]  接口名:用户数据清除${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  mobile=${mobile_422}  
   ${unessential_params}  create dictionary  
   run every case by params   post admin wash users clear by userid fail 422   ${essential_params}  ${unessential_params}    userid=${userid}  success=False

get admin wash users Success 
   [Documentation]  接口名:用户查询${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为  列表。
   [Tags]           Respcode:200
   ${essential_params}  create dictionary  page_num=${page_num}  page_size=${page_size}  
   ${unessential_params}  create dictionary  userid=${userid}  wash_user_group_id=${wash_user_group_id}  created_section=${created_section}  
   run every case by params   get admin wash users success 200   ${essential_params}  ${unessential_params}

get admin wash users Fail With Wrong Params
   [Documentation]  接口名:用户查询${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  page_num=${page_num_422}  page_size=${page_size_422}  
   ${unessential_params}  create dictionary  userid=${userid_422}  wash_user_group_id=${wash_user_group_id_422}  created_section=${created_section_422}  
   run every case by params   get admin wash users fail 422   ${essential_params}  ${unessential_params}  success=False

get admin wash users userid Success 
   [Documentation]  接口名:用户信息查询${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 WashUser 列表。
   [Tags]           Respcode:200
    get admin wash users userid success 200

get admin wechat info Success 
   [Documentation]  接口名:微信信息查询${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为  列表。
   [Tags]           Respcode:200
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  userid=${userid}  
   run every case by params   get admin wechat info success 200   ${essential_params}  ${unessential_params}

get admin wechat info Fail With Wrong Params
   [Documentation]  接口名:微信信息查询${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  userid=${userid_422}  
   run every case by params   get admin wechat info fail 422   ${essential_params}  ${unessential_params}  success=False

patch admin wash users wash user group by userid Fail With Wrong Url
   [Documentation]  接口名:修改用户分组${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   patch admin wash users wash user group by userid fail 404     userid=${wrong_url_id}  wash_user_group_id=${wash_user_group_id}    

patch admin wash users wash user group by userid Fail With Wrong Params
   [Documentation]  接口名:修改用户分组${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  wash_user_group_id=${wash_user_group_id_422}  
   ${unessential_params}  create dictionary  
   run every case by params   patch admin wash users wash user group by userid fail 422   ${essential_params}  ${unessential_params}    userid=${userid}  success=False

patch admin wash users wash user group by userid Success 
   [Documentation]  接口名:修改用户分组${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create dictionary  wash_user_group_id=${wash_user_group_id}  
   ${unessential_params}  create dictionary  
   run every case by params   patch admin wash users wash user group by userid success 204   ${essential_params}  ${unessential_params}    userid=${userid}


*** Variables ***
${userid}  


*** Keywords ***
post admin wash users clear by userid Success 204
   [Arguments]  &{kwargs}
   ${resp}=  post admin wash users clear by userid  &{kwargs}
   expect status is 204  ${resp}  

post admin wash users clear by userid Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  post admin wash users clear by userid  &{kwargs}
   expect status is 404  ${resp}  

post admin wash users clear by userid Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post admin wash users clear by userid  &{kwargs}
   expect status is 422  ${resp}  

get admin wash users Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin wash users  &{kwargs}
   expect status is 200  ${resp}  admin_wash_user/get_admin_wash_users_200.json
   ${userid}  set variable if  ${resp.json()}!=[]  ${resp.json()[0]['userid']}
   set global variable   ${userid}

get admin wash users Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get admin wash users  &{kwargs}
   expect status is 422  ${resp}  

get admin wash users userid Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin wash users userid  &{kwargs}
   expect status is 200  ${resp}  admin_wash_user/get_admin_wash_users_userid_200.json
   ${userid}  set variable if  ${resp.json()}!=[]  ${resp.json()[0]['userid']}
   set global variable   ${userid}

get admin wechat info Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin wechat info  &{kwargs}
   expect status is 200  ${resp}  admin_wash_user/get_admin_wechat_info_200.json
   ${userid}  set variable if  ${resp.json()}!=[]  ${resp.json()[0]['userid']}
   set global variable   ${userid}

get admin wechat info Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get admin wechat info  &{kwargs}
   expect status is 422  ${resp}  

patch admin wash users wash user group by userid Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  patch admin wash users wash user group by userid  &{kwargs}
   expect status is 404  ${resp}  

patch admin wash users wash user group by userid Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  patch admin wash users wash user group by userid  &{kwargs}
   expect status is 422  ${resp}  

patch admin wash users wash user group by userid Success 204
   [Arguments]  &{kwargs}
   ${resp}=  patch admin wash users wash user group by userid  &{kwargs}
   expect status is 204  ${resp}  

