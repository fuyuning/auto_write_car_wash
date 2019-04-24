*** Settings ***
Documentation  admin_card_record
Resource  ../resources.robot
Library  robot_car_wash_server_library.card_record.CardRecordLibrary
Force Tags  model:admin_card_record  虾洗后台


Get Admin Card Records Fail Without Login
   [Documentation]  接口名:会员购卡记录${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  user_id=${user_id}  mobile=${mobile}  mode=${mode}  created_section=${created_section}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get Admin Card Records Fail 403  ${essential_params}  ${unessential_params}

Delete Admin Card Records By Card Record Id Fail Without Login
   [Documentation]  接口名:删除记录${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Delete Admin Card Records By Card Record Id Fail 403  card_record_id=${card_record_id}

Get Admin Card Records Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Card Records   &{kwargs}
   expect status is 403  ${resp}  

Delete Admin Card Records By Card Record Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Delete Admin Card Records By Card Record Id   &{kwargs}
   expect status is 403  ${resp}  

