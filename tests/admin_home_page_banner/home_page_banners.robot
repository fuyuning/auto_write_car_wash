*** Settings ***
Documentation  admin_home_page_banner
Resource  ../resources.robot
Library  robot_car_wash_server_library.home_page_banner.HomePageBannerLibrary
Suite Setup  Login  ${admin_username}   ${admin_password}
Suite Teardown  Logout
Force Tags  model:admin_home_page_banner  虾洗后台


*** Test Cases ***
Post Admin Parkings Success 
   [Documentation]  接口名:添加首页信息${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 201,返回的Json数据符合验证。
   [Tags]           Respcode:201
   ${essential_params}  create list  
   ${unessential_params}  create list  banners=${banners}  service_introduce=${service_introduce}  
   run every case by params  Post Admin Parkings Success 201  ${essential_params}  ${unessential_params}

Post Admin Parkings Fail With Wrong Params
   [Documentation]  接口名:添加首页信息${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  banners=${banners}  service_introduce=${service_introduce}  
   run every case by params  Post Admin Parkings Fail 422  ${essential_params}  ${unessential_params}

Get Admin Home Page Banners Success 
   [Documentation]  接口名:首页信息列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 HomePageBanner 列表。
   [Tags]           Respcode:200
    Get Admin Home Page Banners Success 200

Put Admin Home Page Banners By Home Page Banner Id Success 
   [Documentation]  接口名:修改首页信息${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create list  
   ${unessential_params}  create list  banners=${banners}  service_introduce=${service_introduce}  
   run every case by params  Put Admin Home Page Banners By Home Page Banner Id Success 204  ${essential_params}  ${unessential_params}  home_page_banner_id=${home_page_banner_id}

Put Admin Home Page Banners By Home Page Banner Id Fail With Wrong Params
   [Documentation]  接口名:修改首页信息${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  banners=${banners}  service_introduce=${service_introduce}  
   run every case by params  Put Admin Home Page Banners By Home Page Banner Id Fail 422  ${essential_params}  ${unessential_params}  home_page_banner_id=${home_page_banner_id}

Put Admin Home Page Banners By Home Page Banner Id Fail With Wrong Url
   [Documentation]  接口名:修改首页信息${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  
   ${unessential_params}  create list  banners=${banners}  service_introduce=${service_introduce}  
   run every case by params  Put Admin Home Page Banners By Home Page Banner Id Fail 404  ${essential_params}  ${unessential_params}  home_page_banner_id=${wrong_url_id}


*** Variables ***
${home_page_banner_id}


*** Keywords ***
Post Admin Parkings Success 201
   [Arguments]  &{kwargs}
   ${resp}=  Post Admin Parkings   &{kwargs}
   expect status is 201  ${resp}  admin_home_page_banner/Post_Admin_Parkings_201.json
   ${home_page_banner_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][home_page_banner_id]}
   set global variable   ${home_page_banner_id}

Post Admin Parkings Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Post Admin Parkings   &{kwargs}
   expect status is 422  ${resp}  

Get Admin Home Page Banners Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Home Page Banners   &{kwargs}
   expect status is 200  ${resp}  admin_home_page_banner/Get_Admin_Home_Page_Banners_200.json
   ${home_page_banner_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][home_page_banner_id]}
   set global variable   ${home_page_banner_id}

Put Admin Home Page Banners By Home Page Banner Id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  Put Admin Home Page Banners By Home Page Banner Id   &{kwargs}
   expect status is 204  ${resp}  

Put Admin Home Page Banners By Home Page Banner Id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Put Admin Home Page Banners By Home Page Banner Id   &{kwargs}
   expect status is 422  ${resp}  

Put Admin Home Page Banners By Home Page Banner Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  Put Admin Home Page Banners By Home Page Banner Id   &{kwargs}
   expect status is 404  ${resp}  

