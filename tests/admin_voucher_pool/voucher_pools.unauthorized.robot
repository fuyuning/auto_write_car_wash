*** Settings ***
Documentation  admin_voucher_pool
Resource  ../resources.robot
Library  robot_car_wash_server_library.voucher_pool.VoucherPoolLibrary
Force Tags  model:admin_voucher_pool  虾洗后台


*** Test Cases ***
post admin voucher pools Fail Without Login
   [Documentation]  接口名:添加洗车劵${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   post admin voucher pools fail 403   name=${name}  price=${price}  denomination=${denomination}  num=${num}  num_status=False  sell=${sell}  days=${days}  service_types=${service_types}    description=${description}  buy_num=${buy_num}  give_num=${give_num}  service_groups=${service_groups}  

get admin voucher pools Fail Without Login
   [Documentation]  接口名:查询洗车劵${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get admin voucher pools fail 403     name=${name}  created_section=${created_section}  sell=${sell}  

get admin voucher pools by voucher pool id Fail Without Login
   [Documentation]  接口名:查询一条详情${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get admin voucher pools by voucher pool id fail 403     voucher_pool_id=${voucher_pool_id}

put admin voucher pools by voucher pool id Fail Without Login
   [Documentation]  接口名:编辑洗车劵${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   put admin voucher pools by voucher pool id fail 403     voucher_pool_id=${voucher_pool_id}  name=${name}  price=${price}  denomination=${denomination}  num=${num}  num_status=False  sell=${sell}  days=${days}  service_types=${service_types}    description=${description}  buy_num=${buy_num}  give_num=${give_num}  service_groups=${service_groups}  


*** Variables ***
${voucher_pool_id}  1a2b3c4d5e6f7zz


*** Keywords ***
post admin voucher pools Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post admin voucher pools  &{kwargs}
   expect status is 403  ${resp}  

get admin voucher pools Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin voucher pools  &{kwargs}
   expect status is 403  ${resp}  

get admin voucher pools by voucher pool id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin voucher pools by voucher pool id  &{kwargs}
   expect status is 403  ${resp}  

put admin voucher pools by voucher pool id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  put admin voucher pools by voucher pool id  &{kwargs}
   expect status is 403  ${resp}  

