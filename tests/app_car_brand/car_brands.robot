*** Settings ***
Documentation  app_car_brand
Resource  ../resources.robot
Library  robot_washing_expert_library.car_brand.CarBrandLibrary
Suite Setup  Login  ${username}   ${password}
Force Tags  model:app_car_brand  虾客APP


*** Test Cases ***
get car wash car brands Success 
   [Documentation]  接口名:品牌列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 CarBrand 列表。
   [Tags]           Respcode:200
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  page_num=${page_num}  page_size=${page_size}  
   run every case by params   get car wash car brands success 200   ${essential_params}  ${unessential_params}

get car wash car brands Fail With Wrong Params
   [Documentation]  接口名:品牌列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  page_num=${page_num_422}  page_size=${page_size_422}  
   run every case by params   get car wash car brands fail 422   ${essential_params}  ${unessential_params}  success=False


*** Keywords ***
get car wash car brands Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get car wash car brands  &{kwargs}
   expect status is 200  ${resp}  app_car_brand/get_car_wash_car_brands_200.json

get car wash car brands Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get car wash car brands  &{kwargs}
   expect status is 422  ${resp}  

