*** Settings ***
Documentation  wxmp_coupon
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.coupon.CouponLibrary
Suite Setup  Login By Openid  ${openid}

Force Tags  model:wxmp_coupon  车主微信端


*** Test Cases ***
Post coupon Fail Without Login
   [Documentation]  接口名:一次领多张优惠券${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  coupon_pool_ids=${coupon_pool_ids}  
   ${unessential_params}  create list  
   run every case by params  Post coupon pools achieve Fail 403  ${essential_params}  ${unessential_params}



Post coupon Success 
   [Documentation]  接口名:一次领多张优惠券${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 201,返回的Json数据符合验证。
   [Tags]           Respcode:201
   ${essential_params}  create list  coupon_pool_ids=${coupon_pool_ids}  
   ${unessential_params}  create list  
   run every case by params  Post coupon pools achieve Success 201  ${essential_params}  ${unessential_params}



Post coupon Fail With Wrong Params
   [Documentation]  接口名:一次领多张优惠券${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  coupon_pool_ids=${coupon_pool_ids}  
   ${unessential_params}  create list  
   run every case by params  Post coupon pools achieve Fail 422  ${essential_params}  ${unessential_params}



Post coupon By Id Success 
   [Documentation]  接口名:公众号外领取优惠券${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为  对象。
   [Tags]           Respcode:200
   ${essential_params}  create list  mobile=${mobile}  serie=${serie}  captcha=${captcha}  
   ${unessential_params}  create list  client_id=${client_id}  secret=${secret}  
   run every case by params  Post coupon pools By Id Success 200  ${essential_params}  ${unessential_params}  coupon_pool_id/achieve_by_mobile=${coupon_pool_id/achieve_by_mobile}



Post coupon By Id Fail With Wrong Params
   [Documentation]  接口名:公众号外领取优惠券${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  mobile=${mobile}  serie=${serie}  captcha=${captcha}  
   ${unessential_params}  create list  client_id=${client_id}  secret=${secret}  
   run every case by params  Post coupon pools By Id Fail 422  ${essential_params}  ${unessential_params}  coupon_pool_id/achieve_by_mobile=${coupon_pool_id/achieve_by_mobile}



Post coupon By Id Fail With Wrong Url
   [Documentation]  接口名:公众号外领取优惠券${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  mobile=${mobile}  serie=${serie}  captcha=${captcha}  
   ${unessential_params}  create list  client_id=${client_id}  secret=${secret}  
   run every case by params  Post coupon pools By Id Fail 404  ${essential_params}  ${unessential_params}  coupon_pool_id/achieve_by_mobile=${wrong_url_id}



Post coupon By Id Fail Without Login
   [Documentation]  接口名:领取优惠券${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Post coupon pools By Id Fail 403  coupon_pool_id/achieve=${coupon_pool_id/achieve}



Post coupon By Id Success 
   [Documentation]  接口名:领取优惠券${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   Post coupon pools By Id Success 204  coupon_pool_id/achieve=${coupon_pool_id/achieve}



Post coupon By Id Fail With Wrong Url
   [Documentation]  接口名:领取优惠券${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   Post coupon pools By Id Fail 404  coupon_pool_id/achieve=${wrong_url_id}



Get coupon Fail Without Login
   [Documentation]  接口名:我本单能用的一张优惠券${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  order_price=${order_price}  
   ${unessential_params}  create list  wash_area_id=${wash_area_id}  service_group_id=${service_group_id}  parking_id=${parking_id}  order_type=${order_type}  service_type=${service_type}  
   run every case by params  Get coupons usable Fail 403  ${essential_params}  ${unessential_params}



Get coupon Success 
   [Documentation]  接口名:我本单能用的一张优惠券${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 Coupon 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  order_price=${order_price}  
   ${unessential_params}  create list  wash_area_id=${wash_area_id}  service_group_id=${service_group_id}  parking_id=${parking_id}  order_type=${order_type}  service_type=${service_type}  
   run every case by params  Get coupons usable Success 200  ${essential_params}  ${unessential_params}



Get coupon Fail With Wrong Params
   [Documentation]  接口名:我本单能用的一张优惠券${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  order_price=${order_price}  
   ${unessential_params}  create list  wash_area_id=${wash_area_id}  service_group_id=${service_group_id}  parking_id=${parking_id}  order_type=${order_type}  service_type=${service_type}  
   run every case by params  Get coupons usable Fail 422  ${essential_params}  ${unessential_params}



Get coupon By Id Fail Without Login
   [Documentation]  接口名:带参数的,我能领的优惠券${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  is_point=${is_point}  
   ${unessential_params}  create list  
   run every case by params  Get user coupon pools By Id Fail 403  ${essential_params}  ${unessential_params}  coupon_pool_id=${coupon_pool_id}



Get coupon By Id Success 
   [Documentation]  接口名:带参数的,我能领的优惠券${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 CouponPool 对象。
   [Tags]           Respcode:200
   ${essential_params}  create list  is_point=${is_point}  
   ${unessential_params}  create list  
   run every case by params  Get user coupon pools By Id Success 200  ${essential_params}  ${unessential_params}  coupon_pool_id=${coupon_pool_id}



Get coupon By Id Fail With Wrong Params
   [Documentation]  接口名:带参数的,我能领的优惠券${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  is_point=${is_point}  
   ${unessential_params}  create list  
   run every case by params  Get user coupon pools By Id Fail 422  ${essential_params}  ${unessential_params}  coupon_pool_id=${coupon_pool_id}



Get coupon By Id Fail With Wrong Url
   [Documentation]  接口名:带参数的,我能领的优惠券${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  is_point=${is_point}  
   ${unessential_params}  create list  
   run every case by params  Get user coupon pools By Id Fail 404  ${essential_params}  ${unessential_params}  coupon_pool_id=${wrong_url_id}



Get coupon Fail Without Login
   [Documentation]  接口名:公众号外获取可领优惠券列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  section=${section}  page_limit=${page_limit}  
   run every case by params  Get mobile coupon pools Fail 403  ${essential_params}  ${unessential_params}



Get coupon Success 
   [Documentation]  接口名:公众号外获取可领优惠券列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 CouponPool 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  
   ${unessential_params}  create list  section=${section}  page_limit=${page_limit}  
   run every case by params  Get mobile coupon pools Success 200  ${essential_params}  ${unessential_params}



Get coupon Fail With Wrong Params
   [Documentation]  接口名:公众号外获取可领优惠券列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  section=${section}  page_limit=${page_limit}  
   run every case by params  Get mobile coupon pools Fail 422  ${essential_params}  ${unessential_params}



Get coupon Fail Without Login
   [Documentation]  接口名:我的优惠券列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  status=${status}  
   ${unessential_params}  create list  section=${section}  page_limit=${page_limit}  
   run every case by params  Get user coupons Fail 403  ${essential_params}  ${unessential_params}



Get coupon Success 
   [Documentation]  接口名:我的优惠券列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 Coupon 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  status=${status}  
   ${unessential_params}  create list  section=${section}  page_limit=${page_limit}  
   run every case by params  Get user coupons Success 200  ${essential_params}  ${unessential_params}



Get coupon Fail With Wrong Params
   [Documentation]  接口名:我的优惠券列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  status=${status}  
   ${unessential_params}  create list  section=${section}  page_limit=${page_limit}  
   run every case by params  Get user coupons Fail 422  ${essential_params}  ${unessential_params}



Get coupon Fail Without Login
   [Documentation]  接口名:我能领的优惠券${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  section=${section}  page_limit=${page_limit}  
   run every case by params  Get user coupon pools Fail 403  ${essential_params}  ${unessential_params}



Get coupon Success 
   [Documentation]  接口名:我能领的优惠券${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 CouponPool 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  
   ${unessential_params}  create list  section=${section}  page_limit=${page_limit}  
   run every case by params  Get user coupon pools Success 200  ${essential_params}  ${unessential_params}



Get coupon Fail With Wrong Params
   [Documentation]  接口名:我能领的优惠券${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  section=${section}  page_limit=${page_limit}  
   run every case by params  Get user coupon pools Fail 422  ${essential_params}  ${unessential_params}



*** Variables ***
${coupon_pool_id/achieve_by_mobile}
${coupon_pool_id/achieve}
${coupon_pool_id}


*** Keywords ***
Post Coupon pools achieve Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post coupon pools achieve   &{kwargs}
   expect status is 403  ${resp}  

Post Coupon pools achieve Success 201
   [Arguments]  &{kwargs}
   ${resp}=  post coupon pools achieve   &{kwargs}
   expect status is 201  ${resp}  wxmp_coupon/Post_Coupon_pools_achieve_201.json
   ${coupon_pool_id/achieve_by_mobile}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][coupon_pool_id/achieve_by_mobile]}
   set global variable   ${coupon_pool_id/achieve_by_mobile}
   ${coupon_pool_id/achieve}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][coupon_pool_id/achieve]}
   set global variable   ${coupon_pool_id/achieve}
   ${coupon_pool_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][coupon_pool_id]}
   set global variable   ${coupon_pool_id}

Post Coupon pools achieve Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post coupon pools achieve   &{kwargs}
   expect status is 422  ${resp}  

Post Coupon pools By Id Success 200
   [Arguments]  &{kwargs}
   ${resp}=  post achieve by mobile by coupon pool id  &{kwargs}
   expect status is 200  ${resp}  wxmp_coupon/Post_Coupon_pools_By_Id_200.json
   ${coupon_pool_id/achieve_by_mobile}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][coupon_pool_id/achieve_by_mobile]}
   set global variable   ${coupon_pool_id/achieve_by_mobile}
   ${coupon_pool_id/achieve}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][coupon_pool_id/achieve]}
   set global variable   ${coupon_pool_id/achieve}
   ${coupon_pool_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][coupon_pool_id]}
   set global variable   ${coupon_pool_id}

Post Coupon pools By Id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post achieve by mobile by coupon pool id  &{kwargs}
   expect status is 422  ${resp}  

Post Coupon pools By Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  post achieve by mobile by coupon pool id  &{kwargs}
   expect status is 404  ${resp}  

Post Coupon pools By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post achieve by coupon pool id  &{kwargs}
   expect status is 403  ${resp}  

Post Coupon pools By Id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  post achieve by coupon pool id  &{kwargs}
   expect status is 204  ${resp}  

Post Coupon pools By Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  post achieve by coupon pool id  &{kwargs}
   expect status is 404  ${resp}  

Get Coupons usable Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get coupons usable   &{kwargs}
   expect status is 403  ${resp}  

Get Coupons usable Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get coupons usable   &{kwargs}
   expect status is 200  ${resp}  wxmp_coupon/Get_Coupons_usable_200.json
   ${coupon_pool_id/achieve_by_mobile}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][coupon_pool_id/achieve_by_mobile]}
   set global variable   ${coupon_pool_id/achieve_by_mobile}
   ${coupon_pool_id/achieve}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][coupon_pool_id/achieve]}
   set global variable   ${coupon_pool_id/achieve}
   ${coupon_pool_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][coupon_pool_id]}
   set global variable   ${coupon_pool_id}

Get Coupons usable Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get coupons usable   &{kwargs}
   expect status is 422  ${resp}  

Get User coupon pools By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get user coupon pools by coupon pool id  &{kwargs}
   expect status is 403  ${resp}  

Get User coupon pools By Id Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get user coupon pools by coupon pool id  &{kwargs}
   expect status is 200  ${resp}  wxmp_coupon/Get_User_coupon_pools_By_Id_200.json
   ${coupon_pool_id/achieve_by_mobile}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][coupon_pool_id/achieve_by_mobile]}
   set global variable   ${coupon_pool_id/achieve_by_mobile}
   ${coupon_pool_id/achieve}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][coupon_pool_id/achieve]}
   set global variable   ${coupon_pool_id/achieve}
   ${coupon_pool_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][coupon_pool_id]}
   set global variable   ${coupon_pool_id}

Get User coupon pools By Id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get user coupon pools by coupon pool id  &{kwargs}
   expect status is 422  ${resp}  

Get User coupon pools By Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  get user coupon pools by coupon pool id  &{kwargs}
   expect status is 404  ${resp}  

Get Mobile coupon pools Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get mobile coupon pools   &{kwargs}
   expect status is 403  ${resp}  

Get Mobile coupon pools Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get mobile coupon pools   &{kwargs}
   expect status is 200  ${resp}  wxmp_coupon/Get_Mobile_coupon_pools_200.json
   ${coupon_pool_id/achieve_by_mobile}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][coupon_pool_id/achieve_by_mobile]}
   set global variable   ${coupon_pool_id/achieve_by_mobile}
   ${coupon_pool_id/achieve}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][coupon_pool_id/achieve]}
   set global variable   ${coupon_pool_id/achieve}
   ${coupon_pool_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][coupon_pool_id]}
   set global variable   ${coupon_pool_id}

Get Mobile coupon pools Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get mobile coupon pools   &{kwargs}
   expect status is 422  ${resp}  

Get User coupons Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get user coupons   &{kwargs}
   expect status is 403  ${resp}  

Get User coupons Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get user coupons   &{kwargs}
   expect status is 200  ${resp}  wxmp_coupon/Get_User_coupons_200.json
   ${coupon_pool_id/achieve_by_mobile}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][coupon_pool_id/achieve_by_mobile]}
   set global variable   ${coupon_pool_id/achieve_by_mobile}
   ${coupon_pool_id/achieve}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][coupon_pool_id/achieve]}
   set global variable   ${coupon_pool_id/achieve}
   ${coupon_pool_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][coupon_pool_id]}
   set global variable   ${coupon_pool_id}

Get User coupons Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get user coupons   &{kwargs}
   expect status is 422  ${resp}  

Get User coupon pools Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get user coupon pools   &{kwargs}
   expect status is 403  ${resp}  

Get User coupon pools Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get user coupon pools   &{kwargs}
   expect status is 200  ${resp}  wxmp_coupon/Get_User_coupon_pools_200.json
   ${coupon_pool_id/achieve_by_mobile}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][coupon_pool_id/achieve_by_mobile]}
   set global variable   ${coupon_pool_id/achieve_by_mobile}
   ${coupon_pool_id/achieve}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][coupon_pool_id/achieve]}
   set global variable   ${coupon_pool_id/achieve}
   ${coupon_pool_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][coupon_pool_id]}
   set global variable   ${coupon_pool_id}

Get User coupon pools Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get user coupon pools   &{kwargs}
   expect status is 422  ${resp}  

