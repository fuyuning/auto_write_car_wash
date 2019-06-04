*** Settings ***
Documentation  admin_turntable
Resource  ../resources.robot
Library  robot_car_wash_server_library.turntable.TurntableLibrary
Suite Setup  Login  ${username}   ${password}
Suite Teardown  Logout
Force Tags  model:admin_turntable  虾洗后台


*** Test Cases ***
post admin turntables Success 
   [Documentation]  接口名:创建转盘${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 201,返回的Json数据符合验证。
   [Tags]           Respcode:201
   ${essential_params}  create dictionary  name=${name}  wash_user_group_ids=${wash_user_group_ids}  prizes=${Please_input}  enabled=False  status=${status}  
   ${unessential_params}  create dictionary  
   run every case by params   post admin turntables success 201   ${essential_params}  ${unessential_params}

post admin turntables Fail With Wrong Params
   [Documentation]  接口名:创建转盘${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  name=${name_422}  wash_user_group_ids=${wash_user_group_ids_422}  prizes=${Please_input}  enabled=ThisIsRobot!  status=${status_422}  
   ${unessential_params}  create dictionary  
   run every case by params   post admin turntables fail 422   ${essential_params}  ${unessential_params}  success=False

get admin turntables Success 
   [Documentation]  接口名:获取转盘列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 Turntable 列表。
   [Tags]           Respcode:200
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  name=${name}  wash_user_group_id=${wash_user_group_id}  enabled=False  
   run every case by params   get admin turntables success 200   ${essential_params}  ${unessential_params}

get admin turntables Fail With Wrong Params
   [Documentation]  接口名:获取转盘列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  name=${name_422}  wash_user_group_id=${wash_user_group_id_422}  enabled=ThisIsRobot!  
   run every case by params   get admin turntables fail 422   ${essential_params}  ${unessential_params}  success=False

get admin turntables by turntable id Fail With Wrong Url
   [Documentation]  接口名:获取转盘${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   get admin turntables by turntable id fail 404     turntable_id=${wrong_url_id}

get admin turntables by turntable id Success 
   [Documentation]  接口名:获取转盘${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 Turntable 对象。
   [Tags]           Respcode:200
   get admin turntables by turntable id success 200     turntable_id=${turntable_id}

get admin turntable awards Success 
   [Documentation]  接口名:获奖记录${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 TurntableAward 列表。
   [Tags]           Respcode:200
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  turntable_id=${turntable_id}  userid=${userid}  mobile=${mobile}  status=${status}  is_awarded=False  prize_name=${prize_name}  page_num=${page_num}  page_size=${page_size}  
   run every case by params   get admin turntable awards success 200   ${essential_params}  ${unessential_params}

get admin turntable awards Fail With Wrong Params
   [Documentation]  接口名:获奖记录${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  turntable_id=${turntable_id_422}  userid=${userid_422}  mobile=${mobile_422}  status=${status_422}  is_awarded=ThisIsRobot!  prize_name=${prize_name_422}  page_num=${page_num_422}  page_size=${page_size_422}  
   run every case by params   get admin turntable awards fail 422   ${essential_params}  ${unessential_params}  success=False

put admin turntables by turntable id Fail With Wrong Url
   [Documentation]  接口名:修改转盘${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   put admin turntables by turntable id fail 404     turntable_id=${wrong_url_id}  name=${name}  wash_user_group_ids=${wash_user_group_ids}  prizes=${Please_input}  enabled=False  status=${status}    

put admin turntables by turntable id Success 
   [Documentation]  接口名:修改转盘${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create dictionary  name=${name}  wash_user_group_ids=${wash_user_group_ids}  prizes=${Please_input}  enabled=False  status=${status}  
   ${unessential_params}  create dictionary  
   run every case by params   put admin turntables by turntable id success 204   ${essential_params}  ${unessential_params}    turntable_id=${turntable_id}

put admin turntables by turntable id Fail With Wrong Params
   [Documentation]  接口名:修改转盘${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  name=${name_422}  wash_user_group_ids=${wash_user_group_ids_422}  prizes=${Please_input}  enabled=ThisIsRobot!  status=${status_422}  
   ${unessential_params}  create dictionary  
   run every case by params   put admin turntables by turntable id fail 422   ${essential_params}  ${unessential_params}    turntable_id=${turntable_id}  success=False

patch admin turntables enabled by turntable id Fail With Wrong Url
   [Documentation]  接口名:转盘启用/关闭${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   patch admin turntables enabled by turntable id fail 404     turntable_id=${wrong_url_id}  enabled=False    

patch admin turntables enabled by turntable id Success 
   [Documentation]  接口名:转盘启用/关闭${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create dictionary  enabled=False  
   ${unessential_params}  create dictionary  
   run every case by params   patch admin turntables enabled by turntable id success 204   ${essential_params}  ${unessential_params}    turntable_id=${turntable_id}

patch admin turntables enabled by turntable id Fail With Wrong Params
   [Documentation]  接口名:转盘启用/关闭${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  enabled=ThisIsRobot!  
   ${unessential_params}  create dictionary  
   run every case by params   patch admin turntables enabled by turntable id fail 422   ${essential_params}  ${unessential_params}    turntable_id=${turntable_id}  success=False

delete admin turntables by turntable id Fail With Wrong Url
   [Documentation]  接口名:转盘删除${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   delete admin turntables by turntable id fail 404     turntable_id=${wrong_url_id}

delete admin turntables by turntable id Success 
   [Documentation]  接口名:转盘删除${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   delete admin turntables by turntable id success 204     turntable_id=${turntable_id}


*** Variables ***
${turntable_id}  


*** Keywords ***
post admin turntables Success 201
   [Arguments]  &{kwargs}
   ${resp}=  post admin turntables  &{kwargs}
   expect status is 201  ${resp}  admin_turntable/post_admin_turntables_201.json
   ${turntable_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0]['turntable_id']}
   set global variable   ${turntable_id}

post admin turntables Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post admin turntables  &{kwargs}
   expect status is 422  ${resp}  

get admin turntables Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin turntables  &{kwargs}
   expect status is 200  ${resp}  admin_turntable/get_admin_turntables_200.json
   ${turntable_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0]['turntable_id']}
   set global variable   ${turntable_id}

get admin turntables Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get admin turntables  &{kwargs}
   expect status is 422  ${resp}  

get admin turntables by turntable id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  get admin turntables by turntable id  &{kwargs}
   expect status is 404  ${resp}  

get admin turntables by turntable id Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin turntables by turntable id  &{kwargs}
   expect status is 200  ${resp}  admin_turntable/get_admin_turntables_by_turntable_id_200.json
   ${turntable_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0]['turntable_id']}
   set global variable   ${turntable_id}

get admin turntable awards Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin turntable awards  &{kwargs}
   expect status is 200  ${resp}  admin_turntable/get_admin_turntable_awards_200.json
   ${turntable_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0]['turntable_id']}
   set global variable   ${turntable_id}

get admin turntable awards Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get admin turntable awards  &{kwargs}
   expect status is 422  ${resp}  

put admin turntables by turntable id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  put admin turntables by turntable id  &{kwargs}
   expect status is 404  ${resp}  

put admin turntables by turntable id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  put admin turntables by turntable id  &{kwargs}
   expect status is 204  ${resp}  

put admin turntables by turntable id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  put admin turntables by turntable id  &{kwargs}
   expect status is 422  ${resp}  

patch admin turntables enabled by turntable id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  patch admin turntables enabled by turntable id  &{kwargs}
   expect status is 404  ${resp}  

patch admin turntables enabled by turntable id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  patch admin turntables enabled by turntable id  &{kwargs}
   expect status is 204  ${resp}  

patch admin turntables enabled by turntable id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  patch admin turntables enabled by turntable id  &{kwargs}
   expect status is 422  ${resp}  

delete admin turntables by turntable id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  delete admin turntables by turntable id  &{kwargs}
   expect status is 404  ${resp}  

delete admin turntables by turntable id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  delete admin turntables by turntable id  &{kwargs}
   expect status is 204  ${resp}  

