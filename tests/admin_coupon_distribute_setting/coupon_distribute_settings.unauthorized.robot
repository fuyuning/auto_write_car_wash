*** Settings ***
Documentation  admin_coupon_distribute_setting
Resource  ../resources.robot
Library  robot_car_wash_server_library.coupon_distribute_setting.CouponDistributeSettingLibrary
Force Tags  model:admin_coupon_distribute_setting  虾洗后台


*** Test Cases ***
post admin coupon distribute settings Fail Without Login
   [Documentation]  接口名:创建新人优惠券发放设置${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  category=${category}  coupon_pool_id=${coupon_pool_id}  enabled=False  
   ${unessential_params}  create list  
   run every case by params  post admin coupon distribute settings Fail 403  ${essential_params}  ${unessential_params}

get admin coupon distribute settings Fail Without Login
   [Documentation]  接口名:获取新人优惠券发放设置${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  category=${category}  
   ${unessential_params}  create list  
   run every case by params  get admin coupon distribute settings Fail 403  ${essential_params}  ${unessential_params}

get admin coupon distribute settings (invite register|invite first) Fail Without Login
   [Documentation]  接口名:获取优惠券发放设置${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
    get admin coupon distribute settings (invite register|invite first) Fail 403

put admin coupon distribute settings by setting id Fail Without Login
   [Documentation]  接口名:修改新人优惠券发放设置${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  enabled=False  coupon_pool_id=${coupon_pool_id}  
   ${unessential_params}  create list  
   run every case by params  put admin coupon distribute settings by setting id Fail 403  ${essential_params}  ${unessential_params}    setting_id=${setting_id}

put admin coupon distribute settings (invite register|invite first|new user) Fail Without Login
   [Documentation]  接口名:优惠券发放设置修改${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  coupon_pool_id=${coupon_pool_id}  enabled=False  
   ${unessential_params}  create list  
   run every case by params  put admin coupon distribute settings (invite register|invite first|new user) Fail 403  ${essential_params}  ${unessential_params}

delete admin coupon distribute settings by setting id Fail Without Login
   [Documentation]  接口名:删除新人优惠券发放设置${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   delete admin coupon distribute settings by setting id Fail 403    setting_id=${setting_id}


*** Variables ***
${setting_id}  12345678909876543


*** Keywords ***
post admin coupon distribute settings Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post admin coupon distribute settings  &{kwargs}
   expect status is 403  ${resp}  

get admin coupon distribute settings Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin coupon distribute settings  &{kwargs}
   expect status is 403  ${resp}  

get admin coupon distribute settings (invite register|invite first) Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin coupon distribute settings (invite register|invite first)  &{kwargs}
   expect status is 403  ${resp}  

put admin coupon distribute settings by setting id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  put admin coupon distribute settings by setting id  &{kwargs}
   expect status is 403  ${resp}  

put admin coupon distribute settings (invite register|invite first|new user) Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  put admin coupon distribute settings (invite register|invite first|new user)  &{kwargs}
   expect status is 403  ${resp}  

delete admin coupon distribute settings by setting id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  delete admin coupon distribute settings by setting id  &{kwargs}
   expect status is 403  ${resp}  

