*** Settings ***
Documentation  wxmp_coupon
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.coupon.CouponLibrary
Suite Setup  Login By Openid  ${openid}
Force Tags  model:wxmp_coupon  车主微信端


*** Test Cases ***
post user coupon pools achieve Success 
   [Documentation]  接口名:一次领多张优惠券${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 201,返回的Json数据符合验证。
   [Tags]           Respcode:201
   ${essential_params}  create list  coupon_pool_ids=${coupon_pool_ids}  
   ${unessential_params}  create list  
   run every case by params  post user coupon pools achieve Success 201  ${essential_params}  ${unessential_params}

post user coupon pools achieve Fail With Wrong Params
   [Documentation]  接口名:一次领多张优惠券${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  coupon_pool_ids=${coupon_pool_ids_422}  
   ${unessential_params}  create list  
   run every case by params  post user coupon pools achieve Fail 422  ${essential_params}  ${unessential_params}  success=False

post coupon pools achieve by mobile by coupon pool id Success 
   [Documentation]  接口名:公众号外领取优惠券${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为  对象。
   [Tags]           Respcode:200
   ${essential_params}  create list  mobile=${mobile}  serie=${serie}  captcha=${captcha}  
   ${unessential_params}  create list  client_id=${client_id}  secret=${secret}  
   run every case by params  post coupon pools achieve by mobile by coupon pool id Success 200  ${essential_params}  ${unessential_params}    coupon_pool_id=${coupon_pool_id}

post coupon pools achieve by mobile by coupon pool id Fail With Wrong Params
   [Documentation]  接口名:公众号外领取优惠券${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  mobile=${mobile_422}  serie=${serie_422}  captcha=${captcha_422}  
   ${unessential_params}  create list  client_id=${client_id_422}  secret=${secret_422}  
   run every case by params  post coupon pools achieve by mobile by coupon pool id Fail 422  ${essential_params}  ${unessential_params}    coupon_pool_id=${coupon_pool_id}  success=False

post coupon pools achieve by mobile by coupon pool id Fail With Wrong Url
   [Documentation]  接口名:公众号外领取优惠券${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  mobile=${mobile}  serie=${serie}  captcha=${captcha}  
   ${unessential_params}  create list  client_id=${client_id}  secret=${secret}  
   run every case by params  post coupon pools achieve by mobile by coupon pool id Fail 404  ${essential_params}  ${unessential_params}    coupon_pool_id=${wrong_url_id}

post coupon pools achieve by coupon pool id Success 
   [Documentation]  接口名:领取优惠券${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   post coupon pools achieve by coupon pool id Success 204    coupon_pool_id=${coupon_pool_id}

post coupon pools achieve by coupon pool id Fail With Wrong Url
   [Documentation]  接口名:领取优惠券${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   post coupon pools achieve by coupon pool id Fail 404    coupon_pool_id=${wrong_url_id}

get user coupons usable Success 
   [Documentation]  接口名:我本单能用的一张优惠券${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 Coupon 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  order_price=${order_price}  
   ${unessential_params}  create list  wash_area_id=${wash_area_id}  service_group_id=${service_group_id}  parking_id=${parking_id}  order_type=${order_type}  service_type=${service_type}  
   run every case by params  get user coupons usable Success 200  ${essential_params}  ${unessential_params}

get user coupons usable Fail With Wrong Params
   [Documentation]  接口名:我本单能用的一张优惠券${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  order_price=${order_price_422}  
   ${unessential_params}  create list  wash_area_id=${wash_area_id_422}  service_group_id=${service_group_id_422}  parking_id=${parking_id_422}  order_type=${order_type_422}  service_type=${service_type_422}  
   run every case by params  get user coupons usable Fail 422  ${essential_params}  ${unessential_params}  success=False

get user coupon pools by coupon pool id Success 
   [Documentation]  接口名:带参数的,我能领的优惠券${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 CouponPool 对象。
   [Tags]           Respcode:200
   ${essential_params}  create list  is_point=${is_point}  
   ${unessential_params}  create list  
   run every case by params  get user coupon pools by coupon pool id Success 200  ${essential_params}  ${unessential_params}    coupon_pool_id=${coupon_pool_id}

get user coupon pools by coupon pool id Fail With Wrong Params
   [Documentation]  接口名:带参数的,我能领的优惠券${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  is_point=${is_point_422}  
   ${unessential_params}  create list  
   run every case by params  get user coupon pools by coupon pool id Fail 422  ${essential_params}  ${unessential_params}    coupon_pool_id=${coupon_pool_id}  success=False

get user coupon pools by coupon pool id Fail With Wrong Url
   [Documentation]  接口名:带参数的,我能领的优惠券${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  is_point=${is_point}  
   ${unessential_params}  create list  
   run every case by params  get user coupon pools by coupon pool id Fail 404  ${essential_params}  ${unessential_params}    coupon_pool_id=${wrong_url_id}

get mobile coupon pools Success 
   [Documentation]  接口名:公众号外获取可领优惠券列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 CouponPool 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  
   ${unessential_params}  create list  section=${section}  page_limit=${page_limit}  
   run every case by params  get mobile coupon pools Success 200  ${essential_params}  ${unessential_params}

get mobile coupon pools Fail With Wrong Params
   [Documentation]  接口名:公众号外获取可领优惠券列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  section=${section_422}  page_limit=${page_limit_422}  
   run every case by params  get mobile coupon pools Fail 422  ${essential_params}  ${unessential_params}  success=False

get user coupons Success 
   [Documentation]  接口名:我的优惠券列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 Coupon 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  status=${status}  
   ${unessential_params}  create list  section=${section}  page_limit=${page_limit}  
   run every case by params  get user coupons Success 200  ${essential_params}  ${unessential_params}

get user coupons Fail With Wrong Params
   [Documentation]  接口名:我的优惠券列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  status=${status_422}  
   ${unessential_params}  create list  section=${section_422}  page_limit=${page_limit_422}  
   run every case by params  get user coupons Fail 422  ${essential_params}  ${unessential_params}  success=False

get user coupon pools Success 
   [Documentation]  接口名:我能领的优惠券${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 CouponPool 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  
   ${unessential_params}  create list  section=${section}  page_limit=${page_limit}  
   run every case by params  get user coupon pools Success 200  ${essential_params}  ${unessential_params}

get user coupon pools Fail With Wrong Params
   [Documentation]  接口名:我能领的优惠券${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  section=${section_422}  page_limit=${page_limit_422}  
   run every case by params  get user coupon pools Fail 422  ${essential_params}  ${unessential_params}  success=False


*** Variables ***
${coupon_pool_id}  


*** Keywords ***
post user coupon pools achieve Success 201
   [Arguments]  &{kwargs}
   ${resp}=  post user coupon pools achieve  &{kwargs}
   expect status is 201  ${resp}  wxmp_coupon/post_user_coupon_pools_achieve_201.json
   ${coupon_pool_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][coupon_pool_id]}
   set global variable   ${coupon_pool_id}

post user coupon pools achieve Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post user coupon pools achieve  &{kwargs}
   expect status is 422  ${resp}  

post coupon pools achieve by mobile by coupon pool id Success 200
   [Arguments]  &{kwargs}
   ${resp}=  post coupon pools achieve by mobile by coupon pool id  &{kwargs}
   expect status is 200  ${resp}  wxmp_coupon/post_coupon_pools_achieve_by_mobile_by_coupon_pool_id_200.json
   ${coupon_pool_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][coupon_pool_id]}
   set global variable   ${coupon_pool_id}

post coupon pools achieve by mobile by coupon pool id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post coupon pools achieve by mobile by coupon pool id  &{kwargs}
   expect status is 422  ${resp}  

post coupon pools achieve by mobile by coupon pool id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  post coupon pools achieve by mobile by coupon pool id  &{kwargs}
   expect status is 404  ${resp}  

post coupon pools achieve by coupon pool id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  post coupon pools achieve by coupon pool id  &{kwargs}
   expect status is 204  ${resp}  

post coupon pools achieve by coupon pool id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  post coupon pools achieve by coupon pool id  &{kwargs}
   expect status is 404  ${resp}  

get user coupons usable Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get user coupons usable  &{kwargs}
   expect status is 200  ${resp}  wxmp_coupon/get_user_coupons_usable_200.json
   ${coupon_pool_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][coupon_pool_id]}
   set global variable   ${coupon_pool_id}

get user coupons usable Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get user coupons usable  &{kwargs}
   expect status is 422  ${resp}  

get user coupon pools by coupon pool id Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get user coupon pools by coupon pool id  &{kwargs}
   expect status is 200  ${resp}  wxmp_coupon/get_user_coupon_pools_by_coupon_pool_id_200.json
   ${coupon_pool_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][coupon_pool_id]}
   set global variable   ${coupon_pool_id}

get user coupon pools by coupon pool id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get user coupon pools by coupon pool id  &{kwargs}
   expect status is 422  ${resp}  

get user coupon pools by coupon pool id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  get user coupon pools by coupon pool id  &{kwargs}
   expect status is 404  ${resp}  

get mobile coupon pools Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get mobile coupon pools  &{kwargs}
   expect status is 200  ${resp}  wxmp_coupon/get_mobile_coupon_pools_200.json
   ${coupon_pool_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][coupon_pool_id]}
   set global variable   ${coupon_pool_id}

get mobile coupon pools Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get mobile coupon pools  &{kwargs}
   expect status is 422  ${resp}  

get user coupons Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get user coupons  &{kwargs}
   expect status is 200  ${resp}  wxmp_coupon/get_user_coupons_200.json
   ${coupon_pool_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][coupon_pool_id]}
   set global variable   ${coupon_pool_id}

get user coupons Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get user coupons  &{kwargs}
   expect status is 422  ${resp}  

get user coupon pools Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get user coupon pools  &{kwargs}
   expect status is 200  ${resp}  wxmp_coupon/get_user_coupon_pools_200.json
   ${coupon_pool_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][coupon_pool_id]}
   set global variable   ${coupon_pool_id}

get user coupon pools Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get user coupon pools  &{kwargs}
   expect status is 422  ${resp}  

