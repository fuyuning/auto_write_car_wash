*** Settings ***
Documentation  admin_voucher
Resource  ../resources.robot
Library  robot_car_wash_server_library.voucher.VoucherLibrary
Force Tags  model:admin_voucher  虾洗后台


*** Test Cases ***
get admin vouchers Fail Without Login
   [Documentation]  接口名:获取洗车券记录${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get admin vouchers fail 403     name=${name}  user_id=${user_id}  car_id=${car_id}  mobile=${mobile}  status=${status}  section=${section}  page_num=${page_num}  page_size=${page_size}  


*** Keywords ***
get admin vouchers Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin vouchers  &{kwargs}
   expect status is 403  ${resp}  

