*** Settings ***
Documentation  app_wash_area
Resource  ../resources.robot
Library  robot_car_wash_app_library.wash_area.WashAreaLibrary
Force Tags  model:app_wash_area  虾客APP


*** Test Cases ***
get car wash wash areas Fail Without Login
   [Documentation]  接口名:获取全部洗车区域列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  section=${section}  condition=${condition}  
   run every case by params  get car wash wash areas Fail 403  ${essential_params}  ${unessential_params}


*** Keywords ***
get car wash wash areas Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get car wash wash areas  &{kwargs}
   expect status is 403  ${resp}  

