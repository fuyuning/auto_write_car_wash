*** Settings ***
Documentation  admin_coupon_distribute_setting
Resource  ../resources.robot
Library  robot_car_wash_server_library.coupon_distribute_setting.CouponDistributeSettingLibrary
Suite Setup  Login  ${admin_username}   ${admin_password}
Suite Teardown  Logout
Force Tags  model:admin_coupon_distribute_setting  虾洗后台


*** Test Cases ***
Post coupon_distribute_setting Fail Without Login
   [Documentation]  接口名:创建新人优惠券发放设置${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  category=${category}  coupon_pool_id=${coupon_pool_id}  enabled=False  
   ${unessential_params}  create list  
   run every case by params  Post admin coupon distribute settings Fail 403  ${essential_params}  ${unessential_params}



Post coupon_distribute_setting Success 
   [Documentation]  接口名:创建新人优惠券发放设置${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 201,返回的Json数据符合验证。
   [Tags]           Respcode:201
   ${essential_params}  create list  category=${category}  coupon_pool_id=${coupon_pool_id}  enabled=False  
   ${unessential_params}  create list  
   run every case by params  Post admin coupon distribute settings Success 201  ${essential_params}  ${unessential_params}



Post coupon_distribute_setting Fail With Wrong Params
   [Documentation]  接口名:创建新人优惠券发放设置${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  category=${category}  coupon_pool_id=${coupon_pool_id}  enabled=False  
   ${unessential_params}  create list  
   run every case by params  Post admin coupon distribute settings Fail 422  ${essential_params}  ${unessential_params}



Get coupon_distribute_setting Fail Without Login
   [Documentation]  接口名:获取新人优惠券发放设置${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  category=${category}  
   ${unessential_params}  create list  
   run every case by params  Get admin coupon distribute settings Fail 403  ${essential_params}  ${unessential_params}



Get coupon_distribute_setting Success 
   [Documentation]  接口名:获取新人优惠券发放设置${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 CouponDistributeSetting 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  category=${category}  
   ${unessential_params}  create list  
   run every case by params  Get admin coupon distribute settings Success 200  ${essential_params}  ${unessential_params}



Get coupon_distribute_setting Fail With Wrong Params
   [Documentation]  接口名:获取新人优惠券发放设置${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  category=${category}  
   ${unessential_params}  create list  
   run every case by params  Get admin coupon distribute settings Fail 422  ${essential_params}  ${unessential_params}



Get coupon_distribute_setting Fail Without Login
   [Documentation]  接口名:获取优惠券发放设置${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
    Get coupon distribute settings (invite register|invite first) Fail 403


Get coupon_distribute_setting Success 
   [Documentation]  接口名:获取优惠券发放设置${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为  列表。
   [Tags]           Respcode:200
    Get coupon distribute settings (invite register|invite first) Success 200


Put coupon_distribute_setting By Id Success 
   [Documentation]  接口名:修改新人优惠券发放设置${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create list  enabled=False  coupon_pool_id=${coupon_pool_id}  
   ${unessential_params}  create list  
   run every case by params  Put admin coupon distribute settings By Id Success 204  ${essential_params}  ${unessential_params}  setting_id=${setting_id}



Put coupon_distribute_setting By Id Fail With Wrong Params
   [Documentation]  接口名:修改新人优惠券发放设置${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  enabled=False  coupon_pool_id=${coupon_pool_id}  
   ${unessential_params}  create list  
   run every case by params  Put admin coupon distribute settings By Id Fail 422  ${essential_params}  ${unessential_params}  setting_id=${setting_id}



Put coupon_distribute_setting By Id Fail Without Login
   [Documentation]  接口名:修改新人优惠券发放设置${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  enabled=False  coupon_pool_id=${coupon_pool_id}  
   ${unessential_params}  create list  
   run every case by params  Put admin coupon distribute settings By Id Fail 403  ${essential_params}  ${unessential_params}  setting_id=${setting_id}



Put coupon_distribute_setting By Id Fail With Wrong Url
   [Documentation]  接口名:修改新人优惠券发放设置${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  enabled=False  coupon_pool_id=${coupon_pool_id}  
   ${unessential_params}  create list  
   run every case by params  Put admin coupon distribute settings By Id Fail 404  ${essential_params}  ${unessential_params}  setting_id=${wrong_url_id}



Put coupon_distribute_setting Fail Without Login
   [Documentation]  接口名:优惠券发放设置修改${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  coupon_pool_id=${coupon_pool_id}  enabled=False  
   ${unessential_params}  create list  
   run every case by params  Put coupon distribute settings (invite register|invite first|new user) Fail 403  ${essential_params}  ${unessential_params}



Put coupon_distribute_setting Success 
   [Documentation]  接口名:优惠券发放设置修改${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create list  coupon_pool_id=${coupon_pool_id}  enabled=False  
   ${unessential_params}  create list  
   run every case by params  Put coupon distribute settings (invite register|invite first|new user) Success 204  ${essential_params}  ${unessential_params}



Put coupon_distribute_setting Fail With Wrong Params
   [Documentation]  接口名:优惠券发放设置修改${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  coupon_pool_id=${coupon_pool_id}  enabled=False  
   ${unessential_params}  create list  
   run every case by params  Put coupon distribute settings (invite register|invite first|new user) Fail 422  ${essential_params}  ${unessential_params}



Delete coupon_distribute_setting By Id Success 
   [Documentation]  接口名:删除新人优惠券发放设置${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   Delete admin coupon distribute settings By Id Success 204  setting_id=${setting_id}



Delete coupon_distribute_setting By Id Fail With Wrong Url
   [Documentation]  接口名:删除新人优惠券发放设置${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   Delete admin coupon distribute settings By Id Fail 404  setting_id=${wrong_url_id}



Delete coupon_distribute_setting By Id Fail Without Login
   [Documentation]  接口名:删除新人优惠券发放设置${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Delete admin coupon distribute settings By Id Fail 403  setting_id=${setting_id}



*** Variables ***
${setting_id}


*** Keywords ***
Post Admin coupon distribute settings Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post admin coupon distribute settings   &{kwargs}
   expect status is 403  ${resp}  

Post Admin coupon distribute settings Success 201
   [Arguments]  &{kwargs}
   ${resp}=  post admin coupon distribute settings   &{kwargs}
   expect status is 201  ${resp}  admin_coupon_distribute_setting/Post_Admin_coupon_distribute_settings_201.json
   ${setting_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][setting_id]}
   set global variable   ${setting_id}

Post Admin coupon distribute settings Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post admin coupon distribute settings   &{kwargs}
   expect status is 422  ${resp}  

Get Admin coupon distribute settings Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin coupon distribute settings   &{kwargs}
   expect status is 403  ${resp}  

Get Admin coupon distribute settings Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin coupon distribute settings   &{kwargs}
   expect status is 200  ${resp}  admin_coupon_distribute_setting/Get_Admin_coupon_distribute_settings_200.json
   ${setting_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][setting_id]}
   set global variable   ${setting_id}

Get Admin coupon distribute settings Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get admin coupon distribute settings   &{kwargs}
   expect status is 422  ${resp}  

Get Coupon distribute settings (invite register|invite first) Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get coupon distribute settings (invite register|invite first)   &{kwargs}
   expect status is 403  ${resp}  

Get Coupon distribute settings (invite register|invite first) Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get coupon distribute settings (invite register|invite first)   &{kwargs}
   expect status is 200  ${resp}  admin_coupon_distribute_setting/Get_Coupon_distribute_settings_(invite_register|invite_first)_200.json
   ${setting_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][setting_id]}
   set global variable   ${setting_id}

Put Admin coupon distribute settings By Id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  put admin coupon distribute settings by setting id  &{kwargs}
   expect status is 204  ${resp}  

Put Admin coupon distribute settings By Id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  put admin coupon distribute settings by setting id  &{kwargs}
   expect status is 422  ${resp}  

Put Admin coupon distribute settings By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  put admin coupon distribute settings by setting id  &{kwargs}
   expect status is 403  ${resp}  

Put Admin coupon distribute settings By Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  put admin coupon distribute settings by setting id  &{kwargs}
   expect status is 404  ${resp}  

Put Coupon distribute settings (invite register|invite first|new user) Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  put coupon distribute settings (invite register|invite first|new user)   &{kwargs}
   expect status is 403  ${resp}  

Put Coupon distribute settings (invite register|invite first|new user) Success 204
   [Arguments]  &{kwargs}
   ${resp}=  put coupon distribute settings (invite register|invite first|new user)   &{kwargs}
   expect status is 204  ${resp}  

Put Coupon distribute settings (invite register|invite first|new user) Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  put coupon distribute settings (invite register|invite first|new user)   &{kwargs}
   expect status is 422  ${resp}  

Delete Admin coupon distribute settings By Id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  delete admin coupon distribute settings by setting id  &{kwargs}
   expect status is 204  ${resp}  

Delete Admin coupon distribute settings By Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  delete admin coupon distribute settings by setting id  &{kwargs}
   expect status is 404  ${resp}  

Delete Admin coupon distribute settings By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  delete admin coupon distribute settings by setting id  &{kwargs}
   expect status is 403  ${resp}  

