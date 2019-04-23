*** Settings ***
Documentation  admin_parking_coupon
Resource  ../resources.robot
Library  robot_car_wash_server_library.parking_coupon.ParkingCouponLibrary
Suite Setup  Login  ${admin_username}   ${admin_password}
Suite Teardown  Logout
Force Tags  model:admin_parking_coupon  虾洗后台


*** Test Cases ***
Get parking_coupon Fail Without Login
   [Documentation]  接口名:停车场劵列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  car_id=${car_id}  order_no=${order_no}  car_washer=${car_washer}  parking_id=${parking_id}  created_section=${created_section}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get admin parking coupons Fail 403  ${essential_params}  ${unessential_params}



Get parking_coupon Success 
   [Documentation]  接口名:停车场劵列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 ParkingCoupon 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  
   ${unessential_params}  create list  car_id=${car_id}  order_no=${order_no}  car_washer=${car_washer}  parking_id=${parking_id}  created_section=${created_section}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get admin parking coupons Success 200  ${essential_params}  ${unessential_params}



Get parking_coupon Fail With Wrong Params
   [Documentation]  接口名:停车场劵列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  car_id=${car_id}  order_no=${order_no}  car_washer=${car_washer}  parking_id=${parking_id}  created_section=${created_section}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get admin parking coupons Fail 422  ${essential_params}  ${unessential_params}



Delete parking_coupon By Id Success 
   [Documentation]  接口名:删除优惠券${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   Delete admin parking coupons By Id Success 204  parking_coupon_id=${parking_coupon_id}



Delete parking_coupon By Id Fail With Wrong Url
   [Documentation]  接口名:删除优惠券${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   Delete admin parking coupons By Id Fail 404  parking_coupon_id=${wrong_url_id}



Delete parking_coupon By Id Fail Without Login
   [Documentation]  接口名:删除优惠券${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Delete admin parking coupons By Id Fail 403  parking_coupon_id=${parking_coupon_id}



*** Variables ***
${parking_coupon_id}


*** Keywords ***
Get Admin parking coupons Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin parking coupons   &{kwargs}
   expect status is 403  ${resp}  

Get Admin parking coupons Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin parking coupons   &{kwargs}
   expect status is 200  ${resp}  admin_parking_coupon/Get_Admin_parking_coupons_200.json
   ${parking_coupon_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][parking_coupon_id]}
   set global variable   ${parking_coupon_id}

Get Admin parking coupons Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get admin parking coupons   &{kwargs}
   expect status is 422  ${resp}  

Delete Admin parking coupons By Id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  delete admin parking coupons by parking coupon id  &{kwargs}
   expect status is 204  ${resp}  

Delete Admin parking coupons By Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  delete admin parking coupons by parking coupon id  &{kwargs}
   expect status is 404  ${resp}  

Delete Admin parking coupons By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  delete admin parking coupons by parking coupon id  &{kwargs}
   expect status is 403  ${resp}  

