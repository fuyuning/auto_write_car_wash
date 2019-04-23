*** Settings ***
Documentation  admin_home_page_banner
Resource  ../resources.robot
Library  robot_car_wash_server_library.home_page_banner.HomePageBannerLibrary
Suite Setup  Login  ${admin_username}   ${admin_password}
Suite Teardown  Logout
Force Tags  model:admin_home_page_banner  虾洗后台


*** Test Cases ***
Post home_page_banner Success 
   [Documentation]  接口名:添加首页信息${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 201,返回的Json数据符合验证。
   [Tags]           Respcode:201
   ${essential_params}  create list  
   ${unessential_params}  create list  banners=${banners}  service_introduce=${service_introduce}  
   run every case by params  Post admin parkings Success 201  ${essential_params}  ${unessential_params}



Post home_page_banner Fail With Wrong Params
   [Documentation]  接口名:添加首页信息${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  banners=${banners}  service_introduce=${service_introduce}  
   run every case by params  Post admin parkings Fail 422  ${essential_params}  ${unessential_params}



Post home_page_banner Fail Without Login
   [Documentation]  接口名:添加首页信息${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  banners=${banners}  service_introduce=${service_introduce}  
   run every case by params  Post admin parkings Fail 403  ${essential_params}  ${unessential_params}



Get home_page_banner Fail Without Login
   [Documentation]  接口名:首页信息列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
    Get admin home page banners Fail 403


Get home_page_banner Success 
   [Documentation]  接口名:首页信息列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 HomePageBanner 列表。
   [Tags]           Respcode:200
    Get admin home page banners Success 200


Put home_page_banner By Id Success 
   [Documentation]  接口名:修改首页信息${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create list  
   ${unessential_params}  create list  banners=${banners}  service_introduce=${service_introduce}  
   run every case by params  Put admin home page banners By Id Success 204  ${essential_params}  ${unessential_params}  home_page_banner_id=${home_page_banner_id}



Put home_page_banner By Id Fail With Wrong Params
   [Documentation]  接口名:修改首页信息${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  banners=${banners}  service_introduce=${service_introduce}  
   run every case by params  Put admin home page banners By Id Fail 422  ${essential_params}  ${unessential_params}  home_page_banner_id=${home_page_banner_id}



Put home_page_banner By Id Fail Without Login
   [Documentation]  接口名:修改首页信息${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  banners=${banners}  service_introduce=${service_introduce}  
   run every case by params  Put admin home page banners By Id Fail 403  ${essential_params}  ${unessential_params}  home_page_banner_id=${home_page_banner_id}



Put home_page_banner By Id Fail With Wrong Url
   [Documentation]  接口名:修改首页信息${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  
   ${unessential_params}  create list  banners=${banners}  service_introduce=${service_introduce}  
   run every case by params  Put admin home page banners By Id Fail 404  ${essential_params}  ${unessential_params}  home_page_banner_id=${wrong_url_id}



*** Variables ***
${home_page_banner_id}


*** Keywords ***
Post Admin parkings Success 201
   [Arguments]  &{kwargs}
   ${resp}=  post admin parkings   &{kwargs}
   expect status is 201  ${resp}  admin_home_page_banner/Post_Admin_parkings_201.json
   ${home_page_banner_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][home_page_banner_id]}
   set global variable   ${home_page_banner_id}

Post Admin parkings Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post admin parkings   &{kwargs}
   expect status is 422  ${resp}  

Post Admin parkings Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post admin parkings   &{kwargs}
   expect status is 403  ${resp}  

Get Admin home page banners Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin home page banners   &{kwargs}
   expect status is 403  ${resp}  

Get Admin home page banners Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin home page banners   &{kwargs}
   expect status is 200  ${resp}  admin_home_page_banner/Get_Admin_home_page_banners_200.json
   ${home_page_banner_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][home_page_banner_id]}
   set global variable   ${home_page_banner_id}

Put Admin home page banners By Id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  put admin home page banners by home page banner id  &{kwargs}
   expect status is 204  ${resp}  

Put Admin home page banners By Id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  put admin home page banners by home page banner id  &{kwargs}
   expect status is 422  ${resp}  

Put Admin home page banners By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  put admin home page banners by home page banner id  &{kwargs}
   expect status is 403  ${resp}  

Put Admin home page banners By Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  put admin home page banners by home page banner id  &{kwargs}
   expect status is 404  ${resp}  

