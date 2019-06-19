*** Settings ***
Documentation  wxmp_voucher_pool
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.voucher_pool.VoucherPoolLibrary
Force Tags  model:wxmp_voucher_pool  车主微信端


*** Test Cases ***
get voucher pools Fail Without Login
   [Documentation]  接口名:查询可买洗车劵${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
    get voucher pools fail 403


*** Keywords ***
get voucher pools Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get voucher pools  &{kwargs}
   expect status is 403  ${resp}  

