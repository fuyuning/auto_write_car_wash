*** Settings ***
Documentation  admin_wechat_keyword
Resource  ../resources.robot
Library  robot_car_wash_server_library.wechat_keyword.WechatKeywordLibrary
Suite Setup  Login  ${admin_username}   ${admin_password}
Suite Teardown  Logout
Force Tags  model:admin_wechat_keyword  虾洗后台


*** Test Cases ***
Post wechat_keyword Success 
   [Documentation]  接口名:添加--公众号关键字回复${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 201,返回的Json数据符合验证。
   [Tags]           Respcode:201
   ${essential_params}  create list  name=${name}  keyword=${keyword}  reply_type=${reply_type}  content=${content}  
   ${unessential_params}  create list  
   run every case by params  Post admin wechat keywords Success 201  ${essential_params}  ${unessential_params}



Post wechat_keyword Fail Without Login
   [Documentation]  接口名:添加--公众号关键字回复${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  name=${name}  keyword=${keyword}  reply_type=${reply_type}  content=${content}  
   ${unessential_params}  create list  
   run every case by params  Post admin wechat keywords Fail 403  ${essential_params}  ${unessential_params}



Post wechat_keyword Fail With Wrong Params
   [Documentation]  接口名:添加--公众号关键字回复${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  name=${name}  keyword=${keyword}  reply_type=${reply_type}  content=${content}  
   ${unessential_params}  create list  
   run every case by params  Post admin wechat keywords Fail 422  ${essential_params}  ${unessential_params}



Get wechat_keyword Success 
   [Documentation]  接口名:查询--公众号关键字回复${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 WechatKeyword 列表。
   [Tags]           Respcode:200
    Get admin wechat keywords Success 200


Get wechat_keyword Fail Without Login
   [Documentation]  接口名:查询--公众号关键字回复${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
    Get admin wechat keywords Fail 403


Get wechat_keyword Fail With Wrong Url
   [Documentation]  接口名:查询--公众号关键字回复${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
    Get admin wechat keywords Fail 404


Put wechat_keyword By Id Success 
   [Documentation]  接口名:修改--公众号关键字回复${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create list  name=${name}  keyword=${keyword}  reply_type=${reply_type}  content=${content}  
   ${unessential_params}  create list  
   run every case by params  Put admin wechat keywords By Id Success 204  ${essential_params}  ${unessential_params}  wechat_keyword_id=${wechat_keyword_id}



Put wechat_keyword By Id Fail Without Login
   [Documentation]  接口名:修改--公众号关键字回复${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  name=${name}  keyword=${keyword}  reply_type=${reply_type}  content=${content}  
   ${unessential_params}  create list  
   run every case by params  Put admin wechat keywords By Id Fail 403  ${essential_params}  ${unessential_params}  wechat_keyword_id=${wechat_keyword_id}



Put wechat_keyword By Id Fail With Wrong Params
   [Documentation]  接口名:修改--公众号关键字回复${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  name=${name}  keyword=${keyword}  reply_type=${reply_type}  content=${content}  
   ${unessential_params}  create list  
   run every case by params  Put admin wechat keywords By Id Fail 422  ${essential_params}  ${unessential_params}  wechat_keyword_id=${wechat_keyword_id}



Put wechat_keyword By Id Fail With Wrong Url
   [Documentation]  接口名:修改--公众号关键字回复${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  name=${name}  keyword=${keyword}  reply_type=${reply_type}  content=${content}  
   ${unessential_params}  create list  
   run every case by params  Put admin wechat keywords By Id Fail 404  ${essential_params}  ${unessential_params}  wechat_keyword_id=${wrong_url_id}



Delete wechat_keyword By Id Success 
   [Documentation]  接口名:添删除--公众号关键字回复${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   Delete admin wechat keywords By Id Success 204  wechat_keyword_id=${wechat_keyword_id}



Delete wechat_keyword By Id Fail With Wrong Url
   [Documentation]  接口名:添删除--公众号关键字回复${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   Delete admin wechat keywords By Id Fail 404  wechat_keyword_id=${wrong_url_id}



Delete wechat_keyword By Id Fail Without Login
   [Documentation]  接口名:添删除--公众号关键字回复${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Delete admin wechat keywords By Id Fail 403  wechat_keyword_id=${wechat_keyword_id}



*** Variables ***
${wechat_keyword_id}


*** Keywords ***
Post Admin wechat keywords Success 201
   [Arguments]  &{kwargs}
   ${resp}=  post admin wechat keywords   &{kwargs}
   expect status is 201  ${resp}  admin_wechat_keyword/Post_Admin_wechat_keywords_201.json
   ${wechat_keyword_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wechat_keyword_id]}
   set global variable   ${wechat_keyword_id}

Post Admin wechat keywords Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post admin wechat keywords   &{kwargs}
   expect status is 403  ${resp}  

Post Admin wechat keywords Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post admin wechat keywords   &{kwargs}
   expect status is 422  ${resp}  

Get Admin wechat keywords Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin wechat keywords   &{kwargs}
   expect status is 200  ${resp}  admin_wechat_keyword/Get_Admin_wechat_keywords_200.json
   ${wechat_keyword_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wechat_keyword_id]}
   set global variable   ${wechat_keyword_id}

Get Admin wechat keywords Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin wechat keywords   &{kwargs}
   expect status is 403  ${resp}  

Get Admin wechat keywords Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  get admin wechat keywords   &{kwargs}
   expect status is 404  ${resp}  

Put Admin wechat keywords By Id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  put admin wechat keywords by wechat keyword id  &{kwargs}
   expect status is 204  ${resp}  

Put Admin wechat keywords By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  put admin wechat keywords by wechat keyword id  &{kwargs}
   expect status is 403  ${resp}  

Put Admin wechat keywords By Id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  put admin wechat keywords by wechat keyword id  &{kwargs}
   expect status is 422  ${resp}  

Put Admin wechat keywords By Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  put admin wechat keywords by wechat keyword id  &{kwargs}
   expect status is 404  ${resp}  

Delete Admin wechat keywords By Id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  delete admin wechat keywords by wechat keyword id  &{kwargs}
   expect status is 204  ${resp}  

Delete Admin wechat keywords By Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  delete admin wechat keywords by wechat keyword id  &{kwargs}
   expect status is 404  ${resp}  

Delete Admin wechat keywords By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  delete admin wechat keywords by wechat keyword id  &{kwargs}
   expect status is 403  ${resp}  

