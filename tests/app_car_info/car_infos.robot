*** Settings ***
Documentation  app_car_info
Resource  ../resources.robot
Library  robot_washing_expert_library.car_info.CarInfoLibrary
Suite Setup  Login  ${username}   ${password}
Force Tags  model:app_car_info  虾客APP


*** Test Cases ***
get car wash car infos Success 
   [Documentation]  接口名:车辆信息详情${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 CarInfo 列表。
   [Tags]           Respcode:200
   ${essential_params}  create dictionary  car_ids=${car_ids}  
   ${unessential_params}  create dictionary  
   run every case by params   get car wash car infos success 200   ${essential_params}  ${unessential_params}

get car wash car infos Fail With Wrong Params
   [Documentation]  接口名:车辆信息详情${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  car_ids=${car_ids_422}  
   ${unessential_params}  create dictionary  
   run every case by params   get car wash car infos fail 422   ${essential_params}  ${unessential_params}  success=False

put car wash car infos by car info id Success 
   [Documentation]  接口名:上传车辆图片${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  car_images=${car_images}  
   run every case by params   put car wash car infos by car info id success 204   ${essential_params}  ${unessential_params}    car_info_id=${car_info_id}

put car wash car infos by car info id Fail With Wrong Params
   [Documentation]  接口名:上传车辆图片${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  car_images=${car_images_422}  
   run every case by params   put car wash car infos by car info id fail 422   ${essential_params}  ${unessential_params}    car_info_id=${car_info_id}  success=False

put car wash car infos by car info id Fail With Wrong Url
   [Documentation]  接口名:上传车辆图片${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   put car wash car infos by car info id fail 404     car_info_id=${wrong_url_id}    car_images=${car_images}  


*** Variables ***
${car_info_id}  


*** Keywords ***
get car wash car infos Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get car wash car infos  &{kwargs}
   expect status is 200  ${resp}  app_car_info/get_car_wash_car_infos_200.json
   ${car_info_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0]['car_info_id']}
   set global variable   ${car_info_id}

get car wash car infos Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get car wash car infos  &{kwargs}
   expect status is 422  ${resp}  

put car wash car infos by car info id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  put car wash car infos by car info id  &{kwargs}
   expect status is 204  ${resp}  

put car wash car infos by car info id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  put car wash car infos by car info id  &{kwargs}
   expect status is 422  ${resp}  

put car wash car infos by car info id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  put car wash car infos by car info id  &{kwargs}
   expect status is 404  ${resp}  

