*** Settings ***
Documentation  admin_parking_coupon
Resource  ../resources.robot
Library  robot_car_wash_server_library.parking_coupon.ParkingCouponLibrary
Suite Setup  Login  ${username}   ${password}
Suite Teardown  Logout
Force Tags  model:admin_parking_coupon  虾洗后台


*** Test Cases ***
get admin parking coupons Success 
   [Documentation]  接口名:停车场劵列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 ParkingCoupon 列表。
   [Tags]           Respcode:200
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  car_id=${car_id}  order_no=${order_no}  car_washer=${car_washer}  parking_id=${parking_id}  created_section=${created_section}  page_num=${page_num}  page_size=${page_size}  
   run every case by params   get admin parking coupons success 200   ${essential_params}  ${unessential_params}

get admin parking coupons Fail With Wrong Params
   [Documentation]  接口名:停车场劵列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  car_id=${car_id_422}  order_no=${order_no_422}  car_washer=${car_washer_422}  parking_id=${parking_id_422}  created_section=${created_section_422}  page_num=${page_num_422}  page_size=${page_size_422}  
   run every case by params   get admin parking coupons fail 422   ${essential_params}  ${unessential_params}  success=False

delete admin parking coupons by parking coupon id Fail With Wrong Url
   [Documentation]  接口名:删除优惠券${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   delete admin parking coupons by parking coupon id fail 404     parking_coupon_id=${wrong_url_id}

delete admin parking coupons by parking coupon id Success 
   [Documentation]  接口名:删除优惠券${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   delete admin parking coupons by parking coupon id success 204     parking_coupon_id=${parking_coupon_id}


*** Variables ***
${parking_coupon_id}  


*** Keywords ***
get admin parking coupons Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin parking coupons  &{kwargs}
   expect status is 200  ${resp}  admin_parking_coupon/get_admin_parking_coupons_200.json
   ${parking_coupon_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0]['parking_coupon_id']}
   set global variable   ${parking_coupon_id}

get admin parking coupons Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get admin parking coupons  &{kwargs}
   expect status is 422  ${resp}  

delete admin parking coupons by parking coupon id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  delete admin parking coupons by parking coupon id  &{kwargs}
   expect status is 404  ${resp}  

delete admin parking coupons by parking coupon id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  delete admin parking coupons by parking coupon id  &{kwargs}
   expect status is 204  ${resp}  

