*** Settings ***
Documentation  wxmp_summon
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.summon.SummonLibrary
Suite Setup  login by unionid   ${unionid}
Force Tags  model:wxmp_summon  车主微信端


*** Test Cases ***
post user summons Success 
   [Documentation]  接口名:召唤虾洗${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 201,返回的Json数据符合验证。
   [Tags]           Respcode:201
   ${essential_params}  create dictionary  name=${name}  
   ${unessential_params}  create dictionary  lon=${lon}  lat=${lat}  
   run every case by params   post user summons success 201   ${essential_params}  ${unessential_params}

post user summons Fail With Wrong Params
   [Documentation]  接口名:召唤虾洗${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  name=${name_422}  
   ${unessential_params}  create dictionary  lon=${lon_422}  lat=${lat_422}  
   run every case by params   post user summons fail 422   ${essential_params}  ${unessential_params}  success=False


*** Keywords ***
post user summons Success 201
   [Arguments]  &{kwargs}
   ${resp}=  post user summons  &{kwargs}
   expect status is 201  ${resp}  wxmp_summon/post_user_summons_201.json

post user summons Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post user summons  &{kwargs}
   expect status is 422  ${resp}  

