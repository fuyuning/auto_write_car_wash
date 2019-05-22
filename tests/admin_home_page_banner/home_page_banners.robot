*** Settings ***
Documentation  admin_home_page_banner
Resource  ../resources.robot
Library  robot_car_wash_server_library.home_page_banner.HomePageBannerLibrary
Suite Setup  Login  ${admin_username}   ${admin_password}
Suite Teardown  Logout
Force Tags  model:admin_home_page_banner  虾洗后台


*** Test Cases ***
post admin parkings Fail With Wrong Params
   [Documentation]  接口名:添加首页信息${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  banners=${banners_422}  service_introduce=${service_introduce_422}  
   run every case by params  post admin parkings Fail 422  ${essential_params}  ${unessential_params}  success=False

post admin parkings Success 
   [Documentation]  接口名:添加首页信息${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 201,返回的Json数据符合验证。
   [Tags]           Respcode:201
   ${essential_params}  create list  
   ${unessential_params}  create list  banners=${banners}  service_introduce=${service_introduce}  
   run every case by params  post admin parkings Success 201  ${essential_params}  ${unessential_params}

get admin home page banners Success 
   [Documentation]  接口名:首页信息列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 HomePageBanner 列表。
   [Tags]           Respcode:200
    get admin home page banners Success 200

put admin home page banners by home page banner id Fail With Wrong Params
   [Documentation]  接口名:修改首页信息${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  banners=${banners_422}  service_introduce=${service_introduce_422}  
   run every case by params  put admin home page banners by home page banner id Fail 422  ${essential_params}  ${unessential_params}    home_page_banner_id=${home_page_banner_id}  success=False

put admin home page banners by home page banner id Success 
   [Documentation]  接口名:修改首页信息${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create list  
   ${unessential_params}  create list  banners=${banners}  service_introduce=${service_introduce}  
   run every case by params  put admin home page banners by home page banner id Success 204  ${essential_params}  ${unessential_params}    home_page_banner_id=${home_page_banner_id}

put admin home page banners by home page banner id Fail With Wrong Url
   [Documentation]  接口名:修改首页信息${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  
   ${unessential_params}  create list  banners=${banners}  service_introduce=${service_introduce}  
   run every case by params  put admin home page banners by home page banner id Fail 404  ${essential_params}  ${unessential_params}    home_page_banner_id=${wrong_url_id}


*** Variables ***
${home_page_banner_id}  


*** Keywords ***
post admin parkings Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post admin parkings  &{kwargs}
   expect status is 422  ${resp}  

post admin parkings Success 201
   [Arguments]  &{kwargs}
   ${resp}=  post admin parkings  &{kwargs}
   expect status is 201  ${resp}  admin_home_page_banner/post_admin_parkings_201.json
   ${home_page_banner_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][home_page_banner_id]}
   set global variable   ${home_page_banner_id}

get admin home page banners Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin home page banners  &{kwargs}
   expect status is 200  ${resp}  admin_home_page_banner/get_admin_home_page_banners_200.json
   ${home_page_banner_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][home_page_banner_id]}
   set global variable   ${home_page_banner_id}

put admin home page banners by home page banner id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  put admin home page banners by home page banner id  &{kwargs}
   expect status is 422  ${resp}  

put admin home page banners by home page banner id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  put admin home page banners by home page banner id  &{kwargs}
   expect status is 204  ${resp}  

put admin home page banners by home page banner id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  put admin home page banners by home page banner id  &{kwargs}
   expect status is 404  ${resp}  

