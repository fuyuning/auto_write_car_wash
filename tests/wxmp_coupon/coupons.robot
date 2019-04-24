*** Settings ***
Documentation  wxmp_coupon
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.coupon.CouponLibrary
Suite Setup  Login By Openid  ${openid}
Force Tags  model:wxmp_coupon  车主微信端


*** Test Cases ***
Post coupon Pools achieve Success 
   [Documentation]  接口名:一次领多张优惠券${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 201,返回的Json数据符合验证。
   [Tags]           Respcode:201
   ${essential_params}  create list  coupon_pool_ids=${coupon_pool_ids}  
   ${unessential_params}  create list  
   run every case by params  Post coupon Pools achieve Success 201  ${essential_params}  ${unessential_params}

Post coupon Pools achieve Fail With Wrong Params
   [Documentation]  接口名:一次领多张优惠券${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  coupon_pool_ids=${coupon_pool_ids}  
   ${unessential_params}  create list  
   run every case by params  Post coupon Pools achieve Fail 422  ${essential_params}  ${unessential_params}

Post achieve By Mobile by coupon pool id Success 
   [Documentation]  接口名:公众号外领取优惠券${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为  对象。
   [Tags]           Respcode:200
   ${essential_params}  create list  mobile=${mobile}  serie=${serie}  captcha=${captcha}  
   ${unessential_params}  create list  client_id=${client_id}  secret=${secret}  
   run every case by params  Post achieve By Mobile by coupon pool id Success 200  ${essential_params}  ${unessential_params}  coupon_pool_id/achieve_by_mobile=${coupon_pool_id/achieve_by_mobile}

Post achieve By Mobile by coupon pool id Fail With Wrong Params
   [Documentation]  接口名:公众号外领取优惠券${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  mobile=${mobile}  serie=${serie}  captcha=${captcha}  
   ${unessential_params}  create list  client_id=${client_id}  secret=${secret}  
   run every case by params  Post achieve By Mobile by coupon pool id Fail 422  ${essential_params}  ${unessential_params}  coupon_pool_id/achieve_by_mobile=${coupon_pool_id/achieve_by_mobile}

Post achieve By Mobile by coupon pool id Fail With Wrong Url
   [Documentation]  接口名:公众号外领取优惠券${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  mobile=${mobile}  serie=${serie}  captcha=${captcha}  
   ${unessential_params}  create list  client_id=${client_id}  secret=${secret}  
   run every case by params  Post achieve By Mobile by coupon pool id Fail 404  ${essential_params}  ${unessential_params}  coupon_pool_id/achieve_by_mobile=${wrong_url_id}

Post Achieve By Coupon Pool Id Success 
   [Documentation]  接口名:领取优惠券${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   Post Achieve By Coupon Pool Id Success 204  coupon_pool_id/achieve=${coupon_pool_id/achieve}

Post Achieve By Coupon Pool Id Fail With Wrong Url
   [Documentation]  接口名:领取优惠券${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   Post Achieve By Coupon Pool Id Fail 404  coupon_pool_id/achieve=${wrong_url_id}

Get Coupons Usable Success 
   [Documentation]  接口名:我本单能用的一张优惠券${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 Coupon 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  order_price=${order_price}  
   ${unessential_params}  create list  wash_area_id=${wash_area_id}  service_group_id=${service_group_id}  parking_id=${parking_id}  order_type=${order_type}  service_type=${service_type}  
   run every case by params  Get Coupons Usable Success 200  ${essential_params}  ${unessential_params}

Get Coupons Usable Fail With Wrong Params
   [Documentation]  接口名:我本单能用的一张优惠券${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  order_price=${order_price}  
   ${unessential_params}  create list  wash_area_id=${wash_area_id}  service_group_id=${service_group_id}  parking_id=${parking_id}  order_type=${order_type}  service_type=${service_type}  
   run every case by params  Get Coupons Usable Fail 422  ${essential_params}  ${unessential_params}

Get User Coupon Pools By Coupon Pool Id Success 
   [Documentation]  接口名:带参数的,我能领的优惠券${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 CouponPool 对象。
   [Tags]           Respcode:200
   ${essential_params}  create list  is_point=${is_point}  
   ${unessential_params}  create list  
   run every case by params  Get User Coupon Pools By Coupon Pool Id Success 200  ${essential_params}  ${unessential_params}  coupon_pool_id=${coupon_pool_id}

Get User Coupon Pools By Coupon Pool Id Fail With Wrong Params
   [Documentation]  接口名:带参数的,我能领的优惠券${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  is_point=${is_point}  
   ${unessential_params}  create list  
   run every case by params  Get User Coupon Pools By Coupon Pool Id Fail 422  ${essential_params}  ${unessential_params}  coupon_pool_id=${coupon_pool_id}

Get User Coupon Pools By Coupon Pool Id Fail With Wrong Url
   [Documentation]  接口名:带参数的,我能领的优惠券${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  is_point=${is_point}  
   ${unessential_params}  create list  
   run every case by params  Get User Coupon Pools By Coupon Pool Id Fail 404  ${essential_params}  ${unessential_params}  coupon_pool_id=${wrong_url_id}

Get Mobile Coupon Pools Success 
   [Documentation]  接口名:公众号外获取可领优惠券列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 CouponPool 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  
   ${unessential_params}  create list  section=${section}  page_limit=${page_limit}  
   run every case by params  Get Mobile Coupon Pools Success 200  ${essential_params}  ${unessential_params}

Get Mobile Coupon Pools Fail With Wrong Params
   [Documentation]  接口名:公众号外获取可领优惠券列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  section=${section}  page_limit=${page_limit}  
   run every case by params  Get Mobile Coupon Pools Fail 422  ${essential_params}  ${unessential_params}

Get User Coupons Success 
   [Documentation]  接口名:我的优惠券列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 Coupon 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  status=${status}  
   ${unessential_params}  create list  section=${section}  page_limit=${page_limit}  
   run every case by params  Get User Coupons Success 200  ${essential_params}  ${unessential_params}

Get User Coupons Fail With Wrong Params
   [Documentation]  接口名:我的优惠券列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  status=${status}  
   ${unessential_params}  create list  section=${section}  page_limit=${page_limit}  
   run every case by params  Get User Coupons Fail 422  ${essential_params}  ${unessential_params}

Get User Coupon Pools Success 
   [Documentation]  接口名:我能领的优惠券${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 CouponPool 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  
   ${unessential_params}  create list  section=${section}  page_limit=${page_limit}  
   run every case by params  Get User Coupon Pools Success 200  ${essential_params}  ${unessential_params}

Get User Coupon Pools Fail With Wrong Params
   [Documentation]  接口名:我能领的优惠券${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  section=${section}  page_limit=${page_limit}  
   run every case by params  Get User Coupon Pools Fail 422  ${essential_params}  ${unessential_params}


*** Variables ***
${coupon_pool_id/achieve_by_mobile}  
${coupon_pool_id/achieve}  
${coupon_pool_id}  


*** Keywords ***
Post coupon Pools achieve Success 201
   [Arguments]  &{kwargs}
   ${resp}=  Post coupon Pools achieve   &{kwargs}
   expect status is 201  ${resp}  wxmp_coupon/Post_coupon_Pools_achieve_201.json
   ${coupon_pool_id/achieve_by_mobile}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][coupon_pool_id/achieve_by_mobile]}
   set global variable   ${coupon_pool_id/achieve_by_mobile}
   ${coupon_pool_id/achieve}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][coupon_pool_id/achieve]}
   set global variable   ${coupon_pool_id/achieve}
   ${coupon_pool_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][coupon_pool_id]}
   set global variable   ${coupon_pool_id}

Post coupon Pools achieve Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Post coupon Pools achieve   &{kwargs}
   expect status is 422  ${resp}  

Post achieve By Mobile by coupon pool id Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Post achieve By Mobile by coupon pool id   &{kwargs}
   expect status is 200  ${resp}  wxmp_coupon/Post_achieve_By_Mobile_by_coupon_pool_id_200.json
   ${coupon_pool_id/achieve_by_mobile}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][coupon_pool_id/achieve_by_mobile]}
   set global variable   ${coupon_pool_id/achieve_by_mobile}
   ${coupon_pool_id/achieve}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][coupon_pool_id/achieve]}
   set global variable   ${coupon_pool_id/achieve}
   ${coupon_pool_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][coupon_pool_id]}
   set global variable   ${coupon_pool_id}

Post achieve By Mobile by coupon pool id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Post achieve By Mobile by coupon pool id   &{kwargs}
   expect status is 422  ${resp}  

Post achieve By Mobile by coupon pool id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  Post achieve By Mobile by coupon pool id   &{kwargs}
   expect status is 404  ${resp}  

Post Achieve By Coupon Pool Id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  Post Achieve By Coupon Pool Id   &{kwargs}
   expect status is 204  ${resp}  

Post Achieve By Coupon Pool Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  Post Achieve By Coupon Pool Id   &{kwargs}
   expect status is 404  ${resp}  

Get Coupons Usable Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Get Coupons Usable   &{kwargs}
   expect status is 200  ${resp}  wxmp_coupon/Get_Coupons_Usable_200.json
   ${coupon_pool_id/achieve_by_mobile}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][coupon_pool_id/achieve_by_mobile]}
   set global variable   ${coupon_pool_id/achieve_by_mobile}
   ${coupon_pool_id/achieve}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][coupon_pool_id/achieve]}
   set global variable   ${coupon_pool_id/achieve}
   ${coupon_pool_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][coupon_pool_id]}
   set global variable   ${coupon_pool_id}

Get Coupons Usable Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Get Coupons Usable   &{kwargs}
   expect status is 422  ${resp}  

Get User Coupon Pools By Coupon Pool Id Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Get User Coupon Pools By Coupon Pool Id   &{kwargs}
   expect status is 200  ${resp}  wxmp_coupon/Get_User_Coupon_Pools_By_Coupon_Pool_Id_200.json
   ${coupon_pool_id/achieve_by_mobile}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][coupon_pool_id/achieve_by_mobile]}
   set global variable   ${coupon_pool_id/achieve_by_mobile}
   ${coupon_pool_id/achieve}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][coupon_pool_id/achieve]}
   set global variable   ${coupon_pool_id/achieve}
   ${coupon_pool_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][coupon_pool_id]}
   set global variable   ${coupon_pool_id}

Get User Coupon Pools By Coupon Pool Id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Get User Coupon Pools By Coupon Pool Id   &{kwargs}
   expect status is 422  ${resp}  

Get User Coupon Pools By Coupon Pool Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  Get User Coupon Pools By Coupon Pool Id   &{kwargs}
   expect status is 404  ${resp}  

Get Mobile Coupon Pools Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Get Mobile Coupon Pools   &{kwargs}
   expect status is 200  ${resp}  wxmp_coupon/Get_Mobile_Coupon_Pools_200.json
   ${coupon_pool_id/achieve_by_mobile}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][coupon_pool_id/achieve_by_mobile]}
   set global variable   ${coupon_pool_id/achieve_by_mobile}
   ${coupon_pool_id/achieve}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][coupon_pool_id/achieve]}
   set global variable   ${coupon_pool_id/achieve}
   ${coupon_pool_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][coupon_pool_id]}
   set global variable   ${coupon_pool_id}

Get Mobile Coupon Pools Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Get Mobile Coupon Pools   &{kwargs}
   expect status is 422  ${resp}  

Get User Coupons Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Get User Coupons   &{kwargs}
   expect status is 200  ${resp}  wxmp_coupon/Get_User_Coupons_200.json
   ${coupon_pool_id/achieve_by_mobile}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][coupon_pool_id/achieve_by_mobile]}
   set global variable   ${coupon_pool_id/achieve_by_mobile}
   ${coupon_pool_id/achieve}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][coupon_pool_id/achieve]}
   set global variable   ${coupon_pool_id/achieve}
   ${coupon_pool_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][coupon_pool_id]}
   set global variable   ${coupon_pool_id}

Get User Coupons Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Get User Coupons   &{kwargs}
   expect status is 422  ${resp}  

Get User Coupon Pools Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Get User Coupon Pools   &{kwargs}
   expect status is 200  ${resp}  wxmp_coupon/Get_User_Coupon_Pools_200.json
   ${coupon_pool_id/achieve_by_mobile}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][coupon_pool_id/achieve_by_mobile]}
   set global variable   ${coupon_pool_id/achieve_by_mobile}
   ${coupon_pool_id/achieve}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][coupon_pool_id/achieve]}
   set global variable   ${coupon_pool_id/achieve}
   ${coupon_pool_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][coupon_pool_id]}
   set global variable   ${coupon_pool_id}

Get User Coupon Pools Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Get User Coupon Pools   &{kwargs}
   expect status is 422  ${resp}  

