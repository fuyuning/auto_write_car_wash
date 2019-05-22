*** Settings ***
Documentation  admin_card_record
Resource  ../resources.robot
Library  robot_car_wash_server_library.card_record.CardRecordLibrary
Force Tags  model:admin_card_record  虾洗后台


*** Test Cases ***
get admin card records Fail Without Login
   [Documentation]  接口名:会员购卡记录${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  user_id=${user_id}  mobile=${mobile}  mode=${mode}  created_section=${created_section}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  get admin card records Fail 403  ${essential_params}  ${unessential_params}

delete admin card records by card record id Fail Without Login
   [Documentation]  接口名:删除记录${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   delete admin card records by card record id Fail 403    card_record_id=${card_record_id}


*** Variables ***
${card_record_id}  12345678909876543


*** Keywords ***
get admin card records Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin card records  &{kwargs}
   expect status is 403  ${resp}  

delete admin card records by card record id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  delete admin card records by card record id  &{kwargs}
   expect status is 403  ${resp}  

