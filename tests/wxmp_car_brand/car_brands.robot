*** Settings ***
Documentation  wxmp_car_brand
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.car_brand.CarBrandLibrary
Suite Setup  Login By Openid  ${openid}

Force Tags  model:wxmp_car_brand  车主微信端


*** Test Cases ***
Get car_brand Fail Without Login
   [Documentation]  接口名:品牌列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  popular_brand=${popular_brand}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get car brands Fail 403  ${essential_params}  ${unessential_params}



Get car_brand Success 
   [Documentation]  接口名:品牌列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 CarBrand 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  
   ${unessential_params}  create list  popular_brand=${popular_brand}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get car brands Success 200  ${essential_params}  ${unessential_params}



Get car_brand Fail With Wrong Params
   [Documentation]  接口名:品牌列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  popular_brand=${popular_brand}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get car brands Fail 422  ${essential_params}  ${unessential_params}



*** Variables ***


*** Keywords ***
Get Car brands Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get car brands   &{kwargs}
   expect status is 403  ${resp}  

Get Car brands Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get car brands   &{kwargs}
   expect status is 200  ${resp}  wxmp_car_brand/Get_Car_brands_200.json

Get Car brands Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get car brands   &{kwargs}
   expect status is 422  ${resp}  

