*** Settings ***
Documentation  admin_inspection
Resource  ../resources.robot
Library  robot_car_wash_server_library.inspection.InspectionLibrary
Suite Setup  Login  ${username}   ${password}
Suite Teardown  Logout
Force Tags  model:admin_inspection  虾洗后台


*** Test Cases ***
post admin inspections Fail With Wrong Params
   [Documentation]  接口名:新增检查${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  username=${username_422}  order_no=${order_no_422}  inspection_time=${inspection_time_422}  score=${score_422}  inspector=${inspector_422}  
   ${unessential_params}  create dictionary  images=${images_422}  
   run every case by params   post admin inspections fail 422   ${essential_params}  ${unessential_params}  success=False

post admin inspections Success 
   [Documentation]  接口名:新增检查${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 201,返回的Json数据符合验证。
   [Tags]           Respcode:201
   ${essential_params}  create dictionary  username=${username}  order_no=${order_no}  inspection_time=${inspection_time}  score=${score}  inspector=${inspector}  
   ${unessential_params}  create dictionary  images=${images}  
   run every case by params   post admin inspections success 201   ${essential_params}  ${unessential_params}

get admin inspections Success 
   [Documentation]  接口名:获取检查列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 Inspection 列表。
   [Tags]           Respcode:200
   ${essential_params}  create dictionary  username=${username}  
   ${unessential_params}  create dictionary  section=${section}  page_num=${page_num}  page_size=${page_size}  
   run every case by params   get admin inspections success 200   ${essential_params}  ${unessential_params}

get admin inspections Fail With Wrong Params
   [Documentation]  接口名:获取检查列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  username=${username_422}  
   ${unessential_params}  create dictionary  section=${section_422}  page_num=${page_num_422}  page_size=${page_size_422}  
   run every case by params   get admin inspections fail 422   ${essential_params}  ${unessential_params}  success=False

get admin inspections by inspection id Fail With Wrong Url
   [Documentation]  接口名:获取检查详情${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   get admin inspections by inspection id fail 404     inspection_id=${wrong_url_id}

get admin inspections by inspection id Success 
   [Documentation]  接口名:获取检查详情${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 Inspection 对象。
   [Tags]           Respcode:200
   get admin inspections by inspection id success 200     inspection_id=${inspection_id}

put admin inspections by inspection id Success 
   [Documentation]  接口名:编辑虾客${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create dictionary  username=${username}  order_no=${order_no}  inspection_time=${inspection_time}  score=${score}  inspector=${inspector}  
   ${unessential_params}  create dictionary  images=${images}  
   run every case by params   put admin inspections by inspection id success 204   ${essential_params}  ${unessential_params}    inspection_id=${inspection_id}

put admin inspections by inspection id Fail With Wrong Url
   [Documentation]  接口名:编辑虾客${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   put admin inspections by inspection id fail 404     inspection_id=${wrong_url_id}  username=${username}  order_no=${order_no}  inspection_time=${inspection_time}  score=${score}  inspector=${inspector}    images=${images}  

put admin inspections by inspection id Fail With Wrong Params
   [Documentation]  接口名:编辑虾客${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  username=${username_422}  order_no=${order_no_422}  inspection_time=${inspection_time_422}  score=${score_422}  inspector=${inspector_422}  
   ${unessential_params}  create dictionary  images=${images_422}  
   run every case by params   put admin inspections by inspection id fail 422   ${essential_params}  ${unessential_params}    inspection_id=${inspection_id}  success=False


*** Variables ***
${inspection_id}  


*** Keywords ***
post admin inspections Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post admin inspections  &{kwargs}
   expect status is 422  ${resp}  

post admin inspections Success 201
   [Arguments]  &{kwargs}
   ${resp}=  post admin inspections  &{kwargs}
   expect status is 201  ${resp}  admin_inspection/post_admin_inspections_201.json
   ${inspection_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0]['inspection_id']}
   set global variable   ${inspection_id}

get admin inspections Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin inspections  &{kwargs}
   expect status is 200  ${resp}  admin_inspection/get_admin_inspections_200.json
   ${inspection_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0]['inspection_id']}
   set global variable   ${inspection_id}

get admin inspections Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get admin inspections  &{kwargs}
   expect status is 422  ${resp}  

get admin inspections by inspection id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  get admin inspections by inspection id  &{kwargs}
   expect status is 404  ${resp}  

get admin inspections by inspection id Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin inspections by inspection id  &{kwargs}
   expect status is 200  ${resp}  admin_inspection/get_admin_inspections_by_inspection_id_200.json
   ${inspection_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0]['inspection_id']}
   set global variable   ${inspection_id}

put admin inspections by inspection id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  put admin inspections by inspection id  &{kwargs}
   expect status is 204  ${resp}  

put admin inspections by inspection id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  put admin inspections by inspection id  &{kwargs}
   expect status is 404  ${resp}  

put admin inspections by inspection id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  put admin inspections by inspection id  &{kwargs}
   expect status is 422  ${resp}  

