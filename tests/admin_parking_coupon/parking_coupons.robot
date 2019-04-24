*** Settings ***
Documentation  admin_parking_coupon
Resource  ../resources.robot
Library  robot_car_wash_server_library.parking_coupon.ParkingCouponLibrary
Suite Setup  Login  ${admin_username}   ${admin_password}
Suite Teardown  Logout
Force Tags  model:admin_parking_coupon  虾洗后台


*** Test Cases ***
Get Admin Parking Coupons Success 
   [Documentation]  接口名:停车场劵列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 ParkingCoupon 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  
   ${unessential_params}  create list  car_id=${car_id}  order_no=${order_no}  car_washer=${car_washer}  parking_id=${parking_id}  created_section=${created_section}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get Admin Parking Coupons Success 200  ${essential_params}  ${unessential_params}

Get Admin Parking Coupons Fail With Wrong Params
   [Documentation]  接口名:停车场劵列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  car_id=${car_id}  order_no=${order_no}  car_washer=${car_washer}  parking_id=${parking_id}  created_section=${created_section}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get Admin Parking Coupons Fail 422  ${essential_params}  ${unessential_params}

Delete Admin Parking Coupons By Parking Coupon Id Success 
   [Documentation]  接口名:删除优惠券${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   Delete Admin Parking Coupons By Parking Coupon Id Success 204  parking_coupon_id=${parking_coupon_id}

Delete Admin Parking Coupons By Parking Coupon Id Fail With Wrong Url
   [Documentation]  接口名:删除优惠券${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   Delete Admin Parking Coupons By Parking Coupon Id Fail 404  parking_coupon_id=${wrong_url_id}


*** Variables ***
${parking_coupon_id}


*** Keywords ***
Get Admin Parking Coupons Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Parking Coupons   &{kwargs}
   expect status is 200  ${resp}  admin_parking_coupon/Get_Admin_Parking_Coupons_200.json
   ${parking_coupon_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][parking_coupon_id]}
   set global variable   ${parking_coupon_id}

Get Admin Parking Coupons Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Parking Coupons   &{kwargs}
   expect status is 422  ${resp}  

Delete Admin Parking Coupons By Parking Coupon Id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  Delete Admin Parking Coupons By Parking Coupon Id   &{kwargs}
   expect status is 204  ${resp}  

Delete Admin Parking Coupons By Parking Coupon Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  Delete Admin Parking Coupons By Parking Coupon Id   &{kwargs}
   expect status is 404  ${resp}  

