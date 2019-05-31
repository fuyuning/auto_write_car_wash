*** Settings ***
Documentation  server_project
Resource  ../resources.robot
Library  robot_camera_monitor_deployment_server.project.ProjectLibrary
Suite Setup  Login  ${admin_username}   ${admin_password}
Suite Teardown  Logout
Force Tags  model:server_project  


*** Test Cases ***
post projects import Success 
   [Documentation]  接口名:项目导入${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create dictionary  file=${Please_input}  
   ${unessential_params}  create dictionary  
   run every case by params   post projects import success 204   ${essential_params}  ${unessential_params}

post projects import Fail With Wrong Params
   [Documentation]  接口名:项目导入${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  file=${Please_input}  
   ${unessential_params}  create dictionary  
   run every case by params   post projects import fail 422   ${essential_params}  ${unessential_params}  success=False

post projects by project id Fail With Wrong Url
   [Documentation]  接口名:更新项目数据${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   post projects by project id fail 404     project_id=${wrong_url_id}

post projects by project id Success 
   [Documentation]  接口名:更新项目数据${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create dictionary  file=${Please_input}  
   ${unessential_params}  create dictionary  
   run every case by params   post projects by project id success 204   ${essential_params}  ${unessential_params}    project_id=${project_id}

post projects by project id Fail With Wrong Params
   [Documentation]  接口名:更新项目数据${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  file=${Please_input}  
   ${unessential_params}  create dictionary  
   run every case by params   post projects by project id fail 422   ${essential_params}  ${unessential_params}    project_id=${project_id}  success=False

get projects Success 
   [Documentation]  接口名:获取项目列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 Project 列表。
   [Tags]           Respcode:200
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  project_name=${project_name}  page_size=${page_size}  page_num=${page_num}  order_by=${order_by}  
   run every case by params   get projects success 200   ${essential_params}  ${unessential_params}

get projects Fail With Wrong Params
   [Documentation]  接口名:获取项目列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  project_name=${project_name_422}  page_size=${page_size_422}  page_num=${page_num_422}  order_by=${order_by_422}  
   run every case by params   get projects fail 422   ${essential_params}  ${unessential_params}  success=False

patch projects upload platforms by project id Success 
   [Documentation]  接口名:上传配置${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create dictionary  upload_platforms=${upload_platforms}  
   ${unessential_params}  create dictionary  
   run every case by params   patch projects upload platforms by project id success 204   ${essential_params}  ${unessential_params}    project_id=${project_id}

patch projects upload platforms by project id Fail With Wrong Url
   [Documentation]  接口名:上传配置${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   patch projects upload platforms by project id fail 404     project_id=${wrong_url_id}

patch projects upload platforms by project id Fail With Wrong Params
   [Documentation]  接口名:上传配置${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  upload_platforms=${upload_platforms_422}  
   ${unessential_params}  create dictionary  
   run every case by params   patch projects upload platforms by project id fail 422   ${essential_params}  ${unessential_params}    project_id=${project_id}  success=False

delete projects by project id Success 
   [Documentation]  接口名:删除项目${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   delete projects by project id success 204     project_id=${project_id}

delete projects by project id Fail With Wrong Url
   [Documentation]  接口名:删除项目${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   delete projects by project id fail 404     project_id=${wrong_url_id}


*** Variables ***
${project_id}  


*** Keywords ***
post projects import Success 204
   [Arguments]  &{kwargs}
   ${resp}=  post projects import  &{kwargs}
   expect status is 204  ${resp}  

post projects import Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post projects import  &{kwargs}
   expect status is 422  ${resp}  

post projects by project id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  post projects by project id  &{kwargs}
   expect status is 404  ${resp}  

post projects by project id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  post projects by project id  &{kwargs}
   expect status is 204  ${resp}  

post projects by project id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post projects by project id  &{kwargs}
   expect status is 422  ${resp}  

get projects Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get projects  &{kwargs}
   expect status is 200  ${resp}  server_project/get_projects_200.json
   ${project_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][project_id]}
   set global variable   ${project_id}

get projects Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get projects  &{kwargs}
   expect status is 422  ${resp}  

patch projects upload platforms by project id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  patch projects upload platforms by project id  &{kwargs}
   expect status is 204  ${resp}  

patch projects upload platforms by project id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  patch projects upload platforms by project id  &{kwargs}
   expect status is 404  ${resp}  

patch projects upload platforms by project id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  patch projects upload platforms by project id  &{kwargs}
   expect status is 422  ${resp}  

delete projects by project id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  delete projects by project id  &{kwargs}
   expect status is 204  ${resp}  

delete projects by project id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  delete projects by project id  &{kwargs}
   expect status is 404  ${resp}  

