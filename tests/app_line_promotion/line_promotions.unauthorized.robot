*** Settings ***
Documentation  app_line_promotion
Resource  ../resources.robot
Library  robot_washing_expert_library.line_promotion.LinePromotionLibrary
Force Tags  model:app_line_promotion  虾客APP


*** Test Cases ***
post car wash line promotions Fail Without Login
   [Documentation]  接口名:添加${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   post car wash line promotions fail 403   car_id=${car_id}  parking_id=${parking_id}  user_tag=${user_tag}    sex=${sex}  age=${age}  description=${description}  

get car wash line promotions records Fail Without Login
   [Documentation]  接口名:查询地推${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get car wash line promotions records fail 403     car_id=${car_id}  

get car wash line promotions wash Fail Without Login
   [Documentation]  接口名:查询洗车${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get car wash line promotions wash fail 403     car_id=${car_id}  


*** Keywords ***
post car wash line promotions Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post car wash line promotions  &{kwargs}
   expect status is 403  ${resp}  

get car wash line promotions records Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get car wash line promotions records  &{kwargs}
   expect status is 403  ${resp}  

get car wash line promotions wash Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get car wash line promotions wash  &{kwargs}
   expect status is 403  ${resp}  

