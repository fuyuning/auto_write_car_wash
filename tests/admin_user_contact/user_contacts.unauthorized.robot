*** Settings ***
Documentation  admin_user_contact
Resource  ../resources.robot
Library  robot_car_wash_server_library.user_contact.UserContactLibrary
Force Tags  model:admin_user_contact  虾洗后台


*** Test Cases ***
get admin user contacts Fail Without Login
   [Documentation]  接口名:查询联系方式${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get admin user contacts fail 403     user_id=${user_id}  


*** Keywords ***
get admin user contacts Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin user contacts  &{kwargs}
   expect status is 403  ${resp}  

