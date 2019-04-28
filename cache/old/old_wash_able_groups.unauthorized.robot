*** Settings ***
Documentation  admin_wash_able_group
Resource  ../resources.robot
Library  robot_car_wash_server_library.wash_able_group.WashAbleGroupLibrary
Force Tags  model:admin_wash_able_group  虾洗后台


*** Test Cases ***
patch admin wash able groups by wash able group id Fail Without Login
   [Documentation]  接口名:改人数${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  spec_people_day_num=${spec_people_day_num}  
   ${unessential_params}  create list  
   run every case by params  patch admin wash able groups by wash able group id Fail 403  ${essential_params}  ${unessential_params}    wash_able_group_id=${wash_able_group_id}


*** Variables ***
${wash_able_group_id}  12345678909876543


*** Keywords ***
patch admin wash able groups by wash able group id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch admin wash able groups by wash able group id  &{kwargs}
   expect status is 403  ${resp}  

