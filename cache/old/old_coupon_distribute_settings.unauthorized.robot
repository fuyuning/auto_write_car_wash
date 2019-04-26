*** Settings ***
Documentation  admin_coupon_distribute_setting
Resource  ../resources.robot
Library  robot_car_wash_server_library.coupon_distribute_setting.CouponDistributeSettingLibrary
Force Tags  model:admin_coupon_distribute_setting  虾洗后台


*** Test Cases ***
Post Admin Coupon Distribute Settings Fail Without Login
   [Documentation]  接口名:创建新人优惠券发放设置${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  category=${category}  coupon_pool_id=${coupon_pool_id}  enabled=False  
   ${unessential_params}  create list  
   run every case by params  Post Admin Coupon Distribute Settings Fail 403  ${essential_params}  ${unessential_params}

Get Admin Coupon Distribute Settings Fail Without Login
   [Documentation]  接口名:获取新人优惠券发放设置${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  category=${category}  
   ${unessential_params}  create list  
   run every case by params  Get Admin Coupon Distribute Settings Fail 403  ${essential_params}  ${unessential_params}

Get coupon Distribute Settings (invite register|invite first) Fail Without Login
   [Documentation]  接口名:获取优惠券发放设置${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
    Get coupon Distribute Settings (invite register|invite first) Fail 403

Put Admin Coupon Distribute Settings By Setting Id Fail Without Login
   [Documentation]  接口名:修改新人优惠券发放设置${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  enabled=False  coupon_pool_id=${coupon_pool_id}  
   ${unessential_params}  create list  
   run every case by params  Put Admin Coupon Distribute Settings By Setting Id Fail 403  ${essential_params}  ${unessential_params}  setting_id=${setting_id}

Put coupon Distribute Settings (invite register|invite first|new user) Fail Without Login
   [Documentation]  接口名:优惠券发放设置修改${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  coupon_pool_id=${coupon_pool_id}  enabled=False  
   ${unessential_params}  create list  
   run every case by params  Put coupon Distribute Settings (invite register|invite first|new user) Fail 403  ${essential_params}  ${unessential_params}

Delete Admin Coupon Distribute Settings By Setting Id Fail Without Login
   [Documentation]  接口名:删除新人优惠券发放设置${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Delete Admin Coupon Distribute Settings By Setting Id Fail 403  setting_id=${setting_id}


*** Variables ***
${setting_id}  12345678909876543


*** Keywords ***
Post Admin Coupon Distribute Settings Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Post Admin Coupon Distribute Settings   &{kwargs}
   expect status is 403  ${resp}  

Get Admin Coupon Distribute Settings Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Coupon Distribute Settings   &{kwargs}
   expect status is 403  ${resp}  

Get coupon Distribute Settings (invite register|invite first) Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get coupon Distribute Settings (invite register|invite first)   &{kwargs}
   expect status is 403  ${resp}  

Put Admin Coupon Distribute Settings By Setting Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Put Admin Coupon Distribute Settings By Setting Id   &{kwargs}
   expect status is 403  ${resp}  

Put coupon Distribute Settings (invite register|invite first|new user) Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Put coupon Distribute Settings (invite register|invite first|new user)   &{kwargs}
   expect status is 403  ${resp}  

Delete Admin Coupon Distribute Settings By Setting Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Delete Admin Coupon Distribute Settings By Setting Id   &{kwargs}
   expect status is 403  ${resp}  

