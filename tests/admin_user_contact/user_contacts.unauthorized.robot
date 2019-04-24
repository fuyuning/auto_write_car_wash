*** Settings ***
Documentation  admin_user_contact
Resource  ../resources.robot
Library  robot_car_wash_server_library.user_contact.UserContactLibrary
Force Tags  model:admin_user_contact  虾洗后台


*** Test Cases ***
Get Admin User Contacts Fail Without Login
   [Documentation]  接口名:查询联系方式${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  user_id=${user_id}  
   run every case by params  Get Admin User Contacts Fail 403  ${essential_params}  ${unessential_params}


*** Keywords ***
Get Admin User Contacts Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin User Contacts   &{kwargs}
   expect status is 403  ${resp}  

