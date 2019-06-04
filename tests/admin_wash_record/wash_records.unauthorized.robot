*** Settings ***
Documentation  admin_wash_record
Resource  ../resources.robot
Library  robot_car_wash_server_library.wash_record.WashRecordLibrary
Force Tags  model:admin_wash_record  虾洗后台


*** Test Cases ***
post admin wash records refund by wash record id Fail Without Login
   [Documentation]  接口名:订单部分退款${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   post admin wash records refund by wash record id fail 403     wash_record_id=${wash_record_id}  refunds=${refunds}    refund_description=${refund_description}  

patch admin wash records is deleted by wash record id Fail Without Login
   [Documentation]  接口名:回收站恢复${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   patch admin wash records is deleted by wash record id fail 403     wash_record_id=${wash_record_id}  is_deleted=False    

patch admin wash record by wash record id Fail Without Login
   [Documentation]  接口名:洗车订单添加备注${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   patch admin wash record by wash record id fail 403     wash_record_id=${wash_record_id}  admin_remark=${admin_remark}    

patch admin wash records (car id|mobile|name) by wash record id Fail Without Login
   [Documentation]  接口名:订单详情修改（车牌,手机号,名字）${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   patch admin wash records (car id|mobile|name) by wash record id fail 403     wash_record_id=${wash_record_id}    car_id=${car_id}  mobile=${mobile}  name=${name}  

patch admin wash records serve time by wash record id Fail Without Login
   [Documentation]  接口名:订单修改预约服务时间${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   patch admin wash records serve time by wash record id fail 403     wash_record_id=${wash_record_id}  serve_time=${serve_time}  expect_time=${expect_time}    

delete admin wash records by wash record id Fail Without Login
   [Documentation]  接口名:删除洗车订单${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   delete admin wash records by wash record id fail 403     wash_record_id=${wash_record_id}


*** Variables ***
${wash_record_id}  1a2b3c4d5e6f7zz


*** Keywords ***
post admin wash records refund by wash record id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post admin wash records refund by wash record id  &{kwargs}
   expect status is 403  ${resp}  

patch admin wash records is deleted by wash record id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch admin wash records is deleted by wash record id  &{kwargs}
   expect status is 403  ${resp}  

patch admin wash record by wash record id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch admin wash record by wash record id  &{kwargs}
   expect status is 403  ${resp}  

patch admin wash records (car id|mobile|name) by wash record id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch admin wash records (car id|mobile|name) by wash record id  &{kwargs}
   expect status is 403  ${resp}  

patch admin wash records serve time by wash record id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch admin wash records serve time by wash record id  &{kwargs}
   expect status is 403  ${resp}  

delete admin wash records by wash record id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  delete admin wash records by wash record id  &{kwargs}
   expect status is 403  ${resp}  

