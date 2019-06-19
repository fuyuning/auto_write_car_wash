*** Settings ***
Documentation  admin_shop_banner
Resource  ../resources.robot
Library  robot_car_wash_server_library.shop_banner.ShopBannerLibrary
Suite Setup  Login  ${username}   ${password}
Suite Teardown  Logout
Force Tags  model:admin_shop_banner  虾洗后台


*** Test Cases ***
get admin shop banner Success 
   [Documentation]  接口名:获取角标${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 ShopBanner 列表。
   [Tags]           Respcode:200
    get admin shop banner success 200

put admin shop banner by shop banner id Fail With Wrong Params
   [Documentation]  接口名:修改角标${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  banner=${banner_422}  service_introduce=${service_introduce_422}  
   run every case by params   put admin shop banner by shop banner id fail 422   ${essential_params}  ${unessential_params}    shop_banner_id=${shop_banner_id}  success=False

put admin shop banner by shop banner id Success 
   [Documentation]  接口名:修改角标${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  banner=${banner}  service_introduce=${service_introduce}  
   run every case by params   put admin shop banner by shop banner id success 204   ${essential_params}  ${unessential_params}    shop_banner_id=${shop_banner_id}

put admin shop banner by shop banner id Fail With Wrong Url
   [Documentation]  接口名:修改角标${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   put admin shop banner by shop banner id fail 404     shop_banner_id=${wrong_url_id}    banner=${banner}  service_introduce=${service_introduce}  


*** Variables ***
${shop_banner_id}  


*** Keywords ***
get admin shop banner Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin shop banner  &{kwargs}
   expect status is 200  ${resp}  admin_shop_banner/get_admin_shop_banner_200.json
   ${shop_banner_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0]['shop_banner_id']}
   set global variable   ${shop_banner_id}

put admin shop banner by shop banner id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  put admin shop banner by shop banner id  &{kwargs}
   expect status is 422  ${resp}  

put admin shop banner by shop banner id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  put admin shop banner by shop banner id  &{kwargs}
   expect status is 204  ${resp}  

put admin shop banner by shop banner id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  put admin shop banner by shop banner id  &{kwargs}
   expect status is 404  ${resp}  

