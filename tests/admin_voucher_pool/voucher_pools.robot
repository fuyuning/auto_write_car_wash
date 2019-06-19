*** Settings ***
Documentation  admin_voucher_pool
Resource  ../resources.robot
Library  robot_car_wash_server_library.voucher_pool.VoucherPoolLibrary
Suite Setup  Login  ${username}   ${password}
Suite Teardown  Logout
Force Tags  model:admin_voucher_pool  虾洗后台


*** Test Cases ***
post admin voucher pools Success 
   [Documentation]  接口名:添加洗车劵${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 201,返回的Json数据符合验证。
   [Tags]           Respcode:201
   ${essential_params}  create dictionary  name=${name}  price=${price}  denomination=${denomination}  num=${num}  num_status=False  sell=${sell}  days=${days}  service_types=${service_types}  
   ${unessential_params}  create dictionary  description=${description}  buy_num=${buy_num}  give_num=${give_num}  service_groups=${service_groups}  
   run every case by params   post admin voucher pools success 201   ${essential_params}  ${unessential_params}

post admin voucher pools Fail With Wrong Params
   [Documentation]  接口名:添加洗车劵${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  name=${name_422}  price=${price_422}  denomination=${denomination_422}  num=${num_422}  num_status=ThisIsRobot!  sell=${sell_422}  days=${days_422}  service_types=${service_types_422}  
   ${unessential_params}  create dictionary  description=${description_422}  buy_num=${buy_num_422}  give_num=${give_num_422}  service_groups=${service_groups_422}  
   run every case by params   post admin voucher pools fail 422   ${essential_params}  ${unessential_params}  success=False

get admin voucher pools Success 
   [Documentation]  接口名:查询洗车劵${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 VoucherPool 列表。
   [Tags]           Respcode:200
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  name=${name}  created_section=${created_section}  sell=${sell}  
   run every case by params   get admin voucher pools success 200   ${essential_params}  ${unessential_params}

get admin voucher pools Fail With Wrong Params
   [Documentation]  接口名:查询洗车劵${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  name=${name_422}  created_section=${created_section_422}  sell=${sell_422}  
   run every case by params   get admin voucher pools fail 422   ${essential_params}  ${unessential_params}  success=False

get admin voucher pools by voucher pool id Success 
   [Documentation]  接口名:查询一条详情${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 VoucherPool 对象。
   [Tags]           Respcode:200
   get admin voucher pools by voucher pool id success 200     voucher_pool_id=${voucher_pool_id}

get admin voucher pools by voucher pool id Fail With Wrong Url
   [Documentation]  接口名:查询一条详情${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   get admin voucher pools by voucher pool id fail 404     voucher_pool_id=${wrong_url_id}

put admin voucher pools by voucher pool id Fail With Wrong Url
   [Documentation]  接口名:编辑洗车劵${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   put admin voucher pools by voucher pool id fail 404     voucher_pool_id=${wrong_url_id}  name=${name}  price=${price}  denomination=${denomination}  num=${num}  num_status=False  sell=${sell}  days=${days}  service_types=${service_types}    description=${description}  buy_num=${buy_num}  give_num=${give_num}  service_groups=${service_groups}  

put admin voucher pools by voucher pool id Success 
   [Documentation]  接口名:编辑洗车劵${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create dictionary  name=${name}  price=${price}  denomination=${denomination}  num=${num}  num_status=False  sell=${sell}  days=${days}  service_types=${service_types}  
   ${unessential_params}  create dictionary  description=${description}  buy_num=${buy_num}  give_num=${give_num}  service_groups=${service_groups}  
   run every case by params   put admin voucher pools by voucher pool id success 204   ${essential_params}  ${unessential_params}    voucher_pool_id=${voucher_pool_id}

put admin voucher pools by voucher pool id Fail With Wrong Params
   [Documentation]  接口名:编辑洗车劵${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  name=${name_422}  price=${price_422}  denomination=${denomination_422}  num=${num_422}  num_status=ThisIsRobot!  sell=${sell_422}  days=${days_422}  service_types=${service_types_422}  
   ${unessential_params}  create dictionary  description=${description_422}  buy_num=${buy_num_422}  give_num=${give_num_422}  service_groups=${service_groups_422}  
   run every case by params   put admin voucher pools by voucher pool id fail 422   ${essential_params}  ${unessential_params}    voucher_pool_id=${voucher_pool_id}  success=False


*** Variables ***
${voucher_pool_id}  


*** Keywords ***
post admin voucher pools Success 201
   [Arguments]  &{kwargs}
   ${resp}=  post admin voucher pools  &{kwargs}
   expect status is 201  ${resp}  admin_voucher_pool/post_admin_voucher_pools_201.json
   ${voucher_pool_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0]['voucher_pool_id']}
   set global variable   ${voucher_pool_id}

post admin voucher pools Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post admin voucher pools  &{kwargs}
   expect status is 422  ${resp}  

get admin voucher pools Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin voucher pools  &{kwargs}
   expect status is 200  ${resp}  admin_voucher_pool/get_admin_voucher_pools_200.json
   ${voucher_pool_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0]['voucher_pool_id']}
   set global variable   ${voucher_pool_id}

get admin voucher pools Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get admin voucher pools  &{kwargs}
   expect status is 422  ${resp}  

get admin voucher pools by voucher pool id Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin voucher pools by voucher pool id  &{kwargs}
   expect status is 200  ${resp}  admin_voucher_pool/get_admin_voucher_pools_by_voucher_pool_id_200.json
   ${voucher_pool_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0]['voucher_pool_id']}
   set global variable   ${voucher_pool_id}

get admin voucher pools by voucher pool id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  get admin voucher pools by voucher pool id  &{kwargs}
   expect status is 404  ${resp}  

put admin voucher pools by voucher pool id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  put admin voucher pools by voucher pool id  &{kwargs}
   expect status is 404  ${resp}  

put admin voucher pools by voucher pool id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  put admin voucher pools by voucher pool id  &{kwargs}
   expect status is 204  ${resp}  

put admin voucher pools by voucher pool id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  put admin voucher pools by voucher pool id  &{kwargs}
   expect status is 422  ${resp}  

