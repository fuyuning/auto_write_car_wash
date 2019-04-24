*** Settings ***
Documentation  wxmp_car_brand
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.car_brand.CarBrandLibrary
Suite Setup  Login By Openid  ${openid}
Force Tags  model:wxmp_car_brand  车主微信端


*** Test Cases ***
Get Car Brands Success 
   [Documentation]  接口名:品牌列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 CarBrand 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  
   ${unessential_params}  create list  popular_brand=${popular_brand}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get Car Brands Success 200  ${essential_params}  ${unessential_params}

Get Car Brands Fail With Wrong Params
   [Documentation]  接口名:品牌列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  popular_brand=${popular_brand}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get Car Brands Fail 422  ${essential_params}  ${unessential_params}


*** Keywords ***
Get Car Brands Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Get Car Brands   &{kwargs}
   expect status is 200  ${resp}  wxmp_car_brand/Get_Car_Brands_200.json

Get Car Brands Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Get Car Brands   &{kwargs}
   expect status is 422  ${resp}  

