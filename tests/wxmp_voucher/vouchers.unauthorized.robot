*** Settings ***
Documentation  wxmp_voucher
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.voucher.VoucherLibrary
Force Tags  model:wxmp_voucher  车主微信端


*** Test Cases ***
get user vouchers Fail Without Login
   [Documentation]  接口名:我的洗车券${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get user vouchers fail 403   status=${status}    section=${section}  page_limit=${page_limit}  


*** Keywords ***
get user vouchers Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get user vouchers  &{kwargs}
   expect status is 403  ${resp}  

