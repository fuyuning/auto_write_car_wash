*** Settings ***
Documentation  wxmp_wash_record
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.wash_record.WashRecordLibrary
Suite Setup  Login By Openid  ${openid}
Force Tags  model:wxmp_wash_record  车主微信端


*** Test Cases ***
Get User After Sales Success 
   [Documentation]  接口名:售后与退款${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 WashRecord 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  
   ${unessential_params}  create list  status=${status}  order_status=${order_status}  after_sale=${after_sale}  section=${section}  page_limit=${page_limit}  
   run every case by params  Get User After Sales Success 200  ${essential_params}  ${unessential_params}

Get User After Sales Fail With Wrong Params
   [Documentation]  接口名:售后与退款${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  status=${status_422}  order_status=${order_status_422}  after_sale=${after_sale_422}  section=${section_422}  page_limit=${page_limit_422}  
   run every case by params  Get User After Sales Fail 422  ${essential_params}  ${unessential_params}

Get User Wash Record By Order Success 
   [Documentation]  接口名:用订单id获取一洗车记录${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 WashRecord 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  order_id=${order_id}  
   ${unessential_params}  create list  refresh=False  
   run every case by params  Get User Wash Record By Order Success 200  ${essential_params}  ${unessential_params}

Get User Wash Record By Order Fail With Wrong Params
   [Documentation]  接口名:用订单id获取一洗车记录${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  order_id=${order_id_422}  
   ${unessential_params}  create list  refresh=ThisIsRobot!  
   run every case by params  Get User Wash Record By Order Fail 422  ${essential_params}  ${unessential_params}

Get User Wash Records Success 
   [Documentation]  接口名:获取洗车记录列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 WashRecord 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  
   ${unessential_params}  create list  status=${status}  order_status=${order_status}  section=${section}  page_limit=${page_limit}  comment_status=${comment_status}  
   run every case by params  Get User Wash Records Success 200  ${essential_params}  ${unessential_params}

Get User Wash Records Fail With Wrong Params
   [Documentation]  接口名:获取洗车记录列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  status=${status_422}  order_status=${order_status_422}  section=${section_422}  page_limit=${page_limit_422}  comment_status=${comment_status_422}  
   run every case by params  Get User Wash Records Fail 422  ${essential_params}  ${unessential_params}

Get Wash Records Success 
   [Documentation]  接口名:获取记录列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 WashRecord 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  wash_group_id=${wash_group_id}  
   ${unessential_params}  create list  section=${section}  page_limit=${page_limit}  
   run every case by params  Get Wash Records Success 200  ${essential_params}  ${unessential_params}

Get Wash Records Fail With Wrong Params
   [Documentation]  接口名:获取记录列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  wash_group_id=${wash_group_id_422}  
   ${unessential_params}  create list  section=${section_422}  page_limit=${page_limit_422}  
   run every case by params  Get Wash Records Fail 422  ${essential_params}  ${unessential_params}

Get User Wash Records By Wash Record Id Fail With Wrong Url
   [Documentation]  接口名:获取单一洗车记录${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  status=${status}  
   ${unessential_params}  create list  
   run every case by params  Get User Wash Records By Wash Record Id Fail 404  ${essential_params}  ${unessential_params}  wash_record_id=${wrong_url_id}

Get User Wash Records By Wash Record Id Success 
   [Documentation]  接口名:获取单一洗车记录${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 WashRecord 对象。
   [Tags]           Respcode:200
   ${essential_params}  create list  status=${status}  
   ${unessential_params}  create list  
   run every case by params  Get User Wash Records By Wash Record Id Success 200  ${essential_params}  ${unessential_params}  wash_record_id=${wash_record_id}

Get User Wash Records By Wash Record Id Fail With Wrong Params
   [Documentation]  接口名:获取单一洗车记录${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  status=${status_422}  
   ${unessential_params}  create list  
   run every case by params  Get User Wash Records By Wash Record Id Fail 422  ${essential_params}  ${unessential_params}  wash_record_id=${wash_record_id}


*** Variables ***
${wash_record_id}  


*** Keywords ***
Get User After Sales Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Get User After Sales   &{kwargs}
   expect status is 200  ${resp}  wxmp_wash_record/Get_User_After_Sales_200.json
   ${wash_record_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id]}
   set global variable   ${wash_record_id}

Get User After Sales Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Get User After Sales   &{kwargs}
   expect status is 422  ${resp}  

Get User Wash Record By Order Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Get User Wash Record By Order   &{kwargs}
   expect status is 200  ${resp}  wxmp_wash_record/Get_User_Wash_Record_By_Order_200.json
   ${wash_record_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id]}
   set global variable   ${wash_record_id}

Get User Wash Record By Order Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Get User Wash Record By Order   &{kwargs}
   expect status is 422  ${resp}  

Get User Wash Records Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Get User Wash Records   &{kwargs}
   expect status is 200  ${resp}  wxmp_wash_record/Get_User_Wash_Records_200.json
   ${wash_record_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id]}
   set global variable   ${wash_record_id}

Get User Wash Records Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Get User Wash Records   &{kwargs}
   expect status is 422  ${resp}  

Get Wash Records Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Get Wash Records   &{kwargs}
   expect status is 200  ${resp}  wxmp_wash_record/Get_Wash_Records_200.json
   ${wash_record_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id]}
   set global variable   ${wash_record_id}

Get Wash Records Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Get Wash Records   &{kwargs}
   expect status is 422  ${resp}  

Get User Wash Records By Wash Record Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  Get User Wash Records By Wash Record Id   &{kwargs}
   expect status is 404  ${resp}  

Get User Wash Records By Wash Record Id Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Get User Wash Records By Wash Record Id   &{kwargs}
   expect status is 200  ${resp}  wxmp_wash_record/Get_User_Wash_Records_By_Wash_Record_Id_200.json
   ${wash_record_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id]}
   set global variable   ${wash_record_id}

Get User Wash Records By Wash Record Id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Get User Wash Records By Wash Record Id   &{kwargs}
   expect status is 422  ${resp}  

