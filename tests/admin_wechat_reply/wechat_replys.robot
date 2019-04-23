*** Settings ***
Documentation  admin_wechat_reply
Resource  ../resources.robot
Library  robot_car_wash_server_library.wechat_reply.WechatReplyLibrary
Suite Setup  Login  ${admin_username}   ${admin_password}
Suite Teardown  Logout
Force Tags  model:admin_wechat_reply  虾洗后台


*** Test Cases ***
Post wechat_reply Success 
   [Documentation]  接口名:添加--公众号关注/自定义回复${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 201,返回的Json数据符合验证。
   [Tags]           Respcode:201
   ${essential_params}  create list  category=${category}  reply_type=${reply_type}  content=${content}  
   ${unessential_params}  create list  
   run every case by params  Post admin wachat replys Success 201  ${essential_params}  ${unessential_params}



Post wechat_reply Fail Without Login
   [Documentation]  接口名:添加--公众号关注/自定义回复${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  category=${category}  reply_type=${reply_type}  content=${content}  
   ${unessential_params}  create list  
   run every case by params  Post admin wachat replys Fail 403  ${essential_params}  ${unessential_params}



Post wechat_reply Fail With Wrong Params
   [Documentation]  接口名:添加--公众号关注/自定义回复${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  category=${category}  reply_type=${reply_type}  content=${content}  
   ${unessential_params}  create list  
   run every case by params  Post admin wachat replys Fail 422  ${essential_params}  ${unessential_params}



Get wechat_reply Success 
   [Documentation]  接口名:查询--公众号关注/自定义回复${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 WechatReply 列表。
   [Tags]           Respcode:200
    Get admin wachat replys Success 200


Get wechat_reply Fail Without Login
   [Documentation]  接口名:查询--公众号关注/自定义回复${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
    Get admin wachat replys Fail 403


Get wechat_reply Fail With Wrong Url
   [Documentation]  接口名:查询--公众号关注/自定义回复${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
    Get admin wachat replys Fail 404


Put wechat_reply By Id Success 
   [Documentation]  接口名:修改--公众号关注/自定义回复${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create list  category=${category}  reply_type=${reply_type}  content=${content}  
   ${unessential_params}  create list  
   run every case by params  Put admin wachat replys By Id Success 204  ${essential_params}  ${unessential_params}  wechat_reply_id=${wechat_reply_id}



Put wechat_reply By Id Fail Without Login
   [Documentation]  接口名:修改--公众号关注/自定义回复${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  category=${category}  reply_type=${reply_type}  content=${content}  
   ${unessential_params}  create list  
   run every case by params  Put admin wachat replys By Id Fail 403  ${essential_params}  ${unessential_params}  wechat_reply_id=${wechat_reply_id}



Put wechat_reply By Id Fail With Wrong Params
   [Documentation]  接口名:修改--公众号关注/自定义回复${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  category=${category}  reply_type=${reply_type}  content=${content}  
   ${unessential_params}  create list  
   run every case by params  Put admin wachat replys By Id Fail 422  ${essential_params}  ${unessential_params}  wechat_reply_id=${wechat_reply_id}



Put wechat_reply By Id Fail With Wrong Url
   [Documentation]  接口名:修改--公众号关注/自定义回复${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  category=${category}  reply_type=${reply_type}  content=${content}  
   ${unessential_params}  create list  
   run every case by params  Put admin wachat replys By Id Fail 404  ${essential_params}  ${unessential_params}  wechat_reply_id=${wrong_url_id}



Delete wechat_reply By Id Success 
   [Documentation]  接口名:添删除--公众号关注/自定义回复${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   Delete admin wachat replys By Id Success 204  wechat_reply_id=${wechat_reply_id}



Delete wechat_reply By Id Fail With Wrong Url
   [Documentation]  接口名:添删除--公众号关注/自定义回复${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   Delete admin wachat replys By Id Fail 404  wechat_reply_id=${wrong_url_id}



Delete wechat_reply By Id Fail Without Login
   [Documentation]  接口名:添删除--公众号关注/自定义回复${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Delete admin wachat replys By Id Fail 403  wechat_reply_id=${wechat_reply_id}



*** Variables ***
${wechat_reply_id}


*** Keywords ***
Post Admin wachat replys Success 201
   [Arguments]  &{kwargs}
   ${resp}=  post admin wachat replys   &{kwargs}
   expect status is 201  ${resp}  admin_wechat_reply/Post_Admin_wachat_replys_201.json
   ${wechat_reply_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wechat_reply_id]}
   set global variable   ${wechat_reply_id}

Post Admin wachat replys Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post admin wachat replys   &{kwargs}
   expect status is 403  ${resp}  

Post Admin wachat replys Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post admin wachat replys   &{kwargs}
   expect status is 422  ${resp}  

Get Admin wachat replys Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin wachat replys   &{kwargs}
   expect status is 200  ${resp}  admin_wechat_reply/Get_Admin_wachat_replys_200.json
   ${wechat_reply_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wechat_reply_id]}
   set global variable   ${wechat_reply_id}

Get Admin wachat replys Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin wachat replys   &{kwargs}
   expect status is 403  ${resp}  

Get Admin wachat replys Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  get admin wachat replys   &{kwargs}
   expect status is 404  ${resp}  

Put Admin wachat replys By Id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  put admin wachat replys by wechat reply id  &{kwargs}
   expect status is 204  ${resp}  

Put Admin wachat replys By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  put admin wachat replys by wechat reply id  &{kwargs}
   expect status is 403  ${resp}  

Put Admin wachat replys By Id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  put admin wachat replys by wechat reply id  &{kwargs}
   expect status is 422  ${resp}  

Put Admin wachat replys By Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  put admin wachat replys by wechat reply id  &{kwargs}
   expect status is 404  ${resp}  

Delete Admin wachat replys By Id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  delete admin wachat replys by wechat reply id  &{kwargs}
   expect status is 204  ${resp}  

Delete Admin wachat replys By Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  delete admin wachat replys by wechat reply id  &{kwargs}
   expect status is 404  ${resp}  

Delete Admin wachat replys By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  delete admin wachat replys by wechat reply id  &{kwargs}
   expect status is 403  ${resp}  

