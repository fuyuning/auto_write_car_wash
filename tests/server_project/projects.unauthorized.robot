*** Settings ***
Documentation  server_project
Resource  ../resources.robot
Library  robot_camera_monitor_server_library.project.ProjectLibrary
Force Tags  model:server_project  


*** Test Cases ***
post projects import Fail Without Login
   [Documentation]  接口名:项目导入${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   post projects import fail 403   file=${Please_input}    

post projects by project id Fail Without Login
   [Documentation]  接口名:更新项目数据${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   post projects by project id fail 403     project_id=${project_id}  file=${Please_input}    

get projects Fail Without Login
   [Documentation]  接口名:获取项目列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get projects fail 403     project_name=${project_name}  page_size=${page_size}  page_num=${page_num}  order_by=${order_by}  

patch projects upload platforms by project id Fail Without Login
   [Documentation]  接口名:上传配置${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   patch projects upload platforms by project id fail 403     project_id=${project_id}  upload_platforms=${upload_platforms}    

delete projects by project id Fail Without Login
   [Documentation]  接口名:删除项目${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   delete projects by project id fail 403     project_id=${project_id}


*** Variables ***
${project_id}  1a2b3c4d5e6f7zz


*** Keywords ***
post projects import Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post projects import  &{kwargs}
   expect status is 403  ${resp}  

post projects by project id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post projects by project id  &{kwargs}
   expect status is 403  ${resp}  

get projects Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get projects  &{kwargs}
   expect status is 403  ${resp}  

patch projects upload platforms by project id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch projects upload platforms by project id  &{kwargs}
   expect status is 403  ${resp}  

delete projects by project id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  delete projects by project id  &{kwargs}
   expect status is 403  ${resp}  

