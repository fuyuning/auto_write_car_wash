*** Settings ***
Documentation  admin_car_info
Resource  ../resources.robot
Library  robot_car_wash_server_library.car_info.CarInfoLibrary
Suite Setup  Login  ${admin_username}   ${admin_password}
Suite Teardown  Logout
Force Tags  model:admin_car_info  虾洗后台


*** Test Cases ***
Post car Infos import Success 
   [Documentation]  接口名:文件上传${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为  列表。
   [Tags]           Respcode:200
    Post car Infos import Success 200

Get Admin Car Infos Success 
   [Documentation]  接口名:车辆信息列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 CarInfo 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  
   ${unessential_params}  create list  car_id=${car_id}  car_type=${car_type}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get Admin Car Infos Success 200  ${essential_params}  ${unessential_params}

Get Admin Car Infos Fail With Wrong Params
   [Documentation]  接口名:车辆信息列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  car_id=${car_id_422}  car_type=${car_type_422}  page_num=${page_num_422}  page_size=${page_size_422}  
   run every case by params  Get Admin Car Infos Fail 422  ${essential_params}  ${unessential_params}

Get Admin Car Infos By Car Info Id Fail With Wrong Url
   [Documentation]  接口名:车辆信息详情${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   Get Admin Car Infos By Car Info Id Fail 404  car_info_id=${wrong_url_id}

Get Admin Car Infos By Car Info Id Success 
   [Documentation]  接口名:车辆信息详情${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 CarInfo 对象。
   [Tags]           Respcode:200
   Get Admin Car Infos By Car Info Id Success 200  car_info_id=${car_info_id}

Put Admin Car Infos By Car Info Id Success 
   [Documentation]  接口名:修改车辆信息${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create list  car_id=${car_id}  
   ${unessential_params}  create list  car_type=${car_type}  car_brand=${car_brand}  car_series=${car_series}  car_color=${car_color}  car_frame_no=${car_frame_no}  licensed_time=${licensed_time}  car_year=${car_year}  car_images=${car_images}  car_tire_pressure=${car_tire_pressure}  description=${description}  
   run every case by params  Put Admin Car Infos By Car Info Id Success 204  ${essential_params}  ${unessential_params}  car_info_id=${car_info_id}

Put Admin Car Infos By Car Info Id Fail With Wrong Params
   [Documentation]  接口名:修改车辆信息${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  car_id=${car_id_422}  
   ${unessential_params}  create list  car_type=${car_type_422}  car_brand=${car_brand_422}  car_series=${car_series_422}  car_color=${car_color_422}  car_frame_no=${car_frame_no_422}  licensed_time=${licensed_time_422}  car_year=${car_year_422}  car_images=${car_images_422}  car_tire_pressure=${car_tire_pressure_422}  description=${description_422}  
   run every case by params  Put Admin Car Infos By Car Info Id Fail 422  ${essential_params}  ${unessential_params}  car_info_id=${car_info_id}

Put Admin Car Infos By Car Info Id Fail With Wrong Url
   [Documentation]  接口名:修改车辆信息${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  car_id=${car_id}  
   ${unessential_params}  create list  car_type=${car_type}  car_brand=${car_brand}  car_series=${car_series}  car_color=${car_color}  car_frame_no=${car_frame_no}  licensed_time=${licensed_time}  car_year=${car_year}  car_images=${car_images}  car_tire_pressure=${car_tire_pressure}  description=${description}  
   run every case by params  Put Admin Car Infos By Car Info Id Fail 404  ${essential_params}  ${unessential_params}  car_info_id=${wrong_url_id}


*** Variables ***
${car_info_id}  


*** Keywords ***
Post car Infos import Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Post car Infos import   &{kwargs}
   expect status is 200  ${resp}  admin_car_info/Post_car_Infos_import_200.json
   ${car_info_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][car_info_id]}
   set global variable   ${car_info_id}

Get Admin Car Infos Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Car Infos   &{kwargs}
   expect status is 200  ${resp}  admin_car_info/Get_Admin_Car_Infos_200.json
   ${car_info_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][car_info_id]}
   set global variable   ${car_info_id}

Get Admin Car Infos Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Car Infos   &{kwargs}
   expect status is 422  ${resp}  

Get Admin Car Infos By Car Info Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Car Infos By Car Info Id   &{kwargs}
   expect status is 404  ${resp}  

Get Admin Car Infos By Car Info Id Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Car Infos By Car Info Id   &{kwargs}
   expect status is 200  ${resp}  admin_car_info/Get_Admin_Car_Infos_By_Car_Info_Id_200.json
   ${car_info_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][car_info_id]}
   set global variable   ${car_info_id}

Put Admin Car Infos By Car Info Id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  Put Admin Car Infos By Car Info Id   &{kwargs}
   expect status is 204  ${resp}  

Put Admin Car Infos By Car Info Id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Put Admin Car Infos By Car Info Id   &{kwargs}
   expect status is 422  ${resp}  

Put Admin Car Infos By Car Info Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  Put Admin Car Infos By Car Info Id   &{kwargs}
   expect status is 404  ${resp}  

