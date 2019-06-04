*** Settings ***
Documentation  wxmp_refund
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.refund.RefundLibrary
Suite Setup  login by unionid   ${unionid}
Force Tags  model:wxmp_refund  车主微信端


*** Test Cases ***
get user refunds Success 
   [Documentation]  接口名:user获取退款${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 Refund 列表。
   [Tags]           Respcode:200
   ${essential_params}  create dictionary  order_id=${order_id}  
   ${unessential_params}  create dictionary  
   run every case by params   get user refunds success 200   ${essential_params}  ${unessential_params}

get user refunds Fail With Wrong Params
   [Documentation]  接口名:user获取退款${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  order_id=${order_id_422}  
   ${unessential_params}  create dictionary  
   run every case by params   get user refunds fail 422   ${essential_params}  ${unessential_params}  success=False


*** Keywords ***
get user refunds Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get user refunds  &{kwargs}
   expect status is 200  ${resp}  wxmp_refund/get_user_refunds_200.json

get user refunds Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get user refunds  &{kwargs}
   expect status is 422  ${resp}  

