*** Settings ***
Documentation  wxmp_voucher_pool
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.voucher_pool.VoucherPoolLibrary
Suite Setup  login by unionid   ${unionid}
Force Tags  model:wxmp_voucher_pool  车主微信端


*** Test Cases ***
get voucher pools Success 
   [Documentation]  接口名:查询可买洗车劵${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 VoucherPool 列表。
   [Tags]           Respcode:200
    get voucher pools success 200


*** Keywords ***
get voucher pools Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get voucher pools  &{kwargs}
   expect status is 200  ${resp}  wxmp_voucher_pool/get_voucher_pools_200.json

