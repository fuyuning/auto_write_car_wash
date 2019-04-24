*** Settings ***
Documentation  wxmp_summon
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.summon.SummonLibrary
Force Tags  model:wxmp_summon  车主微信端


*** Test Cases ***
Post User Summons Fail Without Login
   [Documentation]  接口名:召唤虾洗${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  name=${name}  
   ${unessential_params}  create list  lon=${lon}  lat=${lat}  
   run every case by params  Post User Summons Fail 403  ${essential_params}  ${unessential_params}


*** Keywords ***
Post User Summons Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Post User Summons   &{kwargs}
   expect status is 403  ${resp}  

