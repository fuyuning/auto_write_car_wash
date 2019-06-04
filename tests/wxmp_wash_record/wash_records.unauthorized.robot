*** Settings ***
Documentation  wxmp_wash_record
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.wash_record.WashRecordLibrary
Force Tags  model:wxmp_wash_record  车主微信端


get user after sales Fail Without Login
   [Documentation]  接口名:售后与退款${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get user after sales fail 403     status=${status}  order_status=${order_status}  after_sale=${after_sale}  section=${section}  page_limit=${page_limit}  

get user wash record by order Fail Without Login
   [Documentation]  接口名:用订单id获取一洗车记录${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get user wash record by order fail 403   order_id=${order_id}    refresh=False  

get user wash records Fail Without Login
   [Documentation]  接口名:获取洗车记录列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get user wash records fail 403     status=${status}  order_status=${order_status}  section=${section}  page_limit=${page_limit}  comment_status=${comment_status}  

get wash records Fail Without Login
   [Documentation]  接口名:获取记录列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get wash records fail 403   wash_group_id=${wash_group_id}    section=${section}  page_limit=${page_limit}  

get user after sales Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get user after sales  &{kwargs}
   expect status is 403  ${resp}  

get user wash record by order Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get user wash record by order  &{kwargs}
   expect status is 403  ${resp}  

get user wash records Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get user wash records  &{kwargs}
   expect status is 403  ${resp}  

get wash records Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get wash records  &{kwargs}
   expect status is 403  ${resp}  

