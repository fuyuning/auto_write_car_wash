*** Settings ***
Documentation  admin_coupon_point
Resource  ../resources.robot
Library  robot_car_wash_server_library.coupon_point.CouponPointLibrary
Force Tags  model:admin_coupon_point  虾洗后台


*** Test Cases ***
patch admin coupon point autos enable by coupon point auto id Fail Without Login
   [Documentation]  接口名:自动定向发券启用${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  enable=False  
   run every case by params  patch admin coupon point autos enable by coupon point auto id Fail 403  ${essential_params}  ${unessential_params}    coupon_point_auto_id=${coupon_point_auto_id}

delete admin coupon point autos by coupon point auto id Fail Without Login
   [Documentation]  接口名:删除自动定向发券${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   delete admin coupon point autos by coupon point auto id Fail 403    coupon_point_auto_id=${coupon_point_auto_id}


*** Variables ***
${coupon_point_auto_id}  12345678909876543


*** Keywords ***
patch admin coupon point autos enable by coupon point auto id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch admin coupon point autos enable by coupon point auto id  &{kwargs}
   expect status is 403  ${resp}  

delete admin coupon point autos by coupon point auto id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  delete admin coupon point autos by coupon point auto id  &{kwargs}
   expect status is 403  ${resp}  

