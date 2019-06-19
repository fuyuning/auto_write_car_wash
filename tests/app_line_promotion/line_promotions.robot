*** Settings ***
Documentation  app_line_promotion
Resource  ../resources.robot
Library  robot_washing_expert_library.line_promotion.LinePromotionLibrary
Suite Setup  Login  ${username}   ${password}
Force Tags  model:app_line_promotion  虾客APP


*** Test Cases ***
post car wash line promotions Fail With Wrong Params
   [Documentation]  接口名:添加${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  car_id=${car_id_422}  parking_id=${parking_id_422}  user_tag=${user_tag_422}  
   ${unessential_params}  create dictionary  sex=${sex_422}  age=${age_422}  description=${description_422}  
   run every case by params   post car wash line promotions fail 422   ${essential_params}  ${unessential_params}  success=False

post car wash line promotions Success 
   [Documentation]  接口名:添加${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 201,返回的Json数据符合验证。
   [Tags]           Respcode:201
   ${essential_params}  create dictionary  car_id=${car_id}  parking_id=${parking_id}  user_tag=${user_tag}  
   ${unessential_params}  create dictionary  sex=${sex}  age=${age}  description=${description}  
   run every case by params   post car wash line promotions success 201   ${essential_params}  ${unessential_params}

get car wash line promotions records Success 
   [Documentation]  接口名:查询地推${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 LinePromotionRecord 列表。
   [Tags]           Respcode:200
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  car_id=${car_id}  
   run every case by params   get car wash line promotions records success 200   ${essential_params}  ${unessential_params}

get car wash line promotions records Fail With Wrong Params
   [Documentation]  接口名:查询地推${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  car_id=${car_id_422}  
   run every case by params   get car wash line promotions records fail 422   ${essential_params}  ${unessential_params}  success=False

get car wash line promotions wash Success 
   [Documentation]  接口名:查询洗车${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 WashRecord 列表。
   [Tags]           Respcode:200
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  car_id=${car_id}  
   run every case by params   get car wash line promotions wash success 200   ${essential_params}  ${unessential_params}

get car wash line promotions wash Fail With Wrong Params
   [Documentation]  接口名:查询洗车${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  car_id=${car_id_422}  
   run every case by params   get car wash line promotions wash fail 422   ${essential_params}  ${unessential_params}  success=False


*** Keywords ***
post car wash line promotions Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post car wash line promotions  &{kwargs}
   expect status is 422  ${resp}  

post car wash line promotions Success 201
   [Arguments]  &{kwargs}
   ${resp}=  post car wash line promotions  &{kwargs}
   expect status is 201  ${resp}  app_line_promotion/post_car_wash_line_promotions_201.json

get car wash line promotions records Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get car wash line promotions records  &{kwargs}
   expect status is 200  ${resp}  app_line_promotion/get_car_wash_line_promotions_records_200.json

get car wash line promotions records Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get car wash line promotions records  &{kwargs}
   expect status is 422  ${resp}  

get car wash line promotions wash Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get car wash line promotions wash  &{kwargs}
   expect status is 200  ${resp}  app_line_promotion/get_car_wash_line_promotions_wash_200.json

get car wash line promotions wash Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get car wash line promotions wash  &{kwargs}
   expect status is 422  ${resp}  

