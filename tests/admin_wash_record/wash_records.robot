*** Settings ***
Documentation  admin_wash_record
Resource  ../resources.robot
Library  robot_car_wash_server_library.wash_record.WashRecordLibrary
Suite Setup  Login  ${admin_username}   ${admin_password}
Suite Teardown  Logout
Force Tags  model:admin_wash_record  虾洗后台


*** Test Cases ***
Post Refund By Wash Record Id Success 
   [Documentation]  接口名:订单部分退款${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create list  refunds=${refunds}  
   ${unessential_params}  create list  refund_description=${refund_description}  
   run every case by params  Post Refund By Wash Record Id Success 204  ${essential_params}  ${unessential_params}  wash_record_id/refund=${wash_record_id/refund}

Post Refund By Wash Record Id Fail With Wrong Url
   [Documentation]  接口名:订单部分退款${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  refunds=${refunds}  
   ${unessential_params}  create list  refund_description=${refund_description}  
   run every case by params  Post Refund By Wash Record Id Fail 404  ${essential_params}  ${unessential_params}  wash_record_id/refund=${wrong_url_id}

Post Refund By Wash Record Id Fail With Wrong Params
   [Documentation]  接口名:订单部分退款${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  refunds=${refunds}  
   ${unessential_params}  create list  refund_description=${refund_description}  
   run every case by params  Post Refund By Wash Record Id Fail 422  ${essential_params}  ${unessential_params}  wash_record_id/refund=${wash_record_id/refund}

Post Close By Wash Record Id Success 
   [Documentation]  接口名:关闭洗车订单${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create list  
   ${unessential_params}  create list  close_description=${close_description}  
   run every case by params  Post Close By Wash Record Id Success 204  ${essential_params}  ${unessential_params}  wash_record_id/close=${wash_record_id/close}

Post Close By Wash Record Id Fail With Wrong Url
   [Documentation]  接口名:关闭洗车订单${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  
   ${unessential_params}  create list  close_description=${close_description}  
   run every case by params  Post Close By Wash Record Id Fail 404  ${essential_params}  ${unessential_params}  wash_record_id/close=${wrong_url_id}

Post Close By Wash Record Id Fail With Wrong Params
   [Documentation]  接口名:关闭洗车订单${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  close_description=${close_description}  
   run every case by params  Post Close By Wash Record Id Fail 422  ${essential_params}  ${unessential_params}  wash_record_id/close=${wash_record_id/close}

Get Admin Wash Records Success 
   [Documentation]  接口名:洗车记录列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 WashRecord 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  page_num=${page_num}  page_size=${page_size}  
   ${unessential_params}  create list  order_no=${order_no}  status=${status}  car_id=${car_id}  mobile=${mobile}  wash_area_id=${wash_area_id}  submit_section=${submit_section}  user_id=${user_id}  wash_seconds=${wash_seconds}  order_type=${order_type}  is_deleted=False  
   run every case by params  Get Admin Wash Records Success 200  ${essential_params}  ${unessential_params}

Get Admin Wash Records Fail With Wrong Params
   [Documentation]  接口名:洗车记录列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  page_num=${page_num}  page_size=${page_size}  
   ${unessential_params}  create list  order_no=${order_no}  status=${status}  car_id=${car_id}  mobile=${mobile}  wash_area_id=${wash_area_id}  submit_section=${submit_section}  user_id=${user_id}  wash_seconds=${wash_seconds}  order_type=${order_type}  is_deleted=False  
   run every case by params  Get Admin Wash Records Fail 422  ${essential_params}  ${unessential_params}

Get Admin Wash Records By Wash Record Id Success 
   [Documentation]  接口名:洗车记录详情${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 WashRecord 对象。
   [Tags]           Respcode:200
   Get Admin Wash Records By Wash Record Id Success 200  wash_record_id=${wash_record_id}

Get Admin Wash Records By Wash Record Id Fail With Wrong Url
   [Documentation]  接口名:洗车记录详情${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   Get Admin Wash Records By Wash Record Id Fail 404  wash_record_id=${wrong_url_id}

Patch is Deleted by wash record id Success 
   [Documentation]  接口名:回收站恢复${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create list  is_deleted=False  
   ${unessential_params}  create list  
   run every case by params  Patch is Deleted by wash record id Success 204  ${essential_params}  ${unessential_params}  wash_record_id/is_deleted=${wash_record_id/is_deleted}

Patch is Deleted by wash record id Fail With Wrong Url
   [Documentation]  接口名:回收站恢复${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  is_deleted=False  
   ${unessential_params}  create list  
   run every case by params  Patch is Deleted by wash record id Fail 404  ${essential_params}  ${unessential_params}  wash_record_id/is_deleted=${wrong_url_id}

Patch is Deleted by wash record id Fail With Wrong Params
   [Documentation]  接口名:回收站恢复${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  is_deleted=False  
   ${unessential_params}  create list  
   run every case by params  Patch is Deleted by wash record id Fail 422  ${essential_params}  ${unessential_params}  wash_record_id/is_deleted=${wash_record_id/is_deleted}

Patch Admin Wash Record By Wash Record Id Success 
   [Documentation]  接口名:洗车订单添加备注${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create list  admin_remark=${admin_remark}  
   ${unessential_params}  create list  
   run every case by params  Patch Admin Wash Record By Wash Record Id Success 204  ${essential_params}  ${unessential_params}  wash_record_id=${wash_record_id}

Patch Admin Wash Record By Wash Record Id Fail With Wrong Url
   [Documentation]  接口名:洗车订单添加备注${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  admin_remark=${admin_remark}  
   ${unessential_params}  create list  
   run every case by params  Patch Admin Wash Record By Wash Record Id Fail 404  ${essential_params}  ${unessential_params}  wash_record_id=${wrong_url_id}

Patch Admin Wash Record By Wash Record Id Fail With Wrong Params
   [Documentation]  接口名:洗车订单添加备注${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  admin_remark=${admin_remark}  
   ${unessential_params}  create list  
   run every case by params  Patch Admin Wash Record By Wash Record Id Fail 422  ${essential_params}  ${unessential_params}  wash_record_id=${wash_record_id}

Patch (car Id|mobile|name) by wash record id Fail With Wrong Params
   [Documentation]  接口名:订单详情修改（车牌,手机号,名字）${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  car_id=${car_id}  mobile=${mobile}  name=${name}  
   run every case by params  Patch (car Id|mobile|name) by wash record id Fail 422  ${essential_params}  ${unessential_params}  wash_record_id/(car_id|mobile|name)=${wash_record_id/(car_id|mobile|name)}

Patch (car Id|mobile|name) by wash record id Success 
   [Documentation]  接口名:订单详情修改（车牌,手机号,名字）${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create list  
   ${unessential_params}  create list  car_id=${car_id}  mobile=${mobile}  name=${name}  
   run every case by params  Patch (car Id|mobile|name) by wash record id Success 204  ${essential_params}  ${unessential_params}  wash_record_id/(car_id|mobile|name)=${wash_record_id/(car_id|mobile|name)}

Patch (car Id|mobile|name) by wash record id Fail With Wrong Url
   [Documentation]  接口名:订单详情修改（车牌,手机号,名字）${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  
   ${unessential_params}  create list  car_id=${car_id}  mobile=${mobile}  name=${name}  
   run every case by params  Patch (car Id|mobile|name) by wash record id Fail 404  ${essential_params}  ${unessential_params}  wash_record_id/(car_id|mobile|name)=${wrong_url_id}

Delete Admin Wash Records By Wash Record Id Fail With Wrong Url
   [Documentation]  接口名:删除洗车订单${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   Delete Admin Wash Records By Wash Record Id Fail 404  wash_record_id=${wrong_url_id}

Delete Admin Wash Records By Wash Record Id Success 
   [Documentation]  接口名:删除洗车订单${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   Delete Admin Wash Records By Wash Record Id Success 204  wash_record_id=${wash_record_id}


*** Variables ***
${wash_record_id/refund}  
${wash_record_id/close}  
${wash_record_id}  
${wash_record_id/is_deleted}  
${wash_record_id/(car_id|mobile|name)}  


*** Keywords ***
Post Refund By Wash Record Id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  Post Refund By Wash Record Id   &{kwargs}
   expect status is 204  ${resp}  

Post Refund By Wash Record Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  Post Refund By Wash Record Id   &{kwargs}
   expect status is 404  ${resp}  

Post Refund By Wash Record Id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Post Refund By Wash Record Id   &{kwargs}
   expect status is 422  ${resp}  

Post Close By Wash Record Id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  Post Close By Wash Record Id   &{kwargs}
   expect status is 204  ${resp}  

Post Close By Wash Record Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  Post Close By Wash Record Id   &{kwargs}
   expect status is 404  ${resp}  

Post Close By Wash Record Id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Post Close By Wash Record Id   &{kwargs}
   expect status is 422  ${resp}  

Get Admin Wash Records Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Wash Records   &{kwargs}
   expect status is 200  ${resp}  admin_wash_record/Get_Admin_Wash_Records_200.json
   ${wash_record_id/refund}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id/refund]}
   set global variable   ${wash_record_id/refund}
   ${wash_record_id/close}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id/close]}
   set global variable   ${wash_record_id/close}
   ${wash_record_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id]}
   set global variable   ${wash_record_id}
   ${wash_record_id/is_deleted}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id/is_deleted]}
   set global variable   ${wash_record_id/is_deleted}
   ${wash_record_id/(car_id|mobile|name)}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id/(car_id|mobile|name)]}
   set global variable   ${wash_record_id/(car_id|mobile|name)}

Get Admin Wash Records Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Wash Records   &{kwargs}
   expect status is 422  ${resp}  

Get Admin Wash Records By Wash Record Id Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Wash Records By Wash Record Id   &{kwargs}
   expect status is 200  ${resp}  admin_wash_record/Get_Admin_Wash_Records_By_Wash_Record_Id_200.json
   ${wash_record_id/refund}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id/refund]}
   set global variable   ${wash_record_id/refund}
   ${wash_record_id/close}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id/close]}
   set global variable   ${wash_record_id/close}
   ${wash_record_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id]}
   set global variable   ${wash_record_id}
   ${wash_record_id/is_deleted}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id/is_deleted]}
   set global variable   ${wash_record_id/is_deleted}
   ${wash_record_id/(car_id|mobile|name)}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id/(car_id|mobile|name)]}
   set global variable   ${wash_record_id/(car_id|mobile|name)}

Get Admin Wash Records By Wash Record Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Wash Records By Wash Record Id   &{kwargs}
   expect status is 404  ${resp}  

Patch is Deleted by wash record id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  Patch is Deleted by wash record id   &{kwargs}
   expect status is 204  ${resp}  

Patch is Deleted by wash record id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  Patch is Deleted by wash record id   &{kwargs}
   expect status is 404  ${resp}  

Patch is Deleted by wash record id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Patch is Deleted by wash record id   &{kwargs}
   expect status is 422  ${resp}  

Patch Admin Wash Record By Wash Record Id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  Patch Admin Wash Record By Wash Record Id   &{kwargs}
   expect status is 204  ${resp}  

Patch Admin Wash Record By Wash Record Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  Patch Admin Wash Record By Wash Record Id   &{kwargs}
   expect status is 404  ${resp}  

Patch Admin Wash Record By Wash Record Id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Patch Admin Wash Record By Wash Record Id   &{kwargs}
   expect status is 422  ${resp}  

Patch (car Id|mobile|name) by wash record id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Patch (car Id|mobile|name) by wash record id   &{kwargs}
   expect status is 422  ${resp}  

Patch (car Id|mobile|name) by wash record id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  Patch (car Id|mobile|name) by wash record id   &{kwargs}
   expect status is 204  ${resp}  

Patch (car Id|mobile|name) by wash record id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  Patch (car Id|mobile|name) by wash record id   &{kwargs}
   expect status is 404  ${resp}  

Delete Admin Wash Records By Wash Record Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  Delete Admin Wash Records By Wash Record Id   &{kwargs}
   expect status is 404  ${resp}  

Delete Admin Wash Records By Wash Record Id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  Delete Admin Wash Records By Wash Record Id   &{kwargs}
   expect status is 204  ${resp}  

