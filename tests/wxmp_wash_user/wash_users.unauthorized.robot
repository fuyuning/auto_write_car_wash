*** Settings ***
Documentation  wxmp_wash_user
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.wash_user.WashUserLibrary
Force Tags  model:wxmp_wash_user  车主微信端


*** Test Cases ***
post user user forms Fail Without Login
   [Documentation]  接口名:上传forms${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   post user user forms fail 403   formid=${formid}    

get user user info Fail Without Login
   [Documentation]  接口名:获取用户信息${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get user user info fail 403   unionid=${unionid}    

put user user info Fail Without Login
   [Documentation]  接口名:上传用户信息${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   put user user info fail 403   wx_nickname=${wx_nickname}  wx_avatarurl=${wx_avatarurl}  unionid=${unionid}  mobile=${mobile}  city=${city}  gender=${gender}  mobile_brand=${mobile_brand}  mobile_model=${mobile_model}  position=${position}  lon=${lon}  lat=${lat}    


*** Keywords ***
post user user forms Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post user user forms  &{kwargs}
   expect status is 403  ${resp}  

get user user info Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get user user info  &{kwargs}
   expect status is 403  ${resp}  

put user user info Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  put user user info  &{kwargs}
   expect status is 403  ${resp}  

