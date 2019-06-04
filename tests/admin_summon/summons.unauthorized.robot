*** Settings ***
Documentation  admin_summon
Resource  ../resources.robot
Library  robot_car_wash_server_library.summon.SummonLibrary
Force Tags  model:admin_summon  虾洗后台


*** Test Cases ***
get admin summons Fail Without Login
   [Documentation]  接口名:获取召唤虾洗列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get admin summons fail 403     name=${name}  created_section=${created_section}  page_num=${page_num}  page_size=${page_size}  

delete admin summons by summon id Fail Without Login
   [Documentation]  接口名:删除召唤虾洗记录${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   delete admin summons by summon id fail 403     summon_id=${summon_id}


*** Variables ***
${summon_id}  1a2b3c4d5e6f7zz


*** Keywords ***
get admin summons Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin summons  &{kwargs}
   expect status is 403  ${resp}  

delete admin summons by summon id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  delete admin summons by summon id  &{kwargs}
   expect status is 403  ${resp}  

