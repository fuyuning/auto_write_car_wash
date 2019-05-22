*** Settings ***
Documentation  admin_wechat_reply
Resource  ../resources.robot
Library  robot_car_wash_server_library.wechat_reply.WechatReplyLibrary
Suite Setup  Login  ${admin_username}   ${admin_password}
Suite Teardown  Logout
Force Tags  model:admin_wechat_reply  虾洗后台


*** Test Cases ***
post admin wechat replys Success 
   [Documentation]  接口名:添加--公众号关注/自定义回复${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 201,返回的Json数据符合验证。
   [Tags]           Respcode:201
   ${essential_params}  create list  category=${category}  reply_type=${reply_type}  content=${content}  
   ${unessential_params}  create list  
   run every case by params  post admin wechat replys Success 201  ${essential_params}  ${unessential_params}

post admin wechat replys Fail With Wrong Params
   [Documentation]  接口名:添加--公众号关注/自定义回复${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  category=${category_422}  reply_type=${reply_type_422}  content=${content_422}  
   ${unessential_params}  create list  
   run every case by params  post admin wechat replys Fail 422  ${essential_params}  ${unessential_params}  success=False

get admin wechat replys Success 
   [Documentation]  接口名:查询--公众号关注/自定义回复${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 WechatReply 列表。
   [Tags]           Respcode:200
    get admin wechat replys Success 200

put admin wechat replys by wechat reply id Success 
   [Documentation]  接口名:修改--公众号关注/自定义回复${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create list  category=${category}  reply_type=${reply_type}  content=${content}  
   ${unessential_params}  create list  
   run every case by params  put admin wechat replys by wechat reply id Success 204  ${essential_params}  ${unessential_params}    wechat_reply_id=${wechat_reply_id}

put admin wechat replys by wechat reply id Fail With Wrong Params
   [Documentation]  接口名:修改--公众号关注/自定义回复${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  category=${category_422}  reply_type=${reply_type_422}  content=${content_422}  
   ${unessential_params}  create list  
   run every case by params  put admin wechat replys by wechat reply id Fail 422  ${essential_params}  ${unessential_params}    wechat_reply_id=${wechat_reply_id}  success=False

put admin wechat replys by wechat reply id Fail With Wrong Url
   [Documentation]  接口名:修改--公众号关注/自定义回复${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  category=${category}  reply_type=${reply_type}  content=${content}  
   ${unessential_params}  create list  
   run every case by params  put admin wechat replys by wechat reply id Fail 404  ${essential_params}  ${unessential_params}    wechat_reply_id=${wrong_url_id}

delete admin wechat replys by wechat reply id Fail With Wrong Url
   [Documentation]  接口名:添删除--公众号关注/自定义回复${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   delete admin wechat replys by wechat reply id Fail 404    wechat_reply_id=${wrong_url_id}

delete admin wechat replys by wechat reply id Success 
   [Documentation]  接口名:添删除--公众号关注/自定义回复${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   delete admin wechat replys by wechat reply id Success 204    wechat_reply_id=${wechat_reply_id}


*** Variables ***
${wechat_reply_id}  


*** Keywords ***
post admin wechat replys Success 201
   [Arguments]  &{kwargs}
   ${resp}=  post admin wechat replys  &{kwargs}
   expect status is 201  ${resp}  admin_wechat_reply/post_admin_wechat_replys_201.json
   ${wechat_reply_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wechat_reply_id]}
   set global variable   ${wechat_reply_id}

post admin wechat replys Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post admin wechat replys  &{kwargs}
   expect status is 422  ${resp}  

get admin wechat replys Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin wechat replys  &{kwargs}
   expect status is 200  ${resp}  admin_wechat_reply/get_admin_wechat_replys_200.json
   ${wechat_reply_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wechat_reply_id]}
   set global variable   ${wechat_reply_id}

put admin wechat replys by wechat reply id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  put admin wechat replys by wechat reply id  &{kwargs}
   expect status is 204  ${resp}  

put admin wechat replys by wechat reply id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  put admin wechat replys by wechat reply id  &{kwargs}
   expect status is 422  ${resp}  

put admin wechat replys by wechat reply id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  put admin wechat replys by wechat reply id  &{kwargs}
   expect status is 404  ${resp}  

delete admin wechat replys by wechat reply id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  delete admin wechat replys by wechat reply id  &{kwargs}
   expect status is 404  ${resp}  

delete admin wechat replys by wechat reply id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  delete admin wechat replys by wechat reply id  &{kwargs}
   expect status is 204  ${resp}  

