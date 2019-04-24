*** Settings ***
Documentation  app_parking_coupon
Resource  ../resources.robot
Library  robot_car_wash_app_library.parking_coupon.ParkingCouponLibrary
Suite Setup  Login  ${app_username}  ${app_password}

Force Tags  model:app_parking_coupon  虾客APP


*** Test Cases ***
Post car Wash parking coupons Success 
   [Documentation]  接口名:添加停车优惠劵${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 201,返回的Json数据符合验证。
   [Tags]           Respcode:201
   ${essential_params}  create list  parking_id=${parking_id}  car_id=${car_id}  parking_coupon_no=${parking_coupon_no}  
   ${unessential_params}  create list  
   run every case by params  Post car Wash parking coupons Success 201  ${essential_params}  ${unessential_params}

Post car Wash parking coupons Fail With Wrong Params
   [Documentation]  接口名:添加停车优惠劵${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  parking_id=${parking_id}  car_id=${car_id}  parking_coupon_no=${parking_coupon_no}  
   ${unessential_params}  create list  
   run every case by params  Post car Wash parking coupons Fail 422  ${essential_params}  ${unessential_params}


*** Keywords ***
Post car Wash parking coupons Success 201
   [Arguments]  &{kwargs}
   ${resp}=  Post car Wash parking coupons   &{kwargs}
   expect status is 201  ${resp}  app_parking_coupon/Post_car_Wash_parking_coupons_201.json

Post car Wash parking coupons Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Post car Wash parking coupons   &{kwargs}
   expect status is 422  ${resp}  

