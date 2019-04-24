*** Settings ***
Documentation  admin_user_car
Resource  ../resources.robot
Library  robot_car_wash_server_library.user_car.UserCarLibrary
Force Tags  model:admin_user_car  虾洗后台


Get Admin User Cars Fail Without Login
   [Documentation]  接口名:用户车辆信息查询${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  user_id=${user_id}  
   run every case by params  Get Admin User Cars Fail 403  ${essential_params}  ${unessential_params}

Get Admin User Cars Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin User Cars   &{kwargs}
   expect status is 403  ${resp}  

