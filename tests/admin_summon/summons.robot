*** Settings ***
Documentation  admin_summon
Resource  ../resources.robot
Library  robot_car_wash_server_library.summon.SummonLibrary
Suite Setup  Login  ${admin_username}   ${admin_password}
Suite Teardown  Logout
Force Tags  model:admin_summon  虾洗后台


*** Test Cases ***
Get Admin Summons Success 
   [Documentation]  接口名:获取召唤虾洗列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 Summon 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  
   ${unessential_params}  create list  name=${name}  created_section=${created_section}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get Admin Summons Success 200  ${essential_params}  ${unessential_params}

Get Admin Summons Fail With Wrong Params
   [Documentation]  接口名:获取召唤虾洗列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  name=${name}  created_section=${created_section}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get Admin Summons Fail 422  ${essential_params}  ${unessential_params}

Delete Admin Summons By Summon Id Success 
   [Documentation]  接口名:删除召唤虾洗记录${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   Delete Admin Summons By Summon Id Success 204  summon_id=${summon_id}

Delete Admin Summons By Summon Id Fail With Wrong Url
   [Documentation]  接口名:删除召唤虾洗记录${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   Delete Admin Summons By Summon Id Fail 404  summon_id=${wrong_url_id}


*** Variables ***
${summon_id}


*** Keywords ***
Get Admin Summons Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Summons   &{kwargs}
   expect status is 200  ${resp}  admin_summon/Get_Admin_Summons_200.json
   ${summon_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][summon_id]}
   set global variable   ${summon_id}

Get Admin Summons Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Summons   &{kwargs}
   expect status is 422  ${resp}  

Delete Admin Summons By Summon Id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  Delete Admin Summons By Summon Id   &{kwargs}
   expect status is 204  ${resp}  

Delete Admin Summons By Summon Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  Delete Admin Summons By Summon Id   &{kwargs}
   expect status is 404  ${resp}  

