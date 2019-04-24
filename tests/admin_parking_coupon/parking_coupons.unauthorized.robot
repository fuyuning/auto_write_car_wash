*** Settings ***
Documentation  admin_parking_coupon
Resource  ../resources.robot
Library  robot_car_wash_server_library.parking_coupon.ParkingCouponLibrary
Force Tags  model:admin_parking_coupon  虾洗后台


*** Test Cases ***
Get Admin Parking Coupons Fail Without Login
   [Documentation]  接口名:停车场劵列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  car_id=${car_id}  order_no=${order_no}  car_washer=${car_washer}  parking_id=${parking_id}  created_section=${created_section}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get Admin Parking Coupons Fail 403  ${essential_params}  ${unessential_params}

Delete Admin Parking Coupons By Parking Coupon Id Fail Without Login
   [Documentation]  接口名:删除优惠券${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Delete Admin Parking Coupons By Parking Coupon Id Fail 403  parking_coupon_id=${parking_coupon_id}


*** Variables ***
${parking_coupon_id}  12345678909876543


*** Keywords ***
Get Admin Parking Coupons Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Parking Coupons   &{kwargs}
   expect status is 403  ${resp}  

Delete Admin Parking Coupons By Parking Coupon Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Delete Admin Parking Coupons By Parking Coupon Id   &{kwargs}
   expect status is 403  ${resp}  

