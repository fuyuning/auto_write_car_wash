*** Settings ***
Documentation  admin_card_record
Resource  ../resources.robot
Library  robot_car_wash_server_library.card_record.CardRecordLibrary
Suite Setup  Login  ${admin_username}   ${admin_password}
Suite Teardown  Logout
Force Tags  model:admin_card_record  虾洗后台


*** Test Cases ***
get admin card records Success 
   [Documentation]  接口名:会员购卡记录${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 CardRecord 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  
   ${unessential_params}  create list  user_id=${user_id}  mobile=${mobile}  mode=${mode}  created_section=${created_section}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  get admin card records Success 200  ${essential_params}  ${unessential_params}

get admin card records Fail With Wrong Params
   [Documentation]  接口名:会员购卡记录${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  user_id=${user_id_422}  mobile=${mobile_422}  mode=${mode_422}  created_section=${created_section_422}  page_num=${page_num_422}  page_size=${page_size_422}  
   run every case by params  get admin card records Fail 422  ${essential_params}  ${unessential_params}  success=False

delete admin card records by card record id Fail With Wrong Url
   [Documentation]  接口名:删除记录${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   delete admin card records by card record id Fail 404    card_record_id=${w}

delete admin card records by card record id Success 
   [Documentation]  接口名:删除记录${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   delete admin card records by card record id Success 204    card_record_id=${card_record_id}


*** Variables ***
${card_record_id}  


*** Keywords ***
get admin card records Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin card records  &{kwargs}
   expect status is 200  ${resp}  admin_card_record/get_admin_card_records_200.json
   ${card_record_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][card_record_id]}
   set global variable   ${card_record_id}

get admin card records Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get admin card records  &{kwargs}
   expect status is 422  ${resp}  

delete admin card records by card record id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  delete admin card records by card record id  &{kwargs}
   expect status is 404  ${resp}  

delete admin card records by card record id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  delete admin card records by card record id  &{kwargs}
   expect status is 204  ${resp}  

