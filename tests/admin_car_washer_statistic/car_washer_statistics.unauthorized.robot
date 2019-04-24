*** Settings ***
Documentation  admin_car_washer_statistic
Resource  ../resources.robot
Library  robot_car_wash_server_library.car_washer_statistic.CarWasherStatisticLibrary
Force Tags  model:admin_car_washer_statistic  虾洗后台


Get Admin Car Washer Statistics Fail Without Login
   [Documentation]  接口名:统计列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  username=${username}  mobile=${mobile}  section=${section}  order_by=${order_by}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get Admin Car Washer Statistics Fail 403  ${essential_params}  ${unessential_params}

Patch Visible By Username Fail Without Login
   [Documentation]  接口名:统计数据隐藏${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  visible=False  
   ${unessential_params}  create list  
   run every case by params  Patch Visible By Username Fail 403  ${essential_params}  ${unessential_params}  username/visible=${username/visible}

Get Admin Car Washer Statistics Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Car Washer Statistics   &{kwargs}
   expect status is 403  ${resp}  

Patch Visible By Username Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Patch Visible By Username   &{kwargs}
   expect status is 403  ${resp}  

