*** Settings ***
Documentation  admin_wash_able_group
Resource  ../resources.robot
Library  robot_car_wash_server_library.wash_able_group.WashAbleGroupLibrary
Suite Setup  Login  ${admin_username}   ${admin_password}
Suite Teardown  Logout
Force Tags  model:admin_wash_able_group  虾洗后台


*** Test Cases ***
patch admin wash able groups by wash able group id Success 
   [Documentation]  接口名:改人数${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create list  spec_people_day_num=${spec_people_day_num}  
   ${unessential_params}  create list  
   run every case by params  patch admin wash able groups by wash able group id Success 204  ${essential_params}  ${unessential_params}    wash_able_group_id=${wash_able_group_id}

patch admin wash able groups by wash able group id Fail With Wrong Url
   [Documentation]  接口名:改人数${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  spec_people_day_num=${spec_people_day_num}  
   ${unessential_params}  create list  
   run every case by params  patch admin wash able groups by wash able group id Fail 404  ${essential_params}  ${unessential_params}    wash_able_group_id=${wrong_url_id}

patch admin wash able groups by wash able group id Fail With Wrong Params
   [Documentation]  接口名:改人数${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  spec_people_day_num=${spec_people_day_num_422}  
   ${unessential_params}  create list  
   run every case by params  patch admin wash able groups by wash able group id Fail 422  ${essential_params}  ${unessential_params}    wash_able_group_id=${wash_able_group_id}  success=False


*** Variables ***
${wash_able_group_id}  


*** Keywords ***
patch admin wash able groups by wash able group id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  patch admin wash able groups by wash able group id  &{kwargs}
   expect status is 204  ${resp}  

patch admin wash able groups by wash able group id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  patch admin wash able groups by wash able group id  &{kwargs}
   expect status is 404  ${resp}  

patch admin wash able groups by wash able group id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  patch admin wash able groups by wash able group id  &{kwargs}
   expect status is 422  ${resp}  

