*** Settings ***
Documentation  admin_user_contact
Resource  ../resources.robot
Library  robot_car_wash_server_library.user_contact.UserContactLibrary
Suite Setup  Login  ${admin_username}   ${admin_password}
Suite Teardown  Logout
Force Tags  model:admin_user_contact  虾洗后台


*** Test Cases ***
get admin user contacts Success 
   [Documentation]  接口名:查询联系方式${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 UserContact 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  
   ${unessential_params}  create list  user_id=${user_id}  
   run every case by params  get admin user contacts Success 200  ${essential_params}  ${unessential_params}

get admin user contacts Fail With Wrong Params
   [Documentation]  接口名:查询联系方式${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  user_id=${user_id_422}  
   run every case by params  get admin user contacts Fail 422  ${essential_params}  ${unessential_params}  success=False


*** Keywords ***
get admin user contacts Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin user contacts  &{kwargs}
   expect status is 200  ${resp}  admin_user_contact/get_admin_user_contacts_200.json

get admin user contacts Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get admin user contacts  &{kwargs}
   expect status is 422  ${resp}  

