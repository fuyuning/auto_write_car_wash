*** Settings ***
Documentation  admin_parking_coupon
Resource  ../resources.robot
Library  robot_car_wash_server_library.parking_coupon.ParkingCouponLibrary
Force Tags  model:admin_parking_coupon  虾洗后台


*** Test Cases ***
get admin parking coupons Fail Without Login
   [Documentation]  接口名:停车场劵列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get admin parking coupons fail 403     car_id=${car_id}  order_no=${order_no}  car_washer=${car_washer}  parking_id=${parking_id}  created_section=${created_section}  page_num=${page_num}  page_size=${page_size}  

delete admin parking coupons by parking coupon id Fail Without Login
   [Documentation]  接口名:删除优惠券${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   delete admin parking coupons by parking coupon id fail 403     parking_coupon_id=${parking_coupon_id}


*** Variables ***
${parking_coupon_id}  1a2b3c4d5e6f7zz


*** Keywords ***
get admin parking coupons Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin parking coupons  &{kwargs}
   expect status is 403  ${resp}  

delete admin parking coupons by parking coupon id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  delete admin parking coupons by parking coupon id  &{kwargs}
   expect status is 403  ${resp}  

