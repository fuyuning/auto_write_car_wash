*** Settings ***
Documentation  admin_refund
Resource  ../resources.robot
Library  robot_car_wash_server_library.refund.RefundLibrary
Suite Setup  Login  ${admin_username}   ${admin_password}
Suite Teardown  Logout
Force Tags  model:admin_refund  虾洗后台


*** Test Cases ***
get admin refunds Success 
   [Documentation]  接口名:获取退款${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 Refund 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  order_id=${order_id}  
   ${unessential_params}  create list  
   run every case by params  get admin refunds Success 200  ${essential_params}  ${unessential_params}

get admin refunds Fail With Wrong Params
   [Documentation]  接口名:获取退款${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  order_id=${order_id_422}  
   ${unessential_params}  create list  
   run every case by params  get admin refunds Fail 422  ${essential_params}  ${unessential_params}  success=False


*** Keywords ***
get admin refunds Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin refunds  &{kwargs}
   expect status is 200  ${resp}  admin_refund/get_admin_refunds_200.json

get admin refunds Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get admin refunds  &{kwargs}
   expect status is 422  ${resp}  

