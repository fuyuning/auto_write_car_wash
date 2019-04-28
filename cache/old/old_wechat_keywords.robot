*** Settings ***
Documentation  admin_wechat_keyword
Resource  ../resources.robot
Library  robot_car_wash_server_library.wechat_keyword.WechatKeywordLibrary
Suite Setup  Login  ${admin_username}   ${admin_password}
Suite Teardown  Logout
Force Tags  model:admin_wechat_keyword  虾洗后台


*** Test Cases ***
post admin wechat keyword import Success 
   [Documentation]  接口名:微信图片上传${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为  列表。
   [Tags]           Respcode:200
    post admin wechat keyword import Success 200

post admin wechat keywords Success 
   [Documentation]  接口名:添加--公众号关键字回复${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 201,返回的Json数据符合验证。
   [Tags]           Respcode:201
   ${essential_params}  create list  name=${name}  keyword=${keyword}  reply_type=${reply_type}  content=${content}  
   ${unessential_params}  create list  
   run every case by params  post admin wechat keywords Success 201  ${essential_params}  ${unessential_params}

post admin wechat keywords Fail With Wrong Params
   [Documentation]  接口名:添加--公众号关键字回复${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  name=${name_422}  keyword=${keyword_422}  reply_type=${reply_type_422}  content=${content_422}  
   ${unessential_params}  create list  
   run every case by params  post admin wechat keywords Fail 422  ${essential_params}  ${unessential_params}  success=False

get admin wechat keywords Success 
   [Documentation]  接口名:查询--公众号关键字回复${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 WechatKeyword 列表。
   [Tags]           Respcode:200
    get admin wechat keywords Success 200

get admin wechat keywords by wechat keyword id Success 
   [Documentation]  接口名:修改查询[1条]--公众号关键字回复${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 WechatKeyword 对象。
   [Tags]           Respcode:200
   get admin wechat keywords by wechat keyword id Success 200    wechat_keyword_id=${wechat_keyword_id}

get admin wechat keywords by wechat keyword id Fail With Wrong Url
   [Documentation]  接口名:修改查询[1条]--公众号关键字回复${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   get admin wechat keywords by wechat keyword id Fail 404    wechat_keyword_id=${w}

put admin wechat keywords by wechat keyword id Success 
   [Documentation]  接口名:修改--公众号关键字回复${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create list  name=${name}  keyword=${keyword}  reply_type=${reply_type}  content=${content}  
   ${unessential_params}  create list  
   run every case by params  put admin wechat keywords by wechat keyword id Success 204  ${essential_params}  ${unessential_params}    wechat_keyword_id=${wechat_keyword_id}

put admin wechat keywords by wechat keyword id Fail With Wrong Params
   [Documentation]  接口名:修改--公众号关键字回复${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  name=${name_422}  keyword=${keyword_422}  reply_type=${reply_type_422}  content=${content_422}  
   ${unessential_params}  create list  
   run every case by params  put admin wechat keywords by wechat keyword id Fail 422  ${essential_params}  ${unessential_params}    wechat_keyword_id=${wechat_keyword_id}  success=False

put admin wechat keywords by wechat keyword id Fail With Wrong Url
   [Documentation]  接口名:修改--公众号关键字回复${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  name=${name}  keyword=${keyword}  reply_type=${reply_type}  content=${content}  
   ${unessential_params}  create list  
   run every case by params  put admin wechat keywords by wechat keyword id Fail 404  ${essential_params}  ${unessential_params}    wechat_keyword_id=${w}

delete admin wechat keywords by wechat keyword id Fail With Wrong Url
   [Documentation]  接口名:添删除--公众号关键字回复${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   delete admin wechat keywords by wechat keyword id Fail 404    wechat_keyword_id=${w}

delete admin wechat keywords by wechat keyword id Success 
   [Documentation]  接口名:添删除--公众号关键字回复${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   delete admin wechat keywords by wechat keyword id Success 204    wechat_keyword_id=${wechat_keyword_id}


*** Variables ***
${wechat_keyword_id}  


*** Keywords ***
post admin wechat keyword import Success 200
   [Arguments]  &{kwargs}
   ${resp}=  post admin wechat keyword import  &{kwargs}
   expect status is 200  ${resp}  admin_wechat_keyword/post_admin_wechat_keyword_import_200.json
   ${wechat_keyword_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wechat_keyword_id]}
   set global variable   ${wechat_keyword_id}

post admin wechat keywords Success 201
   [Arguments]  &{kwargs}
   ${resp}=  post admin wechat keywords  &{kwargs}
   expect status is 201  ${resp}  admin_wechat_keyword/post_admin_wechat_keywords_201.json
   ${wechat_keyword_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wechat_keyword_id]}
   set global variable   ${wechat_keyword_id}

post admin wechat keywords Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post admin wechat keywords  &{kwargs}
   expect status is 422  ${resp}  

get admin wechat keywords Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin wechat keywords  &{kwargs}
   expect status is 200  ${resp}  admin_wechat_keyword/get_admin_wechat_keywords_200.json
   ${wechat_keyword_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wechat_keyword_id]}
   set global variable   ${wechat_keyword_id}

get admin wechat keywords by wechat keyword id Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin wechat keywords by wechat keyword id  &{kwargs}
   expect status is 200  ${resp}  admin_wechat_keyword/get_admin_wechat_keywords_by_wechat_keyword_id_200.json
   ${wechat_keyword_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wechat_keyword_id]}
   set global variable   ${wechat_keyword_id}

get admin wechat keywords by wechat keyword id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  get admin wechat keywords by wechat keyword id  &{kwargs}
   expect status is 404  ${resp}  

put admin wechat keywords by wechat keyword id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  put admin wechat keywords by wechat keyword id  &{kwargs}
   expect status is 204  ${resp}  

put admin wechat keywords by wechat keyword id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  put admin wechat keywords by wechat keyword id  &{kwargs}
   expect status is 422  ${resp}  

put admin wechat keywords by wechat keyword id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  put admin wechat keywords by wechat keyword id  &{kwargs}
   expect status is 404  ${resp}  

delete admin wechat keywords by wechat keyword id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  delete admin wechat keywords by wechat keyword id  &{kwargs}
   expect status is 404  ${resp}  

delete admin wechat keywords by wechat keyword id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  delete admin wechat keywords by wechat keyword id  &{kwargs}
   expect status is 204  ${resp}  

