*** Settings ***
Documentation  admin_voucher
Resource  ../resources.robot
Library  robot_car_wash_server_library.voucher.VoucherLibrary
Suite Setup  Login  ${username}   ${password}
Suite Teardown  Logout
Force Tags  model:admin_voucher  虾洗后台


*** Test Cases ***
get admin vouchers Success 
   [Documentation]  接口名:获取洗车券记录${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 Voucher 列表。
   [Tags]           Respcode:200
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  name=${name}  user_id=${user_id}  car_id=${car_id}  mobile=${mobile}  status=${status}  section=${section}  page_num=${page_num}  page_size=${page_size}  
   run every case by params   get admin vouchers success 200   ${essential_params}  ${unessential_params}

get admin vouchers Fail With Wrong Params
   [Documentation]  接口名:获取洗车券记录${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  name=${name_422}  user_id=${user_id_422}  car_id=${car_id_422}  mobile=${mobile_422}  status=${status_422}  section=${section_422}  page_num=${page_num_422}  page_size=${page_size_422}  
   run every case by params   get admin vouchers fail 422   ${essential_params}  ${unessential_params}  success=False


*** Keywords ***
get admin vouchers Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin vouchers  &{kwargs}
   expect status is 200  ${resp}  admin_voucher/get_admin_vouchers_200.json

get admin vouchers Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get admin vouchers  &{kwargs}
   expect status is 422  ${resp}  

