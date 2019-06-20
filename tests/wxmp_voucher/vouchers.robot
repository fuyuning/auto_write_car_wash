*** Settings ***
Documentation  wxmp_voucher
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.voucher.VoucherLibrary
Suite Setup  login by unionid   ${unionid}
Force Tags  model:wxmp_voucher  车主微信端


*** Test Cases ***
get user vouchers Success 
   [Documentation]  接口名:我的洗车券${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 Voucher 列表。
   [Tags]           Respcode:200
   ${essential_params}  create dictionary  status=${status}  
   ${unessential_params}  create dictionary  section=${section}  page_limit=${page_limit}  
   run every case by params   get user vouchers success 200   ${essential_params}  ${unessential_params}

get user vouchers Fail With Wrong Params
   [Documentation]  接口名:我的洗车券${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  status=${status_422}  
   ${unessential_params}  create dictionary  section=${section_422}  page_limit=${page_limit_422}  
   run every case by params   get user vouchers fail 422   ${essential_params}  ${unessential_params}  success=False

get user vouchers usable Success 
   [Documentation]  接口名:我本单能用的一张洗车券${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 Voucher 列表。
   [Tags]           Respcode:200
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  service_type=${service_type}  service_group_id=${service_group_id}  
   run every case by params   get user vouchers usable success 200   ${essential_params}  ${unessential_params}

get user vouchers usable Fail With Wrong Params
   [Documentation]  接口名:我本单能用的一张洗车券${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  service_type=${service_type_422}  service_group_id=${service_group_id_422}  
   run every case by params   get user vouchers usable fail 422   ${essential_params}  ${unessential_params}  success=False


*** Keywords ***
get user vouchers Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get user vouchers  &{kwargs}
   expect status is 200  ${resp}  wxmp_voucher/get_user_vouchers_200.json

get user vouchers Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get user vouchers  &{kwargs}
   expect status is 422  ${resp}  

get user vouchers usable Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get user vouchers usable  &{kwargs}
   expect status is 200  ${resp}  wxmp_voucher/get_user_vouchers_usable_200.json

get user vouchers usable Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get user vouchers usable  &{kwargs}
   expect status is 422  ${resp}  

