*** Settings ***
Documentation  admin_card_record
Resource  ../resources.robot
Library  robot_car_wash_server_library.card_record.CardRecordLibrary
Suite Setup  Login  ${admin_username}   ${admin_password}
Suite Teardown  Logout
Force Tags  model:admin_card_record  虾洗后台


*** Test Cases ***
Get card_record Success 
   [Documentation]  接口名:会员购卡记录${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 CardRecord 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  
   ${unessential_params}  create list  user_id=${user_id}  mobile=${mobile}  mode=${mode}  created_section=${created_section}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get admin card records Success 200  ${essential_params}  ${unessential_params}



Get card_record Fail Without Login
   [Documentation]  接口名:会员购卡记录${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  user_id=${user_id}  mobile=${mobile}  mode=${mode}  created_section=${created_section}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get admin card records Fail 403  ${essential_params}  ${unessential_params}



Get card_record Fail With Wrong Params
   [Documentation]  接口名:会员购卡记录${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  user_id=${user_id}  mobile=${mobile}  mode=${mode}  created_section=${created_section}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get admin card records Fail 422  ${essential_params}  ${unessential_params}



Delete card_record By Id Success 
   [Documentation]  接口名:删除记录${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   Delete admin card records By Id Success 204  card_record_id=${card_record_id}



Delete card_record By Id Fail With Wrong Url
   [Documentation]  接口名:删除记录${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   Delete admin card records By Id Fail 404  card_record_id=${wrong_url_id}



Delete card_record By Id Fail Without Login
   [Documentation]  接口名:删除记录${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Delete admin card records By Id Fail 403  card_record_id=${card_record_id}



*** Variables ***
${card_record_id}


*** Keywords ***
Get Admin card records Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin card records   &{kwargs}
   expect status is 200  ${resp}  admin_card_record/Get_Admin_card_records_200.json
   ${card_record_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][card_record_id]}
   set global variable   ${card_record_id}

Get Admin card records Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin card records   &{kwargs}
   expect status is 403  ${resp}  

Get Admin card records Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get admin card records   &{kwargs}
   expect status is 422  ${resp}  

Delete Admin card records By Id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  delete admin card records by card record id  &{kwargs}
   expect status is 204  ${resp}  

Delete Admin card records By Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  delete admin card records by card record id  &{kwargs}
   expect status is 404  ${resp}  

Delete Admin card records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  delete admin card records by card record id  &{kwargs}
   expect status is 403  ${resp}  

