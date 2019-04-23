*** Settings ***
Documentation  admin_turntable
Resource  ../resources.robot
Library  robot_car_wash_server_library.turntable.TurntableLibrary
Suite Setup  Login  ${admin_username}   ${admin_password}
Suite Teardown  Logout
Force Tags  model:admin_turntable  虾洗后台


*** Test Cases ***
Post turntable Fail Without Login
   [Documentation]  接口名:创建转盘${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  name=${name}  wash_user_group_ids=${wash_user_group_ids}  prizes=${Please_input}  enabled=False  
   ${unessential_params}  create list  
   run every case by params  Post admin turntables Fail 403  ${essential_params}  ${unessential_params}



Post turntable Success 
   [Documentation]  接口名:创建转盘${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 201,返回的Json数据符合验证。
   [Tags]           Respcode:201
   ${essential_params}  create list  name=${name}  wash_user_group_ids=${wash_user_group_ids}  prizes=${Please_input}  enabled=False  
   ${unessential_params}  create list  
   run every case by params  Post admin turntables Success 201  ${essential_params}  ${unessential_params}



Post turntable Fail With Wrong Params
   [Documentation]  接口名:创建转盘${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  name=${name}  wash_user_group_ids=${wash_user_group_ids}  prizes=${Please_input}  enabled=False  
   ${unessential_params}  create list  
   run every case by params  Post admin turntables Fail 422  ${essential_params}  ${unessential_params}



Get turntable Fail Without Login
   [Documentation]  接口名:获取转盘列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  name=${name}  wash_user_group_id=${wash_user_group_id}  enabled=False  
   run every case by params  Get admin turntables Fail 403  ${essential_params}  ${unessential_params}



Get turntable Success 
   [Documentation]  接口名:获取转盘列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 Turntable 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  
   ${unessential_params}  create list  name=${name}  wash_user_group_id=${wash_user_group_id}  enabled=False  
   run every case by params  Get admin turntables Success 200  ${essential_params}  ${unessential_params}



Get turntable Fail With Wrong Params
   [Documentation]  接口名:获取转盘列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  name=${name}  wash_user_group_id=${wash_user_group_id}  enabled=False  
   run every case by params  Get admin turntables Fail 422  ${essential_params}  ${unessential_params}



Get turntable By Id Fail Without Login
   [Documentation]  接口名:获取转盘${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Get admin turntables By Id Fail 403  turntable_id=${turntable_id}



Get turntable By Id Fail With Wrong Url
   [Documentation]  接口名:获取转盘${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   Get admin turntables By Id Fail 404  turntable_id=${wrong_url_id}



Get turntable By Id Success 
   [Documentation]  接口名:获取转盘${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 Turntable 对象。
   [Tags]           Respcode:200
   Get admin turntables By Id Success 200  turntable_id=${turntable_id}



Get turntable Fail Without Login
   [Documentation]  接口名:获奖记录${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  turntable_id=${turntable_id}  userid=${userid}  mobile=${mobile}  status=${status}  is_awarded=False  prize_name=${prize_name}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get admin turntable awards Fail 403  ${essential_params}  ${unessential_params}



Get turntable Success 
   [Documentation]  接口名:获奖记录${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 TurntableAward 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  
   ${unessential_params}  create list  turntable_id=${turntable_id}  userid=${userid}  mobile=${mobile}  status=${status}  is_awarded=False  prize_name=${prize_name}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get admin turntable awards Success 200  ${essential_params}  ${unessential_params}



Get turntable Fail With Wrong Params
   [Documentation]  接口名:获奖记录${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  turntable_id=${turntable_id}  userid=${userid}  mobile=${mobile}  status=${status}  is_awarded=False  prize_name=${prize_name}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get admin turntable awards Fail 422  ${essential_params}  ${unessential_params}



Put turntable By Id Fail Without Login
   [Documentation]  接口名:修改转盘${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  name=${name}  wash_user_group_ids=${wash_user_group_ids}  prizes=${Please_input}  enabled=False  
   ${unessential_params}  create list  
   run every case by params  Put admin turntables By Id Fail 403  ${essential_params}  ${unessential_params}  turntable_id=${turntable_id}



Put turntable By Id Fail With Wrong Url
   [Documentation]  接口名:修改转盘${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  name=${name}  wash_user_group_ids=${wash_user_group_ids}  prizes=${Please_input}  enabled=False  
   ${unessential_params}  create list  
   run every case by params  Put admin turntables By Id Fail 404  ${essential_params}  ${unessential_params}  turntable_id=${wrong_url_id}



Put turntable By Id Success 
   [Documentation]  接口名:修改转盘${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create list  name=${name}  wash_user_group_ids=${wash_user_group_ids}  prizes=${Please_input}  enabled=False  
   ${unessential_params}  create list  
   run every case by params  Put admin turntables By Id Success 204  ${essential_params}  ${unessential_params}  turntable_id=${turntable_id}



Put turntable By Id Fail With Wrong Params
   [Documentation]  接口名:修改转盘${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  name=${name}  wash_user_group_ids=${wash_user_group_ids}  prizes=${Please_input}  enabled=False  
   ${unessential_params}  create list  
   run every case by params  Put admin turntables By Id Fail 422  ${essential_params}  ${unessential_params}  turntable_id=${turntable_id}



Patch turntable By Id Fail Without Login
   [Documentation]  接口名:转盘启用/关闭${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  enabled=False  
   ${unessential_params}  create list  
   run every case by params  Patch admin turntables By Id Fail 403  ${essential_params}  ${unessential_params}  turntable_id/enabled=${turntable_id/enabled}



Patch turntable By Id Fail With Wrong Url
   [Documentation]  接口名:转盘启用/关闭${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  enabled=False  
   ${unessential_params}  create list  
   run every case by params  Patch admin turntables By Id Fail 404  ${essential_params}  ${unessential_params}  turntable_id/enabled=${wrong_url_id}



Patch turntable By Id Success 
   [Documentation]  接口名:转盘启用/关闭${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create list  enabled=False  
   ${unessential_params}  create list  
   run every case by params  Patch admin turntables By Id Success 204  ${essential_params}  ${unessential_params}  turntable_id/enabled=${turntable_id/enabled}



Patch turntable By Id Fail With Wrong Params
   [Documentation]  接口名:转盘启用/关闭${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  enabled=False  
   ${unessential_params}  create list  
   run every case by params  Patch admin turntables By Id Fail 422  ${essential_params}  ${unessential_params}  turntable_id/enabled=${turntable_id/enabled}



Delete turntable By Id Fail Without Login
   [Documentation]  接口名:转盘删除${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Delete admin turntables By Id Fail 403  turntable_id=${turntable_id}



Delete turntable By Id Fail With Wrong Url
   [Documentation]  接口名:转盘删除${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   Delete admin turntables By Id Fail 404  turntable_id=${wrong_url_id}



Delete turntable By Id Success 
   [Documentation]  接口名:转盘删除${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   Delete admin turntables By Id Success 204  turntable_id=${turntable_id}



Delete turntable By Id Fail With Wrong Params
   [Documentation]  接口名:转盘删除${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   Delete admin turntables By Id Fail 422  turntable_id=${turntable_id}



*** Variables ***
${turntable_id}
${turntable_id/enabled}


*** Keywords ***
Post Admin turntables Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post admin turntables   &{kwargs}
   expect status is 403  ${resp}  

Post Admin turntables Success 201
   [Arguments]  &{kwargs}
   ${resp}=  post admin turntables   &{kwargs}
   expect status is 201  ${resp}  admin_turntable/Post_Admin_turntables_201.json
   ${turntable_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][turntable_id]}
   set global variable   ${turntable_id}
   ${turntable_id/enabled}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][turntable_id/enabled]}
   set global variable   ${turntable_id/enabled}

Post Admin turntables Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post admin turntables   &{kwargs}
   expect status is 422  ${resp}  

Get Admin turntables Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin turntables   &{kwargs}
   expect status is 403  ${resp}  

Get Admin turntables Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin turntables   &{kwargs}
   expect status is 200  ${resp}  admin_turntable/Get_Admin_turntables_200.json
   ${turntable_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][turntable_id]}
   set global variable   ${turntable_id}
   ${turntable_id/enabled}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][turntable_id/enabled]}
   set global variable   ${turntable_id/enabled}

Get Admin turntables Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get admin turntables   &{kwargs}
   expect status is 422  ${resp}  

Get Admin turntables By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin turntables by turntable id  &{kwargs}
   expect status is 403  ${resp}  

Get Admin turntables By Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  get admin turntables by turntable id  &{kwargs}
   expect status is 404  ${resp}  

Get Admin turntables By Id Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin turntables by turntable id  &{kwargs}
   expect status is 200  ${resp}  admin_turntable/Get_Admin_turntables_By_Id_200.json
   ${turntable_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][turntable_id]}
   set global variable   ${turntable_id}
   ${turntable_id/enabled}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][turntable_id/enabled]}
   set global variable   ${turntable_id/enabled}

Get Admin turntable awards Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin turntable awards   &{kwargs}
   expect status is 403  ${resp}  

Get Admin turntable awards Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin turntable awards   &{kwargs}
   expect status is 200  ${resp}  admin_turntable/Get_Admin_turntable_awards_200.json
   ${turntable_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][turntable_id]}
   set global variable   ${turntable_id}
   ${turntable_id/enabled}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][turntable_id/enabled]}
   set global variable   ${turntable_id/enabled}

Get Admin turntable awards Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get admin turntable awards   &{kwargs}
   expect status is 422  ${resp}  

Put Admin turntables By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  put admin turntables by turntable id  &{kwargs}
   expect status is 403  ${resp}  

Put Admin turntables By Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  put admin turntables by turntable id  &{kwargs}
   expect status is 404  ${resp}  

Put Admin turntables By Id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  put admin turntables by turntable id  &{kwargs}
   expect status is 204  ${resp}  

Put Admin turntables By Id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  put admin turntables by turntable id  &{kwargs}
   expect status is 422  ${resp}  

Patch Admin turntables By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch enabled by turntable id  &{kwargs}
   expect status is 403  ${resp}  

Patch Admin turntables By Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  patch enabled by turntable id  &{kwargs}
   expect status is 404  ${resp}  

Patch Admin turntables By Id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  patch enabled by turntable id  &{kwargs}
   expect status is 204  ${resp}  

Patch Admin turntables By Id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  patch enabled by turntable id  &{kwargs}
   expect status is 422  ${resp}  

Delete Admin turntables By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  delete admin turntables by turntable id  &{kwargs}
   expect status is 403  ${resp}  

Delete Admin turntables By Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  delete admin turntables by turntable id  &{kwargs}
   expect status is 404  ${resp}  

Delete Admin turntables By Id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  delete admin turntables by turntable id  &{kwargs}
   expect status is 204  ${resp}  

Delete Admin turntables By Id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  delete admin turntables by turntable id  &{kwargs}
   expect status is 422  ${resp}  

