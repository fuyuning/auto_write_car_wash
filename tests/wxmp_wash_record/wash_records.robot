*** Settings ***
Documentation  wxmp_wash_record
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.wash_record.WashRecordLibrary
Suite Setup  Login By Openid  ${openid}

Force Tags  model:wxmp_wash_record  车主微信端


*** Test Cases ***
Get wash_record Fail Without Login
   [Documentation]  接口名:用订单id获取一洗车记录${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  order_id=${order_id}  
   ${unessential_params}  create list  refresh=False  
   run every case by params  Get user wash record by order Fail 403  ${essential_params}  ${unessential_params}



Get wash_record Fail With Wrong Url
   [Documentation]  接口名:用订单id获取一洗车记录${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  order_id=${order_id}  
   ${unessential_params}  create list  refresh=False  
   run every case by params  Get user wash record by order Fail 404  ${essential_params}  ${unessential_params}



Get wash_record Success 
   [Documentation]  接口名:用订单id获取一洗车记录${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 WashRecord 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  order_id=${order_id}  
   ${unessential_params}  create list  refresh=False  
   run every case by params  Get user wash record by order Success 200  ${essential_params}  ${unessential_params}



Get wash_record Fail With Wrong Params
   [Documentation]  接口名:用订单id获取一洗车记录${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  order_id=${order_id}  
   ${unessential_params}  create list  refresh=False  
   run every case by params  Get user wash record by order Fail 422  ${essential_params}  ${unessential_params}



Get wash_record Fail Without Login
   [Documentation]  接口名:获取洗车记录列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  status=${status}  order_status=${order_status}  section=${section}  page_limit=${page_limit}  comment_status=${comment_status}  
   run every case by params  Get user wash records Fail 403  ${essential_params}  ${unessential_params}



Get wash_record Fail With Wrong Url
   [Documentation]  接口名:获取洗车记录列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  
   ${unessential_params}  create list  status=${status}  order_status=${order_status}  section=${section}  page_limit=${page_limit}  comment_status=${comment_status}  
   run every case by params  Get user wash records Fail 404  ${essential_params}  ${unessential_params}



Get wash_record Success 
   [Documentation]  接口名:获取洗车记录列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 WashRecord 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  
   ${unessential_params}  create list  status=${status}  order_status=${order_status}  section=${section}  page_limit=${page_limit}  comment_status=${comment_status}  
   run every case by params  Get user wash records Success 200  ${essential_params}  ${unessential_params}



Get wash_record Fail With Wrong Params
   [Documentation]  接口名:获取洗车记录列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  status=${status}  order_status=${order_status}  section=${section}  page_limit=${page_limit}  comment_status=${comment_status}  
   run every case by params  Get user wash records Fail 422  ${essential_params}  ${unessential_params}



Get wash_record Fail With Wrong Url
   [Documentation]  接口名:获取记录列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  wash_group_id=${wash_group_id}  
   ${unessential_params}  create list  section=${section}  page_limit=${page_limit}  
   run every case by params  Get wash records Fail 404  ${essential_params}  ${unessential_params}



Get wash_record Fail Without Login
   [Documentation]  接口名:获取记录列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  wash_group_id=${wash_group_id}  
   ${unessential_params}  create list  section=${section}  page_limit=${page_limit}  
   run every case by params  Get wash records Fail 403  ${essential_params}  ${unessential_params}



Get wash_record Success 
   [Documentation]  接口名:获取记录列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 WashRecord 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  wash_group_id=${wash_group_id}  
   ${unessential_params}  create list  section=${section}  page_limit=${page_limit}  
   run every case by params  Get wash records Success 200  ${essential_params}  ${unessential_params}



Get wash_record Fail With Wrong Params
   [Documentation]  接口名:获取记录列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  wash_group_id=${wash_group_id}  
   ${unessential_params}  create list  section=${section}  page_limit=${page_limit}  
   run every case by params  Get wash records Fail 422  ${essential_params}  ${unessential_params}



Get wash_record By Id Fail Without Login
   [Documentation]  接口名:获取单一洗车记录${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  status=${status}  
   ${unessential_params}  create list  
   run every case by params  Get user wash records By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id=${wash_record_id}



Get wash_record By Id Fail With Wrong Url
   [Documentation]  接口名:获取单一洗车记录${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  status=${status}  
   ${unessential_params}  create list  
   run every case by params  Get user wash records By Id Fail 404  ${essential_params}  ${unessential_params}  wash_record_id=${wrong_url_id}



Get wash_record By Id Success 
   [Documentation]  接口名:获取单一洗车记录${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 WashRecord 对象。
   [Tags]           Respcode:200
   ${essential_params}  create list  status=${status}  
   ${unessential_params}  create list  
   run every case by params  Get user wash records By Id Success 200  ${essential_params}  ${unessential_params}  wash_record_id=${wash_record_id}



Get wash_record By Id Fail With Wrong Params
   [Documentation]  接口名:获取单一洗车记录${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  status=${status}  
   ${unessential_params}  create list  
   run every case by params  Get user wash records By Id Fail 422  ${essential_params}  ${unessential_params}  wash_record_id=${wash_record_id}



*** Variables ***
${wash_record_id}


*** Keywords ***
Get User wash record by order Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get user wash record by order   &{kwargs}
   expect status is 403  ${resp}  

Get User wash record by order Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  get user wash record by order   &{kwargs}
   expect status is 404  ${resp}  

Get User wash record by order Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get user wash record by order   &{kwargs}
   expect status is 200  ${resp}  wxmp_wash_record/Get_User_wash_record_by_order_200.json
   ${wash_record_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id]}
   set global variable   ${wash_record_id}

Get User wash record by order Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get user wash record by order   &{kwargs}
   expect status is 422  ${resp}  

Get User wash records Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get user wash records   &{kwargs}
   expect status is 403  ${resp}  

Get User wash records Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  get user wash records   &{kwargs}
   expect status is 404  ${resp}  

Get User wash records Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get user wash records   &{kwargs}
   expect status is 200  ${resp}  wxmp_wash_record/Get_User_wash_records_200.json
   ${wash_record_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id]}
   set global variable   ${wash_record_id}

Get User wash records Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get user wash records   &{kwargs}
   expect status is 422  ${resp}  

Get Wash records Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  get wash records   &{kwargs}
   expect status is 404  ${resp}  

Get Wash records Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get wash records   &{kwargs}
   expect status is 403  ${resp}  

Get Wash records Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get wash records   &{kwargs}
   expect status is 200  ${resp}  wxmp_wash_record/Get_Wash_records_200.json
   ${wash_record_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id]}
   set global variable   ${wash_record_id}

Get Wash records Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get wash records   &{kwargs}
   expect status is 422  ${resp}  

Get User wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get user wash records by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Get User wash records By Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  get user wash records by wash record id  &{kwargs}
   expect status is 404  ${resp}  

Get User wash records By Id Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get user wash records by wash record id  &{kwargs}
   expect status is 200  ${resp}  wxmp_wash_record/Get_User_wash_records_By_Id_200.json
   ${wash_record_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id]}
   set global variable   ${wash_record_id}

Get User wash records By Id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get user wash records by wash record id  &{kwargs}
   expect status is 422  ${resp}  

