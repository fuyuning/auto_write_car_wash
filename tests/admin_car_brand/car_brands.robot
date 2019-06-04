*** Settings ***
Documentation  admin_car_brand
Resource  ../resources.robot
Library  robot_car_wash_server_library.car_brand.CarBrandLibrary
Suite Setup  Login  ${username}   ${password}
Suite Teardown  Logout
Force Tags  model:admin_car_brand  虾洗后台


*** Test Cases ***
get admin car brands Success 
   [Documentation]  接口名:品牌列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为  列表。
   [Tags]           Respcode:200
    get admin car brands success 200


*** Keywords ***
get admin car brands Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin car brands  &{kwargs}
   expect status is 200  ${resp}  admin_car_brand/get_admin_car_brands_200.json

