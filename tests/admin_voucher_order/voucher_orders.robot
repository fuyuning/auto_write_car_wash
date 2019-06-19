*** Settings ***
Documentation  admin_voucher_order
Resource  ../resources.robot
Library  robot_car_wash_server_library.voucher_order.VoucherOrderLibrary
Suite Setup  Login  ${username}   ${password}
Suite Teardown  Logout
Force Tags  model:admin_voucher_order  虾洗后台


*** Test Cases ***
get admin voucher orders Success 
   [Documentation]  接口名:获取洗车券订单列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 VoucherOrder 列表。
   [Tags]           Respcode:200
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  voucher_order_no=${voucher_order_no}  user_id=${user_id}  mobile=${mobile}  section=${section}  page_num=${page_num}  page_size=${page_size}  
   run every case by params   get admin voucher orders success 200   ${essential_params}  ${unessential_params}

get admin voucher orders Fail With Wrong Params
   [Documentation]  接口名:获取洗车券订单列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  voucher_order_no=${voucher_order_no_422}  user_id=${user_id_422}  mobile=${mobile_422}  section=${section_422}  page_num=${page_num_422}  page_size=${page_size_422}  
   run every case by params   get admin voucher orders fail 422   ${essential_params}  ${unessential_params}  success=False

get admin voucher sub orders Success 
   [Documentation]  接口名:获取洗车券子订单${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 VoucherSubOrder 列表。
   [Tags]           Respcode:200
   ${essential_params}  create dictionary  voucher_order_no=${voucher_order_no}  
   ${unessential_params}  create dictionary  
   run every case by params   get admin voucher sub orders success 200   ${essential_params}  ${unessential_params}

get admin voucher sub orders Fail With Wrong Params
   [Documentation]  接口名:获取洗车券子订单${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  voucher_order_no=${voucher_order_no_422}  
   ${unessential_params}  create dictionary  
   run every case by params   get admin voucher sub orders fail 422   ${essential_params}  ${unessential_params}  success=False

delete admin voucher orders by voucher order id Fail With Wrong Url
   [Documentation]  接口名:删除洗车券订单${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   delete admin voucher orders by voucher order id fail 404     voucher_order_id=${wrong_url_id}

delete admin voucher orders by voucher order id Success 
   [Documentation]  接口名:删除洗车券订单${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   delete admin voucher orders by voucher order id success 204     voucher_order_id=${voucher_order_id}


*** Variables ***
${voucher_order_id}  


*** Keywords ***
get admin voucher orders Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin voucher orders  &{kwargs}
   expect status is 200  ${resp}  admin_voucher_order/get_admin_voucher_orders_200.json
   ${voucher_order_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0]['voucher_order_id']}
   set global variable   ${voucher_order_id}

get admin voucher orders Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get admin voucher orders  &{kwargs}
   expect status is 422  ${resp}  

get admin voucher sub orders Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin voucher sub orders  &{kwargs}
   expect status is 200  ${resp}  admin_voucher_order/get_admin_voucher_sub_orders_200.json
   ${voucher_order_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0]['voucher_order_id']}
   set global variable   ${voucher_order_id}

get admin voucher sub orders Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get admin voucher sub orders  &{kwargs}
   expect status is 422  ${resp}  

delete admin voucher orders by voucher order id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  delete admin voucher orders by voucher order id  &{kwargs}
   expect status is 404  ${resp}  

delete admin voucher orders by voucher order id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  delete admin voucher orders by voucher order id  &{kwargs}
   expect status is 204  ${resp}  

