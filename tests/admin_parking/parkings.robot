*** Settings ***
Documentation  admin_parking
Resource  ../resources.robot
Library  robot_car_wash_server_library.parking.ParkingLibrary
Suite Setup  Login  ${admin_username}   ${admin_password}
Suite Teardown  Logout
Force Tags  model:admin_parking  虾洗后台


*** Test Cases ***
post admin parkings Success 
   [Documentation]  接口名:添加停车场信息${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 201,返回的Json数据符合验证。
   [Tags]           Respcode:201
   ${essential_params}  create list  parking_name=${parking_name}  position=${position}  
   ${unessential_params}  create list  alias_name=${alias_name}  wash_area_id=${wash_area_id}  out_parking_id=${out_parking_id}  enabled=False  lon=${lon}  lat=${lat}  parking_banners=${parking_banners}  use_home_banner=False  service_introduce=${service_introduce}  address=${address}  use_home_illustrate=False  province=${province}  city=${city}  district=${district}  
   run every case by params  post admin parkings Success 201  ${essential_params}  ${unessential_params}

post admin parkings Fail With Wrong Params
   [Documentation]  接口名:添加停车场信息${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  parking_name=${parking_name_422}  position=${position_422}  
   ${unessential_params}  create list  alias_name=${alias_name_422}  wash_area_id=${wash_area_id_422}  out_parking_id=${out_parking_id_422}  enabled=ThisIsRobot!  lon=${lon_422}  lat=${lat_422}  parking_banners=${parking_banners_422}  use_home_banner=ThisIsRobot!  service_introduce=${service_introduce_422}  address=${address_422}  use_home_illustrate=ThisIsRobot!  province=${province_422}  city=${city_422}  district=${district_422}  
   run every case by params  post admin parkings Fail 422  ${essential_params}  ${unessential_params}  success=False

get admin parkings Success 
   [Documentation]  接口名:停车场信息列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 Parking 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  
   ${unessential_params}  create list  parking_name=${parking_name}  wash_area_id=${wash_area_id}  enabled=False  page_num=${page_num}  page_size=${page_size}  
   run every case by params  get admin parkings Success 200  ${essential_params}  ${unessential_params}

get admin parkings Fail With Wrong Params
   [Documentation]  接口名:停车场信息列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  parking_name=${parking_name_422}  wash_area_id=${wash_area_id_422}  enabled=ThisIsRobot!  page_num=${page_num_422}  page_size=${page_size_422}  
   run every case by params  get admin parkings Fail 422  ${essential_params}  ${unessential_params}  success=False

get admin parkings by parking id Fail With Wrong Url
   [Documentation]  接口名:停车场信息详情${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   get admin parkings by parking id Fail 404    parking_id=${wrong_url_id}

get admin parkings by parking id Success 
   [Documentation]  接口名:停车场信息详情${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 Parking 对象。
   [Tags]           Respcode:200
   get admin parkings by parking id Success 200    parking_id=${parking_id}

put admin parkings by parking id Success 
   [Documentation]  接口名:修改停车场信息${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create list  parking_name=${parking_name}  position=${position}  
   ${unessential_params}  create list  alias_name=${alias_name}  wash_area_id=${wash_area_id}  out_parking_id=${out_parking_id}  enabled=False  lon=${lon}  lat=${lat}  parking_banners=${parking_banners}  use_home_banner=False  service_introduce=${service_introduce}  address=${address}  use_home_illustrate=False  province=${province}  city=${city}  district=${district}  
   run every case by params  put admin parkings by parking id Success 204  ${essential_params}  ${unessential_params}    parking_id=${parking_id}

put admin parkings by parking id Fail With Wrong Url
   [Documentation]  接口名:修改停车场信息${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  parking_name=${parking_name}  position=${position}  
   ${unessential_params}  create list  alias_name=${alias_name}  wash_area_id=${wash_area_id}  out_parking_id=${out_parking_id}  enabled=False  lon=${lon}  lat=${lat}  parking_banners=${parking_banners}  use_home_banner=False  service_introduce=${service_introduce}  address=${address}  use_home_illustrate=False  province=${province}  city=${city}  district=${district}  
   run every case by params  put admin parkings by parking id Fail 404  ${essential_params}  ${unessential_params}    parking_id=${wrong_url_id}

put admin parkings by parking id Fail With Wrong Params
   [Documentation]  接口名:修改停车场信息${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  parking_name=${parking_name_422}  position=${position_422}  
   ${unessential_params}  create list  alias_name=${alias_name_422}  wash_area_id=${wash_area_id_422}  out_parking_id=${out_parking_id_422}  enabled=ThisIsRobot!  lon=${lon_422}  lat=${lat_422}  parking_banners=${parking_banners_422}  use_home_banner=ThisIsRobot!  service_introduce=${service_introduce_422}  address=${address_422}  use_home_illustrate=ThisIsRobot!  province=${province_422}  city=${city_422}  district=${district_422}  
   run every case by params  put admin parkings by parking id Fail 422  ${essential_params}  ${unessential_params}    parking_id=${parking_id}  success=False

patch admin parkings enabled by parking id Fail With Wrong Url
   [Documentation]  接口名:停车场服务状态${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  enabled=False  
   ${unessential_params}  create list  
   run every case by params  patch admin parkings enabled by parking id Fail 404  ${essential_params}  ${unessential_params}    parking_id=${wrong_url_id}

patch admin parkings enabled by parking id Success 
   [Documentation]  接口名:停车场服务状态${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create list  enabled=False  
   ${unessential_params}  create list  
   run every case by params  patch admin parkings enabled by parking id Success 204  ${essential_params}  ${unessential_params}    parking_id=${parking_id}

patch admin parkings enabled by parking id Fail With Wrong Params
   [Documentation]  接口名:停车场服务状态${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  enabled=ThisIsRobot!  
   ${unessential_params}  create list  
   run every case by params  patch admin parkings enabled by parking id Fail 422  ${essential_params}  ${unessential_params}    parking_id=${parking_id}  success=False

delete admin parkings by parking id Fail With Wrong Url
   [Documentation]  接口名:删除停车场信息${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   delete admin parkings by parking id Fail 404    parking_id=${wrong_url_id}

delete admin parkings by parking id Success 
   [Documentation]  接口名:删除停车场信息${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   delete admin parkings by parking id Success 204    parking_id=${parking_id}


*** Variables ***
${parking_id}  


*** Keywords ***
post admin parkings Success 201
   [Arguments]  &{kwargs}
   ${resp}=  post admin parkings  &{kwargs}
   expect status is 201  ${resp}  admin_parking/post_admin_parkings_201.json
   ${parking_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][parking_id]}
   set global variable   ${parking_id}

post admin parkings Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post admin parkings  &{kwargs}
   expect status is 422  ${resp}  

get admin parkings Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin parkings  &{kwargs}
   expect status is 200  ${resp}  admin_parking/get_admin_parkings_200.json
   ${parking_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][parking_id]}
   set global variable   ${parking_id}

get admin parkings Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get admin parkings  &{kwargs}
   expect status is 422  ${resp}  

get admin parkings by parking id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  get admin parkings by parking id  &{kwargs}
   expect status is 404  ${resp}  

get admin parkings by parking id Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin parkings by parking id  &{kwargs}
   expect status is 200  ${resp}  admin_parking/get_admin_parkings_by_parking_id_200.json
   ${parking_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][parking_id]}
   set global variable   ${parking_id}

put admin parkings by parking id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  put admin parkings by parking id  &{kwargs}
   expect status is 204  ${resp}  

put admin parkings by parking id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  put admin parkings by parking id  &{kwargs}
   expect status is 404  ${resp}  

put admin parkings by parking id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  put admin parkings by parking id  &{kwargs}
   expect status is 422  ${resp}  

patch admin parkings enabled by parking id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  patch admin parkings enabled by parking id  &{kwargs}
   expect status is 404  ${resp}  

patch admin parkings enabled by parking id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  patch admin parkings enabled by parking id  &{kwargs}
   expect status is 204  ${resp}  

patch admin parkings enabled by parking id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  patch admin parkings enabled by parking id  &{kwargs}
   expect status is 422  ${resp}  

delete admin parkings by parking id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  delete admin parkings by parking id  &{kwargs}
   expect status is 404  ${resp}  

delete admin parkings by parking id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  delete admin parkings by parking id  &{kwargs}
   expect status is 204  ${resp}  

