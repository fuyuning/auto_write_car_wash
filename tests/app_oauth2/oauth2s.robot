*** Settings ***
Documentation  app_oauth2
Resource  ../resources.robot
Library  robot_washing_expert_library.oauth2.Oauth2Library
Suite Setup  Login  ${username}   ${password}
Force Tags  model:app_oauth2  虾客APP


*** Test Cases ***
post oauth 2.0 token Success 
   [Documentation]  接口名:账号密码授权${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为  列表。
   [Tags]           Respcode:200
   ${essential_params}  create dictionary  grant_type=${grant_type}  client_id=${Please_input}  secret=${Please_input}  password=${Please_input}  
   ${unessential_params}  create dictionary  userid=${userid}  mobile=${mobile}  
   run every case by params   post oauth 2.0 token success 200   ${essential_params}  ${unessential_params}

post oauth 2.0 token Fail With Wrong Params
   [Documentation]  接口名:账号密码授权${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  grant_type=${grant_type_422}  client_id=${Please_input}  secret=${Please_input}  password=${Please_input}  
   ${unessential_params}  create dictionary  userid=${userid_422}  mobile=${mobile_422}  
   run every case by params   post oauth 2.0 token fail 422   ${essential_params}  ${unessential_params}  success=False

post oauth 2.0 token Success 
   [Documentation]  接口名:刷新秘钥${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为  列表。
   [Tags]           Respcode:200
   ${essential_params}  create dictionary  grant_type=${grant_type}  client_id=${Please_input}  secret=${Please_input}  refresh=${refresh}  
   ${unessential_params}  create dictionary  
   run every case by params   post oauth 2.0 token success 200   ${essential_params}  ${unessential_params}

post oauth 2.0 token Fail With Wrong Params
   [Documentation]  接口名:刷新秘钥${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  grant_type=${grant_type_422}  client_id=${Please_input}  secret=${Please_input}  refresh=${refresh_422}  
   ${unessential_params}  create dictionary  
   run every case by params   post oauth 2.0 token fail 422   ${essential_params}  ${unessential_params}  success=False

post car wash user captcha Success 
   [Documentation]  接口名:获取验证码${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为  列表。
   [Tags]           Respcode:200
   ${essential_params}  create dictionary  mobile=${mobile}  
   ${unessential_params}  create dictionary  
   run every case by params   post car wash user captcha success 200   ${essential_params}  ${unessential_params}

post car wash user captcha Fail With Wrong Params
   [Documentation]  接口名:获取验证码${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  mobile=${mobile_422}  
   ${unessential_params}  create dictionary  
   run every case by params   post car wash user captcha fail 422   ${essential_params}  ${unessential_params}  success=False

post car wash user reset password Success 
   [Documentation]  接口名:重置密码${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create dictionary  mobile=${mobile}  new_pass=${Please_input}  captcha=${Please_input}  serie=${serie}  
   ${unessential_params}  create dictionary  
   run every case by params   post car wash user reset password success 204   ${essential_params}  ${unessential_params}

post car wash user reset password Fail With Wrong Params
   [Documentation]  接口名:重置密码${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  mobile=${mobile_422}  new_pass=${Please_input}  captcha=${Please_input}  serie=${serie_422}  
   ${unessential_params}  create dictionary  
   run every case by params   post car wash user reset password fail 422   ${essential_params}  ${unessential_params}  success=False

put car wash user password Success 
   [Documentation]  接口名:修改密码${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create dictionary  old_password=${old_password}  new_pass=${Please_input}  
   ${unessential_params}  create dictionary  
   run every case by params   put car wash user password success 204   ${essential_params}  ${unessential_params}

put car wash user password Fail With Wrong Params
   [Documentation]  接口名:修改密码${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  old_password=${old_password_422}  new_pass=${Please_input}  
   ${unessential_params}  create dictionary  
   run every case by params   put car wash user password fail 422   ${essential_params}  ${unessential_params}  success=False


*** Keywords ***
post oauth 2.0 token Success 200
   [Arguments]  &{kwargs}
   ${resp}=  post oauth 2.0 token  &{kwargs}
   expect status is 200  ${resp}  app_oauth2/post_oauth_2.0_token_200.json

post oauth 2.0 token Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post oauth 2.0 token  &{kwargs}
   expect status is 422  ${resp}  

post oauth 2.0 token Success 200
   [Arguments]  &{kwargs}
   ${resp}=  post oauth 2.0 token  &{kwargs}
   expect status is 200  ${resp}  app_oauth2/post_oauth_2.0_token_200.json

post oauth 2.0 token Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post oauth 2.0 token  &{kwargs}
   expect status is 422  ${resp}  

post car wash user captcha Success 200
   [Arguments]  &{kwargs}
   ${resp}=  post car wash user captcha  &{kwargs}
   expect status is 200  ${resp}  app_oauth2/post_car_wash_user_captcha_200.json

post car wash user captcha Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post car wash user captcha  &{kwargs}
   expect status is 422  ${resp}  

post car wash user reset password Success 204
   [Arguments]  &{kwargs}
   ${resp}=  post car wash user reset password  &{kwargs}
   expect status is 204  ${resp}  

post car wash user reset password Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post car wash user reset password  &{kwargs}
   expect status is 422  ${resp}  

put car wash user password Success 204
   [Arguments]  &{kwargs}
   ${resp}=  put car wash user password  &{kwargs}
   expect status is 204  ${resp}  

put car wash user password Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  put car wash user password  &{kwargs}
   expect status is 422  ${resp}  

