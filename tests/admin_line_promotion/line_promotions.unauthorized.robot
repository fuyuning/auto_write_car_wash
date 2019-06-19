*** Settings ***
Documentation  admin_line_promotion
Resource  ../resources.robot
Library  robot_car_wash_server_library.line_promotion.LinePromotionLibrary
Force Tags  model:admin_line_promotion  虾洗后台


*** Test Cases ***
get admin line promotions Fail Without Login
   [Documentation]  接口名:查询地推${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get admin line promotions fail 403     car_id=${car_id}  sex=${sex}  car_status=${car_status}  parking_id=${parking_id}  wash_status=${wash_status}  user_tag=${user_tag}  created_section=${created_section}  page_num=${page_num}  page_size=${page_size}  

get admin line promotions by lpr id Fail Without Login
   [Documentation]  接口名:查询地推记录${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get admin line promotions by lpr id fail 403     lpr_id=${lpr_id}

delete admin line promotions by lpr id Fail Without Login
   [Documentation]  接口名:删除${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   delete admin line promotions by lpr id fail 403     lpr_id=${lpr_id}


*** Variables ***
${lpr_id}  1a2b3c4d5e6f7zz


*** Keywords ***
get admin line promotions Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin line promotions  &{kwargs}
   expect status is 403  ${resp}  

get admin line promotions by lpr id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin line promotions by lpr id  &{kwargs}
   expect status is 403  ${resp}  

delete admin line promotions by lpr id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  delete admin line promotions by lpr id  &{kwargs}
   expect status is 403  ${resp}  

