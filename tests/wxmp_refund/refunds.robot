*** Settings ***
Documentation  wxmp_refund
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.refund.RefundLibrary
Suite Setup  Login By Openid  ${openid}
Force Tags  model:wxmp_refund  车主微信端


*** Test Cases ***
Get User Refunds Success 
   [Documentation]  接口名:user获取退款${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 Refund 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  order_id=${order_id}  
   ${unessential_params}  create list  
   run every case by params  Get User Refunds Success 200  ${essential_params}  ${unessential_params}

Get User Refunds Fail With Wrong Params
   [Documentation]  接口名:user获取退款${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  order_id=${order_id}  
   ${unessential_params}  create list  
   run every case by params  Get User Refunds Fail 422  ${essential_params}  ${unessential_params}


*** Keywords ***
Get User Refunds Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Get User Refunds   &{kwargs}
   expect status is 200  ${resp}  wxmp_refund/Get_User_Refunds_200.json

Get User Refunds Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Get User Refunds   &{kwargs}
   expect status is 422  ${resp}  

