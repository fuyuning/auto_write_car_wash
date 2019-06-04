*** Settings ***
Documentation  app_car_info
Resource  ../resources.robot
Library  robot_washing_expert_library.car_info.CarInfoLibrary
Force Tags  model:app_car_info  虾客APP


*** Test Cases ***
get car wash car infos Fail Without Login
   [Documentation]  接口名:车辆信息详情${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get car wash car infos fail 403   car_ids=${car_ids}    

put car wash car infos by car info id Fail Without Login
   [Documentation]  接口名:上传车辆图片${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   put car wash car infos by car info id fail 403     car_info_id=${car_info_id}    car_images=${car_images}  


*** Variables ***
${car_info_id}  1a2b3c4d5e6f7zz


*** Keywords ***
get car wash car infos Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get car wash car infos  &{kwargs}
   expect status is 403  ${resp}  

put car wash car infos by car info id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  put car wash car infos by car info id  &{kwargs}
   expect status is 403  ${resp}  

