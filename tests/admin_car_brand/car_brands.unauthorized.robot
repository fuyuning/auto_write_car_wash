*** Settings ***
Documentation  admin_car_brand
Resource  ../resources.robot
Library  robot_car_wash_server_library.car_brand.CarBrandLibrary
Force Tags  model:admin_car_brand  虾洗后台


*** Test Cases ***
get admin car brands Fail Without Login
   [Documentation]  接口名:品牌列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
    get admin car brands fail 403


*** Keywords ***
get admin car brands Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin car brands  &{kwargs}
   expect status is 403  ${resp}  

