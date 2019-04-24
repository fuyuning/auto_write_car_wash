*** Settings ***
Documentation  admin_coupon_distribute_setting
Resource  ../resources.robot
Library  robot_car_wash_server_library.coupon_distribute_setting.CouponDistributeSettingLibrary
Suite Setup  Login  ${admin_username}   ${admin_password}
Suite Teardown  Logout
Force Tags  model:admin_coupon_distribute_setting  虾洗后台


*** Test Cases ***
Post Admin Coupon Distribute Settings Success 
   [Documentation]  接口名:创建新人优惠券发放设置${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 201,返回的Json数据符合验证。
   [Tags]           Respcode:201
   ${essential_params}  create list  category=${category}  coupon_pool_id=${coupon_pool_id}  enabled=False  
   ${unessential_params}  create list  
   run every case by params  Post Admin Coupon Distribute Settings Success 201  ${essential_params}  ${unessential_params}

Post Admin Coupon Distribute Settings Fail With Wrong Params
   [Documentation]  接口名:创建新人优惠券发放设置${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  category=${category}  coupon_pool_id=${coupon_pool_id}  enabled=False  
   ${unessential_params}  create list  
   run every case by params  Post Admin Coupon Distribute Settings Fail 422  ${essential_params}  ${unessential_params}

Get Admin Coupon Distribute Settings Success 
   [Documentation]  接口名:获取新人优惠券发放设置${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 CouponDistributeSetting 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  category=${category}  
   ${unessential_params}  create list  
   run every case by params  Get Admin Coupon Distribute Settings Success 200  ${essential_params}  ${unessential_params}

Get Admin Coupon Distribute Settings Fail With Wrong Params
   [Documentation]  接口名:获取新人优惠券发放设置${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  category=${category}  
   ${unessential_params}  create list  
   run every case by params  Get Admin Coupon Distribute Settings Fail 422  ${essential_params}  ${unessential_params}

Get coupon Distribute Settings (invite register|invite first) Success 
   [Documentation]  接口名:获取优惠券发放设置${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为  列表。
   [Tags]           Respcode:200
    Get coupon Distribute Settings (invite register|invite first) Success 200

Put Admin Coupon Distribute Settings By Setting Id Fail With Wrong Params
   [Documentation]  接口名:修改新人优惠券发放设置${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  enabled=False  coupon_pool_id=${coupon_pool_id}  
   ${unessential_params}  create list  
   run every case by params  Put Admin Coupon Distribute Settings By Setting Id Fail 422  ${essential_params}  ${unessential_params}  setting_id=${setting_id}

Put Admin Coupon Distribute Settings By Setting Id Success 
   [Documentation]  接口名:修改新人优惠券发放设置${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create list  enabled=False  coupon_pool_id=${coupon_pool_id}  
   ${unessential_params}  create list  
   run every case by params  Put Admin Coupon Distribute Settings By Setting Id Success 204  ${essential_params}  ${unessential_params}  setting_id=${setting_id}

Put Admin Coupon Distribute Settings By Setting Id Fail With Wrong Url
   [Documentation]  接口名:修改新人优惠券发放设置${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  enabled=False  coupon_pool_id=${coupon_pool_id}  
   ${unessential_params}  create list  
   run every case by params  Put Admin Coupon Distribute Settings By Setting Id Fail 404  ${essential_params}  ${unessential_params}  setting_id=${wrong_url_id}

Put coupon Distribute Settings (invite register|invite first|new user) Success 
   [Documentation]  接口名:优惠券发放设置修改${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create list  coupon_pool_id=${coupon_pool_id}  enabled=False  
   ${unessential_params}  create list  
   run every case by params  Put coupon Distribute Settings (invite register|invite first|new user) Success 204  ${essential_params}  ${unessential_params}

Put coupon Distribute Settings (invite register|invite first|new user) Fail With Wrong Params
   [Documentation]  接口名:优惠券发放设置修改${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  coupon_pool_id=${coupon_pool_id}  enabled=False  
   ${unessential_params}  create list  
   run every case by params  Put coupon Distribute Settings (invite register|invite first|new user) Fail 422  ${essential_params}  ${unessential_params}

Delete Admin Coupon Distribute Settings By Setting Id Fail With Wrong Url
   [Documentation]  接口名:删除新人优惠券发放设置${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   Delete Admin Coupon Distribute Settings By Setting Id Fail 404  setting_id=${wrong_url_id}

Delete Admin Coupon Distribute Settings By Setting Id Success 
   [Documentation]  接口名:删除新人优惠券发放设置${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   Delete Admin Coupon Distribute Settings By Setting Id Success 204  setting_id=${setting_id}


*** Variables ***
${setting_id}  


*** Keywords ***
Post Admin Coupon Distribute Settings Success 201
   [Arguments]  &{kwargs}
   ${resp}=  Post Admin Coupon Distribute Settings   &{kwargs}
   expect status is 201  ${resp}  admin_coupon_distribute_setting/Post_Admin_Coupon_Distribute_Settings_201.json
   ${setting_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][setting_id]}
   set global variable   ${setting_id}

Post Admin Coupon Distribute Settings Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Post Admin Coupon Distribute Settings   &{kwargs}
   expect status is 422  ${resp}  

Get Admin Coupon Distribute Settings Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Coupon Distribute Settings   &{kwargs}
   expect status is 200  ${resp}  admin_coupon_distribute_setting/Get_Admin_Coupon_Distribute_Settings_200.json
   ${setting_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][setting_id]}
   set global variable   ${setting_id}

Get Admin Coupon Distribute Settings Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Coupon Distribute Settings   &{kwargs}
   expect status is 422  ${resp}  

Get coupon Distribute Settings (invite register|invite first) Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Get coupon Distribute Settings (invite register|invite first)   &{kwargs}
   expect status is 200  ${resp}  admin_coupon_distribute_setting/Get_coupon_Distribute_Settings_(invite_register|invite_first)_200.json
   ${setting_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][setting_id]}
   set global variable   ${setting_id}

Put Admin Coupon Distribute Settings By Setting Id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Put Admin Coupon Distribute Settings By Setting Id   &{kwargs}
   expect status is 422  ${resp}  

Put Admin Coupon Distribute Settings By Setting Id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  Put Admin Coupon Distribute Settings By Setting Id   &{kwargs}
   expect status is 204  ${resp}  

Put Admin Coupon Distribute Settings By Setting Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  Put Admin Coupon Distribute Settings By Setting Id   &{kwargs}
   expect status is 404  ${resp}  

Put coupon Distribute Settings (invite register|invite first|new user) Success 204
   [Arguments]  &{kwargs}
   ${resp}=  Put coupon Distribute Settings (invite register|invite first|new user)   &{kwargs}
   expect status is 204  ${resp}  

Put coupon Distribute Settings (invite register|invite first|new user) Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Put coupon Distribute Settings (invite register|invite first|new user)   &{kwargs}
   expect status is 422  ${resp}  

Delete Admin Coupon Distribute Settings By Setting Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  Delete Admin Coupon Distribute Settings By Setting Id   &{kwargs}
   expect status is 404  ${resp}  

Delete Admin Coupon Distribute Settings By Setting Id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  Delete Admin Coupon Distribute Settings By Setting Id   &{kwargs}
   expect status is 204  ${resp}  

