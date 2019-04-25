*** Settings ***
Documentation  admin_wechat_reply
Resource  ../resources.robot
Library  robot_car_wash_server_library.wechat_reply.WechatReplyLibrary
Suite Setup  Login  ${admin_username}   ${admin_password}
Suite Teardown  Logout
Force Tags  model:admin_wechat_reply  虾洗后台


*** Test Cases ***
Post Admin Wachat Replys Success 
   [Documentation]  接口名:添加--公众号关注/自定义回复${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 201,返回的Json数据符合验证。
   [Tags]           Respcode:201
   ${essential_params}  create list  category=${category}  reply_type=${reply_type}  content=${content}  
   ${unessential_params}  create list  
   run every case by params  Post Admin Wachat Replys Success 201  ${essential_params}  ${unessential_params}

Post Admin Wachat Replys Fail With Wrong Params
   [Documentation]  接口名:添加--公众号关注/自定义回复${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  category=${category}  reply_type=${reply_type}  content=${content}  
   ${unessential_params}  create list  
   run every case by params  Post Admin Wachat Replys Fail 422  ${essential_params}  ${unessential_params}

Get Admin Wachat Replys Success 
   [Documentation]  接口名:查询--公众号关注/自定义回复${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 WechatReply 列表。
   [Tags]           Respcode:200
    Get Admin Wachat Replys Success 200

Put Admin Wachat Replys By Wechat Reply Id Success 
   [Documentation]  接口名:修改--公众号关注/自定义回复${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create list  category=${category}  reply_type=${reply_type}  content=${content}  
   ${unessential_params}  create list  
   run every case by params  Put Admin Wachat Replys By Wechat Reply Id Success 204  ${essential_params}  ${unessential_params}  wechat_reply_id=${wechat_reply_id}

Put Admin Wachat Replys By Wechat Reply Id Fail With Wrong Params
   [Documentation]  接口名:修改--公众号关注/自定义回复${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  category=${category}  reply_type=${reply_type}  content=${content}  
   ${unessential_params}  create list  
   run every case by params  Put Admin Wachat Replys By Wechat Reply Id Fail 422  ${essential_params}  ${unessential_params}  wechat_reply_id=${wechat_reply_id}

Put Admin Wachat Replys By Wechat Reply Id Fail With Wrong Url
   [Documentation]  接口名:修改--公众号关注/自定义回复${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  category=${category}  reply_type=${reply_type}  content=${content}  
   ${unessential_params}  create list  
   run every case by params  Put Admin Wachat Replys By Wechat Reply Id Fail 404  ${essential_params}  ${unessential_params}  wechat_reply_id=${wrong_url_id}

Delete Admin Wachat Replys By Wechat Reply Id Fail With Wrong Url
   [Documentation]  接口名:添删除--公众号关注/自定义回复${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   Delete Admin Wachat Replys By Wechat Reply Id Fail 404  wechat_reply_id=${wrong_url_id}

Delete Admin Wachat Replys By Wechat Reply Id Success 
   [Documentation]  接口名:添删除--公众号关注/自定义回复${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   Delete Admin Wachat Replys By Wechat Reply Id Success 204  wechat_reply_id=${wechat_reply_id}


*** Variables ***
${wechat_reply_id}  


*** Keywords ***
Post Admin Wachat Replys Success 201
   [Arguments]  &{kwargs}
   ${resp}=  Post Admin Wachat Replys   &{kwargs}
   expect status is 201  ${resp}  admin_wechat_reply/Post_Admin_Wachat_Replys_201.json
   ${wechat_reply_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wechat_reply_id]}
   set global variable   ${wechat_reply_id}

Post Admin Wachat Replys Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Post Admin Wachat Replys   &{kwargs}
   expect status is 422  ${resp}  

Get Admin Wachat Replys Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Wachat Replys   &{kwargs}
   expect status is 200  ${resp}  admin_wechat_reply/Get_Admin_Wachat_Replys_200.json
   ${wechat_reply_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wechat_reply_id]}
   set global variable   ${wechat_reply_id}

Put Admin Wachat Replys By Wechat Reply Id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  Put Admin Wachat Replys By Wechat Reply Id   &{kwargs}
   expect status is 204  ${resp}  

Put Admin Wachat Replys By Wechat Reply Id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Put Admin Wachat Replys By Wechat Reply Id   &{kwargs}
   expect status is 422  ${resp}  

Put Admin Wachat Replys By Wechat Reply Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  Put Admin Wachat Replys By Wechat Reply Id   &{kwargs}
   expect status is 404  ${resp}  

Delete Admin Wachat Replys By Wechat Reply Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  Delete Admin Wachat Replys By Wechat Reply Id   &{kwargs}
   expect status is 404  ${resp}  

Delete Admin Wachat Replys By Wechat Reply Id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  Delete Admin Wachat Replys By Wechat Reply Id   &{kwargs}
   expect status is 204  ${resp}  

