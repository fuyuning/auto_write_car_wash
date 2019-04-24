*** Settings ***
Documentation  wxmp_wash_user
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.wash_user.WashUserLibrary
Suite Setup  Login By Openid  ${openid}

Force Tags  model:wxmp_wash_user  车主微信端


*** Test Cases ***
Post User User Forms Success 
   [Documentation]  接口名:上传forms${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 201,返回的Json数据符合验证。
   [Tags]           Respcode:201
   ${essential_params}  create list  formid=${formid}  
   ${unessential_params}  create list  
   run every case by params  Post User User Forms Success 201  ${essential_params}  ${unessential_params}

Post User User Forms Fail With Wrong Params
   [Documentation]  接口名:上传forms${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  formid=${formid}  
   ${unessential_params}  create list  
   run every case by params  Post User User Forms Fail 422  ${essential_params}  ${unessential_params}

Get User User Info Success 
   [Documentation]  接口名:获取用户信息${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 WashUser 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  unionid=${unionid}  
   ${unessential_params}  create list  
   run every case by params  Get User User Info Success 200  ${essential_params}  ${unessential_params}

Get User User Info Fail With Wrong Params
   [Documentation]  接口名:获取用户信息${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  unionid=${unionid}  
   ${unessential_params}  create list  
   run every case by params  Get User User Info Fail 422  ${essential_params}  ${unessential_params}

Put User User Info Success 
   [Documentation]  接口名:上传用户信息${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create list  wx_nickname=${wx_nickname}  wx_avatarurl=${wx_avatarurl}  unionid=${unionid}  mobile=${mobile}  
   ${unessential_params}  create list  
   run every case by params  Put User User Info Success 204  ${essential_params}  ${unessential_params}

Put User User Info Fail With Wrong Params
   [Documentation]  接口名:上传用户信息${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  wx_nickname=${wx_nickname}  wx_avatarurl=${wx_avatarurl}  unionid=${unionid}  mobile=${mobile}  
   ${unessential_params}  create list  
   run every case by params  Put User User Info Fail 422  ${essential_params}  ${unessential_params}


*** Keywords ***
Post User User Forms Success 201
   [Arguments]  &{kwargs}
   ${resp}=  Post User User Forms   &{kwargs}
   expect status is 201  ${resp}  wxmp_wash_user/Post_User_User_Forms_201.json

Post User User Forms Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Post User User Forms   &{kwargs}
   expect status is 422  ${resp}  

Get User User Info Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Get User User Info   &{kwargs}
   expect status is 200  ${resp}  wxmp_wash_user/Get_User_User_Info_200.json

Get User User Info Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Get User User Info   &{kwargs}
   expect status is 422  ${resp}  

Put User User Info Success 204
   [Arguments]  &{kwargs}
   ${resp}=  Put User User Info   &{kwargs}
   expect status is 204  ${resp}  

Put User User Info Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Put User User Info   &{kwargs}
   expect status is 422  ${resp}  

