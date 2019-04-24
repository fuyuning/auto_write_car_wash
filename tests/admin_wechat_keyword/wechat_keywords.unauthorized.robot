*** Settings ***
Documentation  admin_wechat_keyword
Resource  ../resources.robot
Library  robot_car_wash_server_library.wechat_keyword.WechatKeywordLibrary
Force Tags  model:admin_wechat_keyword  虾洗后台


*** Test Cases ***
Post Admin Wechat Keywords Fail Without Login
   [Documentation]  接口名:添加--公众号关键字回复${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  name=${name}  keyword=${keyword}  reply_type=${reply_type}  content=${content}  
   ${unessential_params}  create list  
   run every case by params  Post Admin Wechat Keywords Fail 403  ${essential_params}  ${unessential_params}

Get Admin Wechat Keywords Fail Without Login
   [Documentation]  接口名:查询--公众号关键字回复${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
    Get Admin Wechat Keywords Fail 403

Put Admin Wechat Keywords By Wechat Keyword Id Fail Without Login
   [Documentation]  接口名:修改--公众号关键字回复${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  name=${name}  keyword=${keyword}  reply_type=${reply_type}  content=${content}  
   ${unessential_params}  create list  
   run every case by params  Put Admin Wechat Keywords By Wechat Keyword Id Fail 403  ${essential_params}  ${unessential_params}  wechat_keyword_id=${wechat_keyword_id}

Delete Admin Wechat Keywords By Wechat Keyword Id Fail Without Login
   [Documentation]  接口名:添删除--公众号关键字回复${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Delete Admin Wechat Keywords By Wechat Keyword Id Fail 403  wechat_keyword_id=${wechat_keyword_id}


*** Variables ***
${wechat_keyword_id}  12345678909876543


*** Keywords ***
Post Admin Wechat Keywords Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Post Admin Wechat Keywords   &{kwargs}
   expect status is 403  ${resp}  

Get Admin Wechat Keywords Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Wechat Keywords   &{kwargs}
   expect status is 403  ${resp}  

Put Admin Wechat Keywords By Wechat Keyword Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Put Admin Wechat Keywords By Wechat Keyword Id   &{kwargs}
   expect status is 403  ${resp}  

Delete Admin Wechat Keywords By Wechat Keyword Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Delete Admin Wechat Keywords By Wechat Keyword Id   &{kwargs}
   expect status is 403  ${resp}  

