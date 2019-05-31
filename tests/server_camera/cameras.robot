*** Settings ***
Documentation  server_camera
Resource  ../resources.robot
Library  robot_camera_monitor_server_library.camera.CameraLibrary
Suite Setup  Login  ${admin_username}   ${admin_password}
Suite Teardown  Logout
Force Tags  model:server_camera  


*** Test Cases ***
get projects cameras by project id Success 
   [Documentation]  接口名:获取相机列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 Camera 对象。
   [Tags]           Respcode:200
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  reg_code=${reg_code}  work_status=${work_status}  network_status=${network_status}  camera_brand_id=${camera_brand_id}  camera_model_id=${camera_model_id}  draw_status=${draw_status}  spot_num=${spot_num}  page_size=${page_size}  page_num=${page_num}  order_by=${order_by}  
   run every case by params   get projects cameras by project id success 200   ${essential_params}  ${unessential_params}    project_id=${project_id}

get projects cameras by project id Fail With Wrong Url
   [Documentation]  接口名:获取相机列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   get projects cameras by project id fail 404     project_id=${wrong_url_id}    reg_code=${reg_code}  work_status=${work_status}  network_status=${network_status}  camera_brand_id=${camera_brand_id}  camera_model_id=${camera_model_id}  draw_status=${draw_status}  spot_num=${spot_num}  page_size=${page_size}  page_num=${page_num}  order_by=${order_by}  

get projects cameras by project id Fail With Wrong Params
   [Documentation]  接口名:获取相机列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  reg_code=${reg_code_422}  work_status=${work_status_422}  network_status=${network_status_422}  camera_brand_id=${camera_brand_id_422}  camera_model_id=${camera_model_id_422}  draw_status=${draw_status_422}  spot_num=${spot_num_422}  page_size=${page_size_422}  page_num=${page_num_422}  order_by=${order_by_422}  
   run every case by params   get projects cameras by project id fail 422   ${essential_params}  ${unessential_params}    project_id=${project_id}  success=False

get projects cameras images by project id camera id Success 
   [Documentation]  接口名:获取电子泊位列表图片/相机详情图片${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 UploadImage 对象。
   [Tags]           Respcode:200
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  page_size=${page_size}  page_num=${page_num}  
   run every case by params   get projects cameras images by project id camera id success 200   ${essential_params}  ${unessential_params}    project_id=${project_id}  camera_id=${camera_id}

get projects cameras images by project id camera id Fail With Wrong Url
   [Documentation]  接口名:获取电子泊位列表图片/相机详情图片${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   get projects cameras images by project id camera id fail 404     project_id=${wrong_url_id}  camera_id=${wrong_url_id}    page_size=${page_size}  page_num=${page_num}  

get projects cameras images by project id camera id Fail With Wrong Params
   [Documentation]  接口名:获取电子泊位列表图片/相机详情图片${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  page_size=${page_size_422}  page_num=${page_num_422}  
   run every case by params   get projects cameras images by project id camera id fail 422   ${essential_params}  ${unessential_params}    project_id=${project_id}  camera_id=${camera_id}  success=False

get projects cameras by project id camera id Success 
   [Documentation]  接口名:获取相机详情${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 Camera 对象。
   [Tags]           Respcode:200
   get projects cameras by project id camera id success 200     project_id=${project_id}  camera_id=${camera_id}

get projects cameras by project id camera id Fail With Wrong Url
   [Documentation]  接口名:获取相机详情${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   get projects cameras by project id camera id fail 404     project_id=${wrong_url_id}  camera_id=${wrong_url_id}

get projects camera brands by project id Success 
   [Documentation]  接口名:获取相机品牌${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 CameraBrand 对象。
   [Tags]           Respcode:200
   get projects camera brands by project id success 200     project_id=${project_id}

get projects camera brands by project id Fail With Wrong Url
   [Documentation]  接口名:获取相机品牌${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   get projects camera brands by project id fail 404     project_id=${wrong_url_id}

get projects camera brands camera models by project id camera brand id Success 
   [Documentation]  接口名:获取相机型号列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 CameraModel 对象。
   [Tags]           Respcode:200
   get projects camera brands camera models by project id camera brand id success 200     project_id=${project_id}  camera_brand_id=${camera_brand_id}

get projects camera brands camera models by project id camera brand id Fail With Wrong Url
   [Documentation]  接口名:获取相机型号列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   get projects camera brands camera models by project id camera brand id fail 404     project_id=${wrong_url_id}  camera_brand_id=${wrong_url_id}

put projects cameras by project id camera id Success 
   [Documentation]  接口名:编辑单个相机参数配置${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create dictionary  work_time=${work_time}  upload_cycle=${upload_cycle}  
   ${unessential_params}  create dictionary  reg_code=${reg_code}  
   run every case by params   put projects cameras by project id camera id success 204   ${essential_params}  ${unessential_params}    project_id=${project_id}  camera_id=${camera_id}

put projects cameras by project id camera id Fail With Wrong Url
   [Documentation]  接口名:编辑单个相机参数配置${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   put projects cameras by project id camera id fail 404     project_id=${wrong_url_id}  camera_id=${wrong_url_id}  work_time=${work_time}  upload_cycle=${upload_cycle}    reg_code=${reg_code}  

put projects cameras by project id camera id Fail With Wrong Params
   [Documentation]  接口名:编辑单个相机参数配置${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  work_time=${work_time_422}  upload_cycle=${upload_cycle_422}  
   ${unessential_params}  create dictionary  reg_code=${reg_code_422}  
   run every case by params   put projects cameras by project id camera id fail 422   ${essential_params}  ${unessential_params}    project_id=${project_id}  camera_id=${camera_id}  success=False

put projects cameras by project id Success 
   [Documentation]  接口名:编辑批量相机参数配置${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create dictionary  work_time=${work_time}  upload_cycle=${upload_cycle}  camera_ids=${camera_ids}  
   ${unessential_params}  create dictionary  
   run every case by params   put projects cameras by project id success 204   ${essential_params}  ${unessential_params}    project_id=${project_id}

put projects cameras by project id Fail With Wrong Url
   [Documentation]  接口名:编辑批量相机参数配置${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   put projects cameras by project id fail 404     project_id=${wrong_url_id}  work_time=${work_time}  upload_cycle=${upload_cycle}  camera_ids=${camera_ids}    

put projects cameras by project id Fail With Wrong Params
   [Documentation]  接口名:编辑批量相机参数配置${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  work_time=${work_time_422}  upload_cycle=${upload_cycle_422}  camera_ids=${camera_ids_422}  
   ${unessential_params}  create dictionary  
   run every case by params   put projects cameras by project id fail 422   ${essential_params}  ${unessential_params}    project_id=${project_id}  success=False

patch projects cameras by project id camera id Success 
   [Documentation]  接口名:编辑单个相机工作状态${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create dictionary  work_status=${work_status}  
   ${unessential_params}  create dictionary  
   run every case by params   patch projects cameras by project id camera id success 204   ${essential_params}  ${unessential_params}    project_id=${project_id}  camera_id=${camera_id}

patch projects cameras by project id camera id Fail With Wrong Url
   [Documentation]  接口名:编辑单个相机工作状态${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   patch projects cameras by project id camera id fail 404     project_id=${wrong_url_id}  camera_id=${wrong_url_id}  work_status=${work_status}    

patch projects cameras by project id camera id Fail With Wrong Params
   [Documentation]  接口名:编辑单个相机工作状态${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  work_status=${work_status_422}  
   ${unessential_params}  create dictionary  
   run every case by params   patch projects cameras by project id camera id fail 422   ${essential_params}  ${unessential_params}    project_id=${project_id}  camera_id=${camera_id}  success=False

patch projects cameras by project id Success 
   [Documentation]  接口名:编辑批量相机工作状态${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create dictionary  work_status=${work_status}  camera_ids=${camera_ids}  
   ${unessential_params}  create dictionary  
   run every case by params   patch projects cameras by project id success 204   ${essential_params}  ${unessential_params}    project_id=${project_id}

patch projects cameras by project id Fail With Wrong Url
   [Documentation]  接口名:编辑批量相机工作状态${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   patch projects cameras by project id fail 404     project_id=${wrong_url_id}  work_status=${work_status}  camera_ids=${camera_ids}    

patch projects cameras by project id Fail With Wrong Params
   [Documentation]  接口名:编辑批量相机工作状态${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  work_status=${work_status_422}  camera_ids=${camera_ids_422}  
   ${unessential_params}  create dictionary  
   run every case by params   patch projects cameras by project id fail 422   ${essential_params}  ${unessential_params}    project_id=${project_id}  success=False


*** Variables ***
${project_id}  
${camera_id}  
${camera_brand_id}  


*** Keywords ***
get projects cameras by project id Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get projects cameras by project id  &{kwargs}
   expect status is 200  ${resp}  server_camera/get_projects_cameras_by_project_id_200.json
   ${project_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][project_id]}
   set global variable   ${project_id}
   ${camera_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][camera_id]}
   set global variable   ${camera_id}
   ${camera_brand_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][camera_brand_id]}
   set global variable   ${camera_brand_id}

get projects cameras by project id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  get projects cameras by project id  &{kwargs}
   expect status is 404  ${resp}  

get projects cameras by project id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get projects cameras by project id  &{kwargs}
   expect status is 422  ${resp}  

get projects cameras images by project id camera id Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get projects cameras images by project id camera id  &{kwargs}
   expect status is 200  ${resp}  server_camera/get_projects_cameras_images_by_project_id_camera_id_200.json
   ${project_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][project_id]}
   set global variable   ${project_id}
   ${camera_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][camera_id]}
   set global variable   ${camera_id}
   ${camera_brand_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][camera_brand_id]}
   set global variable   ${camera_brand_id}

get projects cameras images by project id camera id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  get projects cameras images by project id camera id  &{kwargs}
   expect status is 404  ${resp}  

get projects cameras images by project id camera id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get projects cameras images by project id camera id  &{kwargs}
   expect status is 422  ${resp}  

get projects cameras by project id camera id Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get projects cameras by project id camera id  &{kwargs}
   expect status is 200  ${resp}  server_camera/get_projects_cameras_by_project_id_camera_id_200.json
   ${project_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][project_id]}
   set global variable   ${project_id}
   ${camera_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][camera_id]}
   set global variable   ${camera_id}
   ${camera_brand_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][camera_brand_id]}
   set global variable   ${camera_brand_id}

get projects cameras by project id camera id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  get projects cameras by project id camera id  &{kwargs}
   expect status is 404  ${resp}  

get projects camera brands by project id Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get projects camera brands by project id  &{kwargs}
   expect status is 200  ${resp}  server_camera/get_projects_camera_brands_by_project_id_200.json
   ${project_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][project_id]}
   set global variable   ${project_id}
   ${camera_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][camera_id]}
   set global variable   ${camera_id}
   ${camera_brand_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][camera_brand_id]}
   set global variable   ${camera_brand_id}

get projects camera brands by project id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  get projects camera brands by project id  &{kwargs}
   expect status is 404  ${resp}  

get projects camera brands camera models by project id camera brand id Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get projects camera brands camera models by project id camera brand id  &{kwargs}
   expect status is 200  ${resp}  server_camera/get_projects_camera_brands_camera_models_by_project_id_camera_brand_id_200.json
   ${project_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][project_id]}
   set global variable   ${project_id}
   ${camera_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][camera_id]}
   set global variable   ${camera_id}
   ${camera_brand_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][camera_brand_id]}
   set global variable   ${camera_brand_id}

get projects camera brands camera models by project id camera brand id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  get projects camera brands camera models by project id camera brand id  &{kwargs}
   expect status is 404  ${resp}  

put projects cameras by project id camera id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  put projects cameras by project id camera id  &{kwargs}
   expect status is 204  ${resp}  

put projects cameras by project id camera id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  put projects cameras by project id camera id  &{kwargs}
   expect status is 404  ${resp}  

put projects cameras by project id camera id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  put projects cameras by project id camera id  &{kwargs}
   expect status is 422  ${resp}  

put projects cameras by project id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  put projects cameras by project id  &{kwargs}
   expect status is 204  ${resp}  

put projects cameras by project id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  put projects cameras by project id  &{kwargs}
   expect status is 404  ${resp}  

put projects cameras by project id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  put projects cameras by project id  &{kwargs}
   expect status is 422  ${resp}  

patch projects cameras by project id camera id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  patch projects cameras by project id camera id  &{kwargs}
   expect status is 204  ${resp}  

patch projects cameras by project id camera id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  patch projects cameras by project id camera id  &{kwargs}
   expect status is 404  ${resp}  

patch projects cameras by project id camera id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  patch projects cameras by project id camera id  &{kwargs}
   expect status is 422  ${resp}  

patch projects cameras by project id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  patch projects cameras by project id  &{kwargs}
   expect status is 204  ${resp}  

patch projects cameras by project id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  patch projects cameras by project id  &{kwargs}
   expect status is 404  ${resp}  

patch projects cameras by project id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  patch projects cameras by project id  &{kwargs}
   expect status is 422  ${resp}  

