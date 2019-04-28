*** Settings ***
Documentation  admin_coupon_point
Resource  ../resources.robot
Library  robot_car_wash_server_library.coupon_point.CouponPointLibrary
Suite Setup  Login  ${admin_username}   ${admin_password}
Suite Teardown  Logout
Force Tags  model:admin_coupon_point  虾洗后台


*** Test Cases ***
patch admin coupon point autos enable by coupon point auto id Success 
   [Documentation]  接口名:自动定向发券启用${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create list  
   ${unessential_params}  create list  enable=False  
   run every case by params  patch admin coupon point autos enable by coupon point auto id Success 204  ${essential_params}  ${unessential_params}    coupon_point_auto_id=${coupon_point_auto_id}

patch admin coupon point autos enable by coupon point auto id Fail With Wrong Url
   [Documentation]  接口名:自动定向发券启用${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  
   ${unessential_params}  create list  enable=False  
   run every case by params  patch admin coupon point autos enable by coupon point auto id Fail 404  ${essential_params}  ${unessential_params}    coupon_point_auto_id=${wrong_url_id}

patch admin coupon point autos enable by coupon point auto id Fail With Wrong Params
   [Documentation]  接口名:自动定向发券启用${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  enable=ThisIsRobot!  
   run every case by params  patch admin coupon point autos enable by coupon point auto id Fail 422  ${essential_params}  ${unessential_params}    coupon_point_auto_id=${coupon_point_auto_id}  success=False

delete admin coupon point autos by coupon point auto id Fail With Wrong Url
   [Documentation]  接口名:删除自动定向发券${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   delete admin coupon point autos by coupon point auto id Fail 404    coupon_point_auto_id=${wrong_url_id}

delete admin coupon point autos by coupon point auto id Success 
   [Documentation]  接口名:删除自动定向发券${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   delete admin coupon point autos by coupon point auto id Success 204    coupon_point_auto_id=${coupon_point_auto_id}


*** Variables ***
${coupon_point_auto_id}  


*** Keywords ***
patch admin coupon point autos enable by coupon point auto id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  patch admin coupon point autos enable by coupon point auto id  &{kwargs}
   expect status is 204  ${resp}  

patch admin coupon point autos enable by coupon point auto id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  patch admin coupon point autos enable by coupon point auto id  &{kwargs}
   expect status is 404  ${resp}  

patch admin coupon point autos enable by coupon point auto id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  patch admin coupon point autos enable by coupon point auto id  &{kwargs}
   expect status is 422  ${resp}  

delete admin coupon point autos by coupon point auto id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  delete admin coupon point autos by coupon point auto id  &{kwargs}
   expect status is 404  ${resp}  

delete admin coupon point autos by coupon point auto id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  delete admin coupon point autos by coupon point auto id  &{kwargs}
   expect status is 204  ${resp}  

