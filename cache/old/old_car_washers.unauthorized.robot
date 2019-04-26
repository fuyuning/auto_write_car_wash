*** Settings ***
Documentation  app_car_washer
Resource  ../resources.robot
Library  robot_car_wash_app_library.car_washer.CarWasherLibrary
Force Tags  model:app_car_washer  虾客APP


*** Test Cases ***
Get car Wash promoter qrcode Fail Without Login
   [Documentation]  接口名:获取虾客二维码${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
    Get car Wash promoter qrcode Fail 403


*** Keywords ***
Get car Wash promoter qrcode Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get car Wash promoter qrcode   &{kwargs}
   expect status is 403  ${resp}  

