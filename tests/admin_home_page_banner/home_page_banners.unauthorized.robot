*** Settings ***
Documentation  admin_home_page_banner
Resource  ../resources.robot
Library  robot_car_wash_server_library.home_page_banner.HomePageBannerLibrary
Force Tags  model:admin_home_page_banner  虾洗后台


*** Test Cases ***
post admin parkings Fail Without Login
   [Documentation]  接口名:添加首页信息${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  banners=${banners}  service_introduce=${service_introduce}  
   run every case by params  post admin parkings Fail 403  ${essential_params}  ${unessential_params}

get admin home page banners Fail Without Login
   [Documentation]  接口名:首页信息列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
    get admin home page banners Fail 403

put admin home page banners by home page banner id Fail Without Login
   [Documentation]  接口名:修改首页信息${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  banners=${banners}  service_introduce=${service_introduce}  
   run every case by params  put admin home page banners by home page banner id Fail 403  ${essential_params}  ${unessential_params}    home_page_banner_id=${home_page_banner_id}


*** Variables ***
${home_page_banner_id}  12345678909876543


*** Keywords ***
post admin parkings Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post admin parkings  &{kwargs}
   expect status is 403  ${resp}  

get admin home page banners Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin home page banners  &{kwargs}
   expect status is 403  ${resp}  

put admin home page banners by home page banner id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  put admin home page banners by home page banner id  &{kwargs}
   expect status is 403  ${resp}  

