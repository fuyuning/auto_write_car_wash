*** Settings ***
Documentation  app_wash_area
Resource  ../resources.robot
Library  robot_car_wash_app_library.wash_area.WashAreaLibrary
Suite Setup  Login  ${app_username}  ${app_password}

Force Tags  model:app_wash_area  虾客APP


*** Test Cases ***
Get wash_area Fail Without Login
   [Documentation]  接口名:获取全部洗车区域列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  section=${section}  condition=${condition}  
   run every case by params  Get car wash wash areas Fail 403  ${essential_params}  ${unessential_params}



Get wash_area Success 
   [Documentation]  接口名:获取全部洗车区域列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 WashArea 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  
   ${unessential_params}  create list  section=${section}  condition=${condition}  
   run every case by params  Get car wash wash areas Success 200  ${essential_params}  ${unessential_params}



Get wash_area Fail With Wrong Params
   [Documentation]  接口名:获取全部洗车区域列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  section=${section}  condition=${condition}  
   run every case by params  Get car wash wash areas Fail 422  ${essential_params}  ${unessential_params}



*** Variables ***


*** Keywords ***
Get Car wash wash areas Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get car wash wash areas   &{kwargs}
   expect status is 403  ${resp}  

Get Car wash wash areas Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get car wash wash areas   &{kwargs}
   expect status is 200  ${resp}  app_wash_area/Get_Car_wash_wash_areas_200.json

Get Car wash wash areas Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get car wash wash areas   &{kwargs}
   expect status is 422  ${resp}  

