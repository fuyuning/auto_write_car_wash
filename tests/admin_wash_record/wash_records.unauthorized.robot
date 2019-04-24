*** Settings ***
Documentation  admin_wash_record
Resource  ../resources.robot
Library  robot_car_wash_server_library.wash_record.WashRecordLibrary
Force Tags  model:admin_wash_record  虾洗后台


*** Test Cases ***
Post Refund By Wash Record Id Fail Without Login
   [Documentation]  接口名:订单部分退款${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  refunds=${refunds}  
   ${unessential_params}  create list  refund_description=${refund_description}  
   run every case by params  Post Refund By Wash Record Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/refund=${wash_record_id/refund}

Patch is Deleted by wash record id Fail Without Login
   [Documentation]  接口名:回收站恢复${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  is_deleted=False  
   ${unessential_params}  create list  
   run every case by params  Patch is Deleted by wash record id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/is_deleted=${wash_record_id/is_deleted}

Patch Admin Wash Record By Wash Record Id Fail Without Login
   [Documentation]  接口名:洗车订单添加备注${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  admin_remark=${admin_remark}  
   ${unessential_params}  create list  
   run every case by params  Patch Admin Wash Record By Wash Record Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id=${wash_record_id}

Patch (car Id|mobile|name) by wash record id Fail Without Login
   [Documentation]  接口名:订单详情修改（车牌,手机号,名字）${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  car_id=${car_id}  mobile=${mobile}  name=${name}  
   run every case by params  Patch (car Id|mobile|name) by wash record id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/(car_id|mobile|name)=${wash_record_id/(car_id|mobile|name)}

Delete Admin Wash Records By Wash Record Id Fail Without Login
   [Documentation]  接口名:删除洗车订单${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Delete Admin Wash Records By Wash Record Id Fail 403  wash_record_id=${wash_record_id}


*** Variables ***
${wash_record_id/refund}  12345678909876543
${wash_record_id/close}  12345678909876543
${wash_record_id}  12345678909876543
${wash_record_id/is_deleted}  12345678909876543
${wash_record_id/(car_id|mobile|name)}  12345678909876543


*** Keywords ***
Post Refund By Wash Record Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Post Refund By Wash Record Id   &{kwargs}
   expect status is 403  ${resp}  

Patch is Deleted by wash record id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Patch is Deleted by wash record id   &{kwargs}
   expect status is 403  ${resp}  

Patch Admin Wash Record By Wash Record Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Patch Admin Wash Record By Wash Record Id   &{kwargs}
   expect status is 403  ${resp}  

Patch (car Id|mobile|name) by wash record id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Patch (car Id|mobile|name) by wash record id   &{kwargs}
   expect status is 403  ${resp}  

Delete Admin Wash Records By Wash Record Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Delete Admin Wash Records By Wash Record Id   &{kwargs}
   expect status is 403  ${resp}  

