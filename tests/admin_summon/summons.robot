*** Settings ***
Documentation  admin_summon
Resource  ../resources.robot
Library  robot_car_wash_server_library.summon.SummonLibrary
Suite Setup  Login  ${username}   ${password}
Suite Teardown  Logout
Force Tags  model:admin_summon  虾洗后台


*** Test Cases ***
get admin summons Success 
   [Documentation]  接口名:获取召唤虾洗列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 Summon 列表。
   [Tags]           Respcode:200
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  name=${name}  created_section=${created_section}  page_num=${page_num}  page_size=${page_size}  
   run every case by params   get admin summons success 200   ${essential_params}  ${unessential_params}

get admin summons Fail With Wrong Params
   [Documentation]  接口名:获取召唤虾洗列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  name=${name_422}  created_section=${created_section_422}  page_num=${page_num_422}  page_size=${page_size_422}  
   run every case by params   get admin summons fail 422   ${essential_params}  ${unessential_params}  success=False

delete admin summons by summon id Fail With Wrong Url
   [Documentation]  接口名:删除召唤虾洗记录${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   delete admin summons by summon id fail 404     summon_id=${wrong_url_id}

delete admin summons by summon id Success 
   [Documentation]  接口名:删除召唤虾洗记录${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   delete admin summons by summon id success 204     summon_id=${summon_id}


*** Variables ***
${summon_id}  


*** Keywords ***
get admin summons Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin summons  &{kwargs}
   expect status is 200  ${resp}  admin_summon/get_admin_summons_200.json
   ${summon_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0]['summon_id']}
   set global variable   ${summon_id}

get admin summons Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get admin summons  &{kwargs}
   expect status is 422  ${resp}  

delete admin summons by summon id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  delete admin summons by summon id  &{kwargs}
   expect status is 404  ${resp}  

delete admin summons by summon id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  delete admin summons by summon id  &{kwargs}
   expect status is 204  ${resp}  

