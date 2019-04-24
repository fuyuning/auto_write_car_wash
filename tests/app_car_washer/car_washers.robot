*** Settings ***
Documentation  app_car_washer
Resource  ../resources.robot
Library  robot_car_wash_app_library.car_washer.CarWasherLibrary
Suite Setup  Login  ${app_username}  ${app_password}
Force Tags  model:app_car_washer  虾客APP


*** Test Cases ***
Get car Wash promoter qrcode Fail With Wrong Url
   [Documentation]  接口名:获取虾客二维码${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
    Get car Wash promoter qrcode Fail 404

Get car Wash promoter qrcode Success 
   [Documentation]  接口名:获取虾客二维码${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为  列表。
   [Tags]           Respcode:200
    Get car Wash promoter qrcode Success 200


*** Keywords ***
Get car Wash promoter qrcode Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  Get car Wash promoter qrcode   &{kwargs}
   expect status is 404  ${resp}  

Get car Wash promoter qrcode Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Get car Wash promoter qrcode   &{kwargs}
   expect status is 200  ${resp}  app_car_washer/Get_car_Wash_promoter_qrcode_200.json

