*** Settings ***
Documentation  app_car_info
Resource  ../resources.robot
Library  robot_car_wash_app_library.car_info.CarInfoLibrary
Force Tags  model:app_car_info  虾客APP


*** Test Cases ***
get car wash car infos Fail Without Login
   [Documentation]  接口名:车辆信息详情${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  car_ids=${car_ids}  
   ${unessential_params}  create list  
   run every case by params  get car wash car infos Fail 403  ${essential_params}  ${unessential_params}


*** Keywords ***
get car wash car infos Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get car wash car infos  &{kwargs}
   expect status is 403  ${resp}  

