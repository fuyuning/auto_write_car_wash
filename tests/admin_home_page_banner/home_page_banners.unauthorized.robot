*** Settings ***
Documentation  admin_home_page_banner
Resource  ../resources.robot
Library  robot_car_wash_server_library.home_page_banner.HomePageBannerLibrary
Force Tags  model:admin_home_page_banner  虾洗后台


Post Admin Parkings Fail Without Login
   [Documentation]  接口名:添加首页信息${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  banners=${banners}  service_introduce=${service_introduce}  
   run every case by params  Post Admin Parkings Fail 403  ${essential_params}  ${unessential_params}

Get Admin Home Page Banners Fail Without Login
   [Documentation]  接口名:首页信息列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
    Get Admin Home Page Banners Fail 403

Put Admin Home Page Banners By Home Page Banner Id Fail Without Login
   [Documentation]  接口名:修改首页信息${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  banners=${banners}  service_introduce=${service_introduce}  
   run every case by params  Put Admin Home Page Banners By Home Page Banner Id Fail 403  ${essential_params}  ${unessential_params}  home_page_banner_id=${home_page_banner_id}

Post Admin Parkings Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Post Admin Parkings   &{kwargs}
   expect status is 403  ${resp}  

Get Admin Home Page Banners Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Home Page Banners   &{kwargs}
   expect status is 403  ${resp}  

Put Admin Home Page Banners By Home Page Banner Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Put Admin Home Page Banners By Home Page Banner Id   &{kwargs}
   expect status is 403  ${resp}  

