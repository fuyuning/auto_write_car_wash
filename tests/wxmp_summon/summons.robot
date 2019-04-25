*** Settings ***
Documentation  wxmp_summon
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.summon.SummonLibrary
Suite Setup  Login By Openid  ${openid}
Force Tags  model:wxmp_summon  车主微信端


*** Test Cases ***
Post User Summons Success 
   [Documentation]  接口名:召唤虾洗${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 201,返回的Json数据符合验证。
   [Tags]           Respcode:201
   ${essential_params}  create list  name=${name}  
   ${unessential_params}  create list  lon=${lon}  lat=${lat}  
   run every case by params  Post User Summons Success 201  ${essential_params}  ${unessential_params}

Post User Summons Fail With Wrong Params
   [Documentation]  接口名:召唤虾洗${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  name=${name_422}  
   ${unessential_params}  create list  lon=${lon_422}  lat=${lat_422}  
   run every case by params  Post User Summons Fail 422  ${essential_params}  ${unessential_params}


*** Keywords ***
Post User Summons Success 201
   [Arguments]  &{kwargs}
   ${resp}=  Post User Summons   &{kwargs}
   expect status is 201  ${resp}  wxmp_summon/Post_User_Summons_201.json

Post User Summons Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Post User Summons   &{kwargs}
   expect status is 422  ${resp}  

