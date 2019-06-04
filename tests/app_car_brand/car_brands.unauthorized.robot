*** Settings ***
Documentation  app_car_brand
Resource  ../resources.robot
Library  robot_washing_expert_library.car_brand.CarBrandLibrary
Force Tags  model:app_car_brand  虾客APP


*** Test Cases ***
get car wash car brands Fail Without Login
   [Documentation]  接口名:品牌列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get car wash car brands fail 403     page_num=${page_num}  page_size=${page_size}  


*** Keywords ***
get car wash car brands Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get car wash car brands  &{kwargs}
   expect status is 403  ${resp}  

