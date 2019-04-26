*** Settings ***
Documentation  wxmp_car_brand
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.car_brand.CarBrandLibrary
Force Tags  model:wxmp_car_brand  车主微信端


*** Test Cases ***
Get Car Brands Fail Without Login
   [Documentation]  接口名:品牌列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  popular_brand=${popular_brand}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get Car Brands Fail 403  ${essential_params}  ${unessential_params}


*** Keywords ***
Get Car Brands Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get Car Brands   &{kwargs}
   expect status is 403  ${resp}  

