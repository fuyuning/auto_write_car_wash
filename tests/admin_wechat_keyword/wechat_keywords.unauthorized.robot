*** Settings ***
Documentation  admin_wechat_keyword
Resource  ../resources.robot
Library  robot_car_wash_server_library.wechat_keyword.WechatKeywordLibrary
Force Tags  model:admin_wechat_keyword  虾洗后台


*** Test Cases ***
post admin wechat keyword import Fail Without Login
   [Documentation]  接口名:微信图片上传${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
    post admin wechat keyword import Fail 403

post admin wechat keywords Fail Without Login
   [Documentation]  接口名:添加--公众号关键字回复${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  name=${name}  keyword=${keyword}  reply_type=${reply_type}  content=${content}  
   ${unessential_params}  create list  
   run every case by params  post admin wechat keywords Fail 403  ${essential_params}  ${unessential_params}

get admin wechat keywords Fail Without Login
   [Documentation]  接口名:查询--公众号关键字回复${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
    get admin wechat keywords Fail 403

get admin wechat keywords by wechat keyword id Fail Without Login
   [Documentation]  接口名:修改查询[1条]--公众号关键字回复${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get admin wechat keywords by wechat keyword id Fail 403    wechat_keyword_id=${wechat_keyword_id}

put admin wechat keywords by wechat keyword id Fail Without Login
   [Documentation]  接口名:修改--公众号关键字回复${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  name=${name}  keyword=${keyword}  reply_type=${reply_type}  content=${content}  
   ${unessential_params}  create list  
   run every case by params  put admin wechat keywords by wechat keyword id Fail 403  ${essential_params}  ${unessential_params}    wechat_keyword_id=${wechat_keyword_id}

delete admin wechat keywords by wechat keyword id Fail Without Login
   [Documentation]  接口名:添删除--公众号关键字回复${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   delete admin wechat keywords by wechat keyword id Fail 403    wechat_keyword_id=${wechat_keyword_id}


*** Variables ***
${wechat_keyword_id}  12345678909876543


*** Keywords ***
post admin wechat keyword import Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post admin wechat keyword import  &{kwargs}
   expect status is 403  ${resp}  

post admin wechat keywords Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post admin wechat keywords  &{kwargs}
   expect status is 403  ${resp}  

get admin wechat keywords Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin wechat keywords  &{kwargs}
   expect status is 403  ${resp}  

get admin wechat keywords by wechat keyword id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin wechat keywords by wechat keyword id  &{kwargs}
   expect status is 403  ${resp}  

put admin wechat keywords by wechat keyword id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  put admin wechat keywords by wechat keyword id  &{kwargs}
   expect status is 403  ${resp}  

delete admin wechat keywords by wechat keyword id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  delete admin wechat keywords by wechat keyword id  &{kwargs}
   expect status is 403  ${resp}  

