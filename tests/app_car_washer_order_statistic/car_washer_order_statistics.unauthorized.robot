*** Settings ***
Documentation  app_car_washer_order_statistic
Resource  ../resources.robot
Library  robot_car_wash_app_library.car_washer_order_statistic.CarWasherOrderStatisticLibrary
Force Tags  model:app_car_washer_order_statistic  虾客APP


Get car Washers order statistic Fail Without Login
   [Documentation]  接口名:车辆信息详情${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
    Get car Washers order statistic Fail 403

Get car Washers order statistic Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get car Washers order statistic   &{kwargs}
   expect status is 403  ${resp}  

