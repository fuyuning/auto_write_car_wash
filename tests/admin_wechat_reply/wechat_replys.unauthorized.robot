*** Settings ***
Documentation  admin_wechat_reply
Resource  ../resources.robot
Library  robot_car_wash_server_library.wechat_reply.WechatReplyLibrary
Force Tags  model:admin_wechat_reply  虾洗后台


*** Test Cases ***
post admin wechat replys Fail Without Login
   [Documentation]  接口名:添加--公众号关注/自定义回复${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   post admin wechat replys fail 403   category=${category}  reply_type=${reply_type}  content=${content}    

get admin wechat replys Fail Without Login
   [Documentation]  接口名:查询--公众号关注/自定义回复${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
    get admin wechat replys fail 403

put admin wechat replys by wechat reply id Fail Without Login
   [Documentation]  接口名:修改--公众号关注/自定义回复${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   put admin wechat replys by wechat reply id fail 403     wechat_reply_id=${wechat_reply_id}  category=${category}  reply_type=${reply_type}  content=${content}    

delete admin wechat replys by wechat reply id Fail Without Login
   [Documentation]  接口名:添删除--公众号关注/自定义回复${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   delete admin wechat replys by wechat reply id fail 403     wechat_reply_id=${wechat_reply_id}


*** Variables ***
${wechat_reply_id}  1a2b3c4d5e6f7zz


*** Keywords ***
post admin wechat replys Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post admin wechat replys  &{kwargs}
   expect status is 403  ${resp}  

get admin wechat replys Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin wechat replys  &{kwargs}
   expect status is 403  ${resp}  

put admin wechat replys by wechat reply id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  put admin wechat replys by wechat reply id  &{kwargs}
   expect status is 403  ${resp}  

delete admin wechat replys by wechat reply id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  delete admin wechat replys by wechat reply id  &{kwargs}
   expect status is 403  ${resp}  

