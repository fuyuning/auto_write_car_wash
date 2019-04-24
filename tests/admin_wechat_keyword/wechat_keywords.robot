*** Settings ***
Documentation  admin_wechat_keyword
Resource  ../resources.robot
Library  robot_car_wash_server_library.wechat_keyword.WechatKeywordLibrary
Suite Setup  Login  ${admin_username}   ${admin_password}
Suite Teardown  Logout
Force Tags  model:admin_wechat_keyword  虾洗后台


*** Test Cases ***
Post Admin Wechat Keywords Success 
   [Documentation]  接口名:添加--公众号关键字回复${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 201,返回的Json数据符合验证。
   [Tags]           Respcode:201
   ${essential_params}  create list  name=${name}  keyword=${keyword}  reply_type=${reply_type}  content=${content}  
   ${unessential_params}  create list  
   run every case by params  Post Admin Wechat Keywords Success 201  ${essential_params}  ${unessential_params}

Post Admin Wechat Keywords Fail With Wrong Params
   [Documentation]  接口名:添加--公众号关键字回复${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  name=${name}  keyword=${keyword}  reply_type=${reply_type}  content=${content}  
   ${unessential_params}  create list  
   run every case by params  Post Admin Wechat Keywords Fail 422  ${essential_params}  ${unessential_params}

Get Admin Wechat Keywords Success 
   [Documentation]  接口名:查询--公众号关键字回复${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 WechatKeyword 列表。
   [Tags]           Respcode:200
    Get Admin Wechat Keywords Success 200

Get Admin Wechat Keywords Fail With Wrong Url
   [Documentation]  接口名:查询--公众号关键字回复${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
    Get Admin Wechat Keywords Fail 404

Put Admin Wechat Keywords By Wechat Keyword Id Success 
   [Documentation]  接口名:修改--公众号关键字回复${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create list  name=${name}  keyword=${keyword}  reply_type=${reply_type}  content=${content}  
   ${unessential_params}  create list  
   run every case by params  Put Admin Wechat Keywords By Wechat Keyword Id Success 204  ${essential_params}  ${unessential_params}  wechat_keyword_id=${wechat_keyword_id}

Put Admin Wechat Keywords By Wechat Keyword Id Fail With Wrong Params
   [Documentation]  接口名:修改--公众号关键字回复${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  name=${name}  keyword=${keyword}  reply_type=${reply_type}  content=${content}  
   ${unessential_params}  create list  
   run every case by params  Put Admin Wechat Keywords By Wechat Keyword Id Fail 422  ${essential_params}  ${unessential_params}  wechat_keyword_id=${wechat_keyword_id}

Put Admin Wechat Keywords By Wechat Keyword Id Fail With Wrong Url
   [Documentation]  接口名:修改--公众号关键字回复${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  name=${name}  keyword=${keyword}  reply_type=${reply_type}  content=${content}  
   ${unessential_params}  create list  
   run every case by params  Put Admin Wechat Keywords By Wechat Keyword Id Fail 404  ${essential_params}  ${unessential_params}  wechat_keyword_id=${wrong_url_id}

Delete Admin Wechat Keywords By Wechat Keyword Id Success 
   [Documentation]  接口名:添删除--公众号关键字回复${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   Delete Admin Wechat Keywords By Wechat Keyword Id Success 204  wechat_keyword_id=${wechat_keyword_id}

Delete Admin Wechat Keywords By Wechat Keyword Id Fail With Wrong Url
   [Documentation]  接口名:添删除--公众号关键字回复${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   Delete Admin Wechat Keywords By Wechat Keyword Id Fail 404  wechat_keyword_id=${wrong_url_id}


*** Variables ***
${wechat_keyword_id}


*** Keywords ***
Post Admin Wechat Keywords Success 201
   [Arguments]  &{kwargs}
   ${resp}=  Post Admin Wechat Keywords   &{kwargs}
   expect status is 201  ${resp}  admin_wechat_keyword/Post_Admin_Wechat_Keywords_201.json
   ${wechat_keyword_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wechat_keyword_id]}
   set global variable   ${wechat_keyword_id}

Post Admin Wechat Keywords Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Post Admin Wechat Keywords   &{kwargs}
   expect status is 422  ${resp}  

Get Admin Wechat Keywords Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Wechat Keywords   &{kwargs}
   expect status is 200  ${resp}  admin_wechat_keyword/Get_Admin_Wechat_Keywords_200.json
   ${wechat_keyword_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wechat_keyword_id]}
   set global variable   ${wechat_keyword_id}

Get Admin Wechat Keywords Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Wechat Keywords   &{kwargs}
   expect status is 404  ${resp}  

Put Admin Wechat Keywords By Wechat Keyword Id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  Put Admin Wechat Keywords By Wechat Keyword Id   &{kwargs}
   expect status is 204  ${resp}  

Put Admin Wechat Keywords By Wechat Keyword Id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Put Admin Wechat Keywords By Wechat Keyword Id   &{kwargs}
   expect status is 422  ${resp}  

Put Admin Wechat Keywords By Wechat Keyword Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  Put Admin Wechat Keywords By Wechat Keyword Id   &{kwargs}
   expect status is 404  ${resp}  

Delete Admin Wechat Keywords By Wechat Keyword Id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  Delete Admin Wechat Keywords By Wechat Keyword Id   &{kwargs}
   expect status is 204  ${resp}  

Delete Admin Wechat Keywords By Wechat Keyword Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  Delete Admin Wechat Keywords By Wechat Keyword Id   &{kwargs}
   expect status is 404  ${resp}  

