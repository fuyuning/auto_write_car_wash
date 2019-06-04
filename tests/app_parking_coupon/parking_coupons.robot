*** Settings ***
Documentation  app_parking_coupon
Resource  ../resources.robot
Library  robot_washing_expert_library.parking_coupon.ParkingCouponLibrary
Suite Setup  Login  ${username}   ${password}
Force Tags  model:app_parking_coupon  虾客APP


*** Test Cases ***
post car wash parking coupons Success 
   [Documentation]  接口名:添加停车优惠劵${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 201,返回的Json数据符合验证。
   [Tags]           Respcode:201
   ${essential_params}  create dictionary  parking_id=${parking_id}  car_id=${car_id}  parking_coupon_no=${parking_coupon_no}  
   ${unessential_params}  create dictionary  
   run every case by params   post car wash parking coupons success 201   ${essential_params}  ${unessential_params}

post car wash parking coupons Fail With Wrong Params
   [Documentation]  接口名:添加停车优惠劵${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  parking_id=${parking_id_422}  car_id=${car_id_422}  parking_coupon_no=${parking_coupon_no_422}  
   ${unessential_params}  create dictionary  
   run every case by params   post car wash parking coupons fail 422   ${essential_params}  ${unessential_params}  success=False


*** Keywords ***
post car wash parking coupons Success 201
   [Arguments]  &{kwargs}
   ${resp}=  post car wash parking coupons  &{kwargs}
   expect status is 201  ${resp}  app_parking_coupon/post_car_wash_parking_coupons_201.json

post car wash parking coupons Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post car wash parking coupons  &{kwargs}
   expect status is 422  ${resp}  

