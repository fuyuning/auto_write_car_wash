*** Settings ***
Documentation  app_parking_coupon
Resource  ../resources.robot
Library  robot_washing_expert_library.parking_coupon.ParkingCouponLibrary
Force Tags  model:app_parking_coupon  虾客APP


*** Test Cases ***
post car wash parking coupons Fail Without Login
   [Documentation]  接口名:添加停车优惠劵${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   post car wash parking coupons fail 403   parking_id=${parking_id}  car_id=${car_id}  parking_coupon_no=${parking_coupon_no}    


*** Keywords ***
post car wash parking coupons Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post car wash parking coupons  &{kwargs}
   expect status is 403  ${resp}  

