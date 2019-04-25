*** Settings ***
Documentation  admin_parking
Resource  ../resources.robot
Library  robot_car_wash_server_library.parking.ParkingLibrary
Suite Setup  Login  ${admin_username}   ${admin_password}
Suite Teardown  Logout
Force Tags  model:admin_parking  虾洗后台


*** Test Cases ***
Post Admin Parkings Success 
   [Documentation]  接口名:添加停车场信息${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 201,返回的Json数据符合验证。
   [Tags]           Respcode:201
   ${essential_params}  create list  parking_name=${parking_name}  position=${position}  
   ${unessential_params}  create list  alias_name=${alias_name}  wash_area_id=${wash_area_id}  out_parking_id=${out_parking_id}  enabled=False  lon=${lon}  lat=${lat}  parking_banners=${parking_banners}  use_home_banner=False  service_introduce=${service_introduce}  address=${address}  use_home_illustrate=False  province=${province}  city=${city}  district=${district}  
   run every case by params  Post Admin Parkings Success 201  ${essential_params}  ${unessential_params}

Post Admin Parkings Fail With Wrong Params
   [Documentation]  接口名:添加停车场信息${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  parking_name=${parking_name_422}  position=${position_422}  
   ${unessential_params}  create list  alias_name=${alias_name_422}  wash_area_id=${wash_area_id_422}  out_parking_id=${out_parking_id_422}  enabled=ThisIsRobot!  lon=${lon_422}  lat=${lat_422}  parking_banners=${parking_banners_422}  use_home_banner=ThisIsRobot!  service_introduce=${service_introduce_422}  address=${address_422}  use_home_illustrate=ThisIsRobot!  province=${province_422}  city=${city_422}  district=${district_422}  
   run every case by params  Post Admin Parkings Fail 422  ${essential_params}  ${unessential_params}

Get Admin Parkings Success 
   [Documentation]  接口名:停车场信息列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 Parking 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  
   ${unessential_params}  create list  parking_name=${parking_name}  wash_area_id=${wash_area_id}  enabled=False  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get Admin Parkings Success 200  ${essential_params}  ${unessential_params}

Get Admin Parkings Fail With Wrong Params
   [Documentation]  接口名:停车场信息列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  parking_name=${parking_name_422}  wash_area_id=${wash_area_id_422}  enabled=ThisIsRobot!  page_num=${page_num_422}  page_size=${page_size_422}  
   run every case by params  Get Admin Parkings Fail 422  ${essential_params}  ${unessential_params}

Get Admin Parkings By Parking Id Fail With Wrong Url
   [Documentation]  接口名:停车场信息详情${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   Get Admin Parkings By Parking Id Fail 404  parking_id=${wrong_url_id}

Get Admin Parkings By Parking Id Success 
   [Documentation]  接口名:停车场信息详情${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 Parking 对象。
   [Tags]           Respcode:200
   Get Admin Parkings By Parking Id Success 200  parking_id=${parking_id}

Put Admin Parkings By Parking Id Success 
   [Documentation]  接口名:修改停车场信息${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create list  parking_name=${parking_name}  position=${position}  
   ${unessential_params}  create list  alias_name=${alias_name}  wash_area_id=${wash_area_id}  out_parking_id=${out_parking_id}  enabled=False  lon=${lon}  lat=${lat}  parking_banners=${parking_banners}  use_home_banner=False  service_introduce=${service_introduce}  address=${address}  use_home_illustrate=False  province=${province}  city=${city}  district=${district}  
   run every case by params  Put Admin Parkings By Parking Id Success 204  ${essential_params}  ${unessential_params}  parking_id=${parking_id}

Put Admin Parkings By Parking Id Fail With Wrong Url
   [Documentation]  接口名:修改停车场信息${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  parking_name=${parking_name}  position=${position}  
   ${unessential_params}  create list  alias_name=${alias_name}  wash_area_id=${wash_area_id}  out_parking_id=${out_parking_id}  enabled=False  lon=${lon}  lat=${lat}  parking_banners=${parking_banners}  use_home_banner=False  service_introduce=${service_introduce}  address=${address}  use_home_illustrate=False  province=${province}  city=${city}  district=${district}  
   run every case by params  Put Admin Parkings By Parking Id Fail 404  ${essential_params}  ${unessential_params}  parking_id=${wrong_url_id}

Put Admin Parkings By Parking Id Fail With Wrong Params
   [Documentation]  接口名:修改停车场信息${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  parking_name=${parking_name_422}  position=${position_422}  
   ${unessential_params}  create list  alias_name=${alias_name_422}  wash_area_id=${wash_area_id_422}  out_parking_id=${out_parking_id_422}  enabled=ThisIsRobot!  lon=${lon_422}  lat=${lat_422}  parking_banners=${parking_banners_422}  use_home_banner=ThisIsRobot!  service_introduce=${service_introduce_422}  address=${address_422}  use_home_illustrate=ThisIsRobot!  province=${province_422}  city=${city_422}  district=${district_422}  
   run every case by params  Put Admin Parkings By Parking Id Fail 422  ${essential_params}  ${unessential_params}  parking_id=${parking_id}

Patch Enabled By Parking Id Fail With Wrong Url
   [Documentation]  接口名:停车场服务状态${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  enabled=False  
   ${unessential_params}  create list  
   run every case by params  Patch Enabled By Parking Id Fail 404  ${essential_params}  ${unessential_params}  parking_id/enabled=${wrong_url_id}

Patch Enabled By Parking Id Success 
   [Documentation]  接口名:停车场服务状态${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create list  enabled=False  
   ${unessential_params}  create list  
   run every case by params  Patch Enabled By Parking Id Success 204  ${essential_params}  ${unessential_params}  parking_id/enabled=${parking_id/enabled}

Patch Enabled By Parking Id Fail With Wrong Params
   [Documentation]  接口名:停车场服务状态${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  enabled=ThisIsRobot!  
   ${unessential_params}  create list  
   run every case by params  Patch Enabled By Parking Id Fail 422  ${essential_params}  ${unessential_params}  parking_id/enabled=${parking_id/enabled}

Delete Admin Parkings By Parking Id Fail With Wrong Url
   [Documentation]  接口名:删除停车场信息${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   Delete Admin Parkings By Parking Id Fail 404  parking_id=${wrong_url_id}

Delete Admin Parkings By Parking Id Success 
   [Documentation]  接口名:删除停车场信息${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   Delete Admin Parkings By Parking Id Success 204  parking_id=${parking_id}


*** Variables ***
${parking_id}  
${parking_id/enabled}  


*** Keywords ***
Post Admin Parkings Success 201
   [Arguments]  &{kwargs}
   ${resp}=  Post Admin Parkings   &{kwargs}
   expect status is 201  ${resp}  admin_parking/Post_Admin_Parkings_201.json
   ${parking_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][parking_id]}
   set global variable   ${parking_id}
   ${parking_id/enabled}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][parking_id/enabled]}
   set global variable   ${parking_id/enabled}

Post Admin Parkings Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Post Admin Parkings   &{kwargs}
   expect status is 422  ${resp}  

Get Admin Parkings Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Parkings   &{kwargs}
   expect status is 200  ${resp}  admin_parking/Get_Admin_Parkings_200.json
   ${parking_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][parking_id]}
   set global variable   ${parking_id}
   ${parking_id/enabled}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][parking_id/enabled]}
   set global variable   ${parking_id/enabled}

Get Admin Parkings Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Parkings   &{kwargs}
   expect status is 422  ${resp}  

Get Admin Parkings By Parking Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Parkings By Parking Id   &{kwargs}
   expect status is 404  ${resp}  

Get Admin Parkings By Parking Id Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Parkings By Parking Id   &{kwargs}
   expect status is 200  ${resp}  admin_parking/Get_Admin_Parkings_By_Parking_Id_200.json
   ${parking_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][parking_id]}
   set global variable   ${parking_id}
   ${parking_id/enabled}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][parking_id/enabled]}
   set global variable   ${parking_id/enabled}

Put Admin Parkings By Parking Id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  Put Admin Parkings By Parking Id   &{kwargs}
   expect status is 204  ${resp}  

Put Admin Parkings By Parking Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  Put Admin Parkings By Parking Id   &{kwargs}
   expect status is 404  ${resp}  

Put Admin Parkings By Parking Id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Put Admin Parkings By Parking Id   &{kwargs}
   expect status is 422  ${resp}  

Patch Enabled By Parking Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  Patch Enabled By Parking Id   &{kwargs}
   expect status is 404  ${resp}  

Patch Enabled By Parking Id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  Patch Enabled By Parking Id   &{kwargs}
   expect status is 204  ${resp}  

Patch Enabled By Parking Id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Patch Enabled By Parking Id   &{kwargs}
   expect status is 422  ${resp}  

Delete Admin Parkings By Parking Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  Delete Admin Parkings By Parking Id   &{kwargs}
   expect status is 404  ${resp}  

Delete Admin Parkings By Parking Id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  Delete Admin Parkings By Parking Id   &{kwargs}
   expect status is 204  ${resp}  

