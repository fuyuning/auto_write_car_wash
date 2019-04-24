*** Settings ***
Documentation  admin_summon
Resource  ../resources.robot
Library  robot_car_wash_server_library.summon.SummonLibrary
Force Tags  model:admin_summon  虾洗后台


*** Test Cases ***
Get Admin Summons Fail Without Login
   [Documentation]  接口名:获取召唤虾洗列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  name=${name}  created_section=${created_section}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get Admin Summons Fail 403  ${essential_params}  ${unessential_params}

Delete Admin Summons By Summon Id Fail Without Login
   [Documentation]  接口名:删除召唤虾洗记录${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Delete Admin Summons By Summon Id Fail 403  summon_id=${summon_id}


*** Variables ***
${summon_id}  12345678909876543


*** Keywords ***
Get Admin Summons Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Summons   &{kwargs}
   expect status is 403  ${resp}  

Delete Admin Summons By Summon Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Delete Admin Summons By Summon Id   &{kwargs}
   expect status is 403  ${resp}  

