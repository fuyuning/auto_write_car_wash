*** Settings ***
Documentation  admin_turntable
Resource  ../resources.robot
Library  robot_car_wash_server_library.turntable.TurntableLibrary
Suite Setup  Login  ${admin_username}   ${admin_password}
Suite Teardown  Logout
Force Tags  model:admin_turntable  虾洗后台


*** Test Cases ***
Post Admin Turntables Success 
   [Documentation]  接口名:创建转盘${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 201,返回的Json数据符合验证。
   [Tags]           Respcode:201
   ${essential_params}  create list  name=${name}  wash_user_group_ids=${wash_user_group_ids}  prizes=${Please_input}  enabled=False  
   ${unessential_params}  create list  
   run every case by params  Post Admin Turntables Success 201  ${essential_params}  ${unessential_params}

Post Admin Turntables Fail With Wrong Params
   [Documentation]  接口名:创建转盘${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  name=${name}  wash_user_group_ids=${wash_user_group_ids}  prizes=${Please_input}  enabled=False  
   ${unessential_params}  create list  
   run every case by params  Post Admin Turntables Fail 422  ${essential_params}  ${unessential_params}

Get Admin Turntables Success 
   [Documentation]  接口名:获取转盘列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 Turntable 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  
   ${unessential_params}  create list  name=${name}  wash_user_group_id=${wash_user_group_id}  enabled=False  
   run every case by params  Get Admin Turntables Success 200  ${essential_params}  ${unessential_params}

Get Admin Turntables Fail With Wrong Params
   [Documentation]  接口名:获取转盘列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  name=${name}  wash_user_group_id=${wash_user_group_id}  enabled=False  
   run every case by params  Get Admin Turntables Fail 422  ${essential_params}  ${unessential_params}

Get Admin Turntables By Turntable Id Fail With Wrong Url
   [Documentation]  接口名:获取转盘${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   Get Admin Turntables By Turntable Id Fail 404  turntable_id=${wrong_url_id}

Get Admin Turntables By Turntable Id Success 
   [Documentation]  接口名:获取转盘${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 Turntable 对象。
   [Tags]           Respcode:200
   Get Admin Turntables By Turntable Id Success 200  turntable_id=${turntable_id}

Get Admin Turntable Awards Success 
   [Documentation]  接口名:获奖记录${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 TurntableAward 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  
   ${unessential_params}  create list  turntable_id=${turntable_id}  userid=${userid}  mobile=${mobile}  status=${status}  is_awarded=False  prize_name=${prize_name}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get Admin Turntable Awards Success 200  ${essential_params}  ${unessential_params}

Get Admin Turntable Awards Fail With Wrong Params
   [Documentation]  接口名:获奖记录${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  turntable_id=${turntable_id}  userid=${userid}  mobile=${mobile}  status=${status}  is_awarded=False  prize_name=${prize_name}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get Admin Turntable Awards Fail 422  ${essential_params}  ${unessential_params}

Put Admin Turntables By Turntable Id Fail With Wrong Url
   [Documentation]  接口名:修改转盘${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  name=${name}  wash_user_group_ids=${wash_user_group_ids}  prizes=${Please_input}  enabled=False  
   ${unessential_params}  create list  
   run every case by params  Put Admin Turntables By Turntable Id Fail 404  ${essential_params}  ${unessential_params}  turntable_id=${wrong_url_id}

Put Admin Turntables By Turntable Id Success 
   [Documentation]  接口名:修改转盘${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create list  name=${name}  wash_user_group_ids=${wash_user_group_ids}  prizes=${Please_input}  enabled=False  
   ${unessential_params}  create list  
   run every case by params  Put Admin Turntables By Turntable Id Success 204  ${essential_params}  ${unessential_params}  turntable_id=${turntable_id}

Put Admin Turntables By Turntable Id Fail With Wrong Params
   [Documentation]  接口名:修改转盘${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  name=${name}  wash_user_group_ids=${wash_user_group_ids}  prizes=${Please_input}  enabled=False  
   ${unessential_params}  create list  
   run every case by params  Put Admin Turntables By Turntable Id Fail 422  ${essential_params}  ${unessential_params}  turntable_id=${turntable_id}

Patch Enabled By Turntable Id Fail With Wrong Url
   [Documentation]  接口名:转盘启用/关闭${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  enabled=False  
   ${unessential_params}  create list  
   run every case by params  Patch Enabled By Turntable Id Fail 404  ${essential_params}  ${unessential_params}  turntable_id/enabled=${wrong_url_id}

Patch Enabled By Turntable Id Success 
   [Documentation]  接口名:转盘启用/关闭${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create list  enabled=False  
   ${unessential_params}  create list  
   run every case by params  Patch Enabled By Turntable Id Success 204  ${essential_params}  ${unessential_params}  turntable_id/enabled=${turntable_id/enabled}

Patch Enabled By Turntable Id Fail With Wrong Params
   [Documentation]  接口名:转盘启用/关闭${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  enabled=False  
   ${unessential_params}  create list  
   run every case by params  Patch Enabled By Turntable Id Fail 422  ${essential_params}  ${unessential_params}  turntable_id/enabled=${turntable_id/enabled}

Delete Admin Turntables By Turntable Id Fail With Wrong Url
   [Documentation]  接口名:转盘删除${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   Delete Admin Turntables By Turntable Id Fail 404  turntable_id=${wrong_url_id}

Delete Admin Turntables By Turntable Id Success 
   [Documentation]  接口名:转盘删除${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   Delete Admin Turntables By Turntable Id Success 204  turntable_id=${turntable_id}

Delete Admin Turntables By Turntable Id Fail With Wrong Params
   [Documentation]  接口名:转盘删除${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   Delete Admin Turntables By Turntable Id Fail 422  turntable_id=${turntable_id}


*** Variables ***
${turntable_id}
${turntable_id/enabled}


*** Keywords ***
Post Admin Turntables Success 201
   [Arguments]  &{kwargs}
   ${resp}=  Post Admin Turntables   &{kwargs}
   expect status is 201  ${resp}  admin_turntable/Post_Admin_Turntables_201.json
   ${turntable_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][turntable_id]}
   set global variable   ${turntable_id}
   ${turntable_id/enabled}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][turntable_id/enabled]}
   set global variable   ${turntable_id/enabled}

Post Admin Turntables Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Post Admin Turntables   &{kwargs}
   expect status is 422  ${resp}  

Get Admin Turntables Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Turntables   &{kwargs}
   expect status is 200  ${resp}  admin_turntable/Get_Admin_Turntables_200.json
   ${turntable_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][turntable_id]}
   set global variable   ${turntable_id}
   ${turntable_id/enabled}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][turntable_id/enabled]}
   set global variable   ${turntable_id/enabled}

Get Admin Turntables Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Turntables   &{kwargs}
   expect status is 422  ${resp}  

Get Admin Turntables By Turntable Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Turntables By Turntable Id   &{kwargs}
   expect status is 404  ${resp}  

Get Admin Turntables By Turntable Id Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Turntables By Turntable Id   &{kwargs}
   expect status is 200  ${resp}  admin_turntable/Get_Admin_Turntables_By_Turntable_Id_200.json
   ${turntable_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][turntable_id]}
   set global variable   ${turntable_id}
   ${turntable_id/enabled}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][turntable_id/enabled]}
   set global variable   ${turntable_id/enabled}

Get Admin Turntable Awards Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Turntable Awards   &{kwargs}
   expect status is 200  ${resp}  admin_turntable/Get_Admin_Turntable_Awards_200.json
   ${turntable_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][turntable_id]}
   set global variable   ${turntable_id}
   ${turntable_id/enabled}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][turntable_id/enabled]}
   set global variable   ${turntable_id/enabled}

Get Admin Turntable Awards Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Turntable Awards   &{kwargs}
   expect status is 422  ${resp}  

Put Admin Turntables By Turntable Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  Put Admin Turntables By Turntable Id   &{kwargs}
   expect status is 404  ${resp}  

Put Admin Turntables By Turntable Id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  Put Admin Turntables By Turntable Id   &{kwargs}
   expect status is 204  ${resp}  

Put Admin Turntables By Turntable Id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Put Admin Turntables By Turntable Id   &{kwargs}
   expect status is 422  ${resp}  

Patch Enabled By Turntable Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  Patch Enabled By Turntable Id   &{kwargs}
   expect status is 404  ${resp}  

Patch Enabled By Turntable Id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  Patch Enabled By Turntable Id   &{kwargs}
   expect status is 204  ${resp}  

Patch Enabled By Turntable Id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Patch Enabled By Turntable Id   &{kwargs}
   expect status is 422  ${resp}  

Delete Admin Turntables By Turntable Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  Delete Admin Turntables By Turntable Id   &{kwargs}
   expect status is 404  ${resp}  

Delete Admin Turntables By Turntable Id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  Delete Admin Turntables By Turntable Id   &{kwargs}
   expect status is 204  ${resp}  

Delete Admin Turntables By Turntable Id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Delete Admin Turntables By Turntable Id   &{kwargs}
   expect status is 422  ${resp}  

