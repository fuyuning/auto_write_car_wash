*** Settings ***
Documentation  wxmp_parking
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.parking.ParkingLibrary
Force Tags  model:wxmp_parking  车主微信端


*** Test Cases ***
get parkings nearby Fail Without Login
   [Documentation]  接口名:根据距离获取停车场信息列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get parkings nearby fail 403   service_type=${service_type}  radius=${radius}  center=${center}    page_limit=${page_limit}  


*** Keywords ***
get parkings nearby Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get parkings nearby  &{kwargs}
   expect status is 403  ${resp}  

