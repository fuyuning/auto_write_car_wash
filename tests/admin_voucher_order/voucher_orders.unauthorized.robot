*** Settings ***
Documentation  admin_voucher_order
Resource  ../resources.robot
Library  robot_car_wash_server_library.voucher_order.VoucherOrderLibrary
Force Tags  model:admin_voucher_order  虾洗后台


*** Test Cases ***
get admin voucher orders Fail Without Login
   [Documentation]  接口名:获取洗车券订单列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get admin voucher orders fail 403     voucher_order_no=${voucher_order_no}  user_id=${user_id}  mobile=${mobile}  section=${section}  page_num=${page_num}  page_size=${page_size}  

get admin voucher sub orders Fail Without Login
   [Documentation]  接口名:获取洗车券子订单${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get admin voucher sub orders fail 403   voucher_order_no=${voucher_order_no}    

delete admin voucher orders by voucher order id Fail Without Login
   [Documentation]  接口名:删除洗车券订单${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   delete admin voucher orders by voucher order id fail 403     voucher_order_id=${voucher_order_id}


*** Variables ***
${voucher_order_id}  1a2b3c4d5e6f7zz


*** Keywords ***
get admin voucher orders Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin voucher orders  &{kwargs}
   expect status is 403  ${resp}  

get admin voucher sub orders Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin voucher sub orders  &{kwargs}
   expect status is 403  ${resp}  

delete admin voucher orders by voucher order id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  delete admin voucher orders by voucher order id  &{kwargs}
   expect status is 403  ${resp}  

