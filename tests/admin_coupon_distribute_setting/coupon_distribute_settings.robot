*** Settings ***
Documentation  admin_coupon_distribute_setting
Resource  ../resources.robot
Library  robot_car_wash_server_library.coupon_distribute_setting.CouponDistributeSettingLibrary
Suite Setup  Login  ${username}   ${password}
Suite Teardown  Logout
Force Tags  model:admin_coupon_distribute_setting  虾洗后台


*** Test Cases ***
post admin coupon distribute settings Success 
   [Documentation]  接口名:创建新人优惠券发放设置${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 201,返回的Json数据符合验证。
   [Tags]           Respcode:201
   ${essential_params}  create dictionary  category=${category}  coupon_pool_id=${coupon_pool_id}  enabled=False  order_by=${order_by}  
   ${unessential_params}  create dictionary  
   run every case by params   post admin coupon distribute settings success 201   ${essential_params}  ${unessential_params}

post admin coupon distribute settings Fail With Wrong Params
   [Documentation]  接口名:创建新人优惠券发放设置${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  category=${category_422}  coupon_pool_id=${coupon_pool_id_422}  enabled=ThisIsRobot!  order_by=${order_by_422}  
   ${unessential_params}  create dictionary  
   run every case by params   post admin coupon distribute settings fail 422   ${essential_params}  ${unessential_params}  success=False

get admin coupon distribute settings Success 
   [Documentation]  接口名:获取新人优惠券发放设置${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 CouponDistributeSetting 列表。
   [Tags]           Respcode:200
   ${essential_params}  create dictionary  category=${category}  
   ${unessential_params}  create dictionary  
   run every case by params   get admin coupon distribute settings success 200   ${essential_params}  ${unessential_params}

get admin coupon distribute settings Fail With Wrong Params
   [Documentation]  接口名:获取新人优惠券发放设置${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  category=${category_422}  
   ${unessential_params}  create dictionary  
   run every case by params   get admin coupon distribute settings fail 422   ${essential_params}  ${unessential_params}  success=False

get admin coupon distribute settings (invite register|invite first) Success 
   [Documentation]  接口名:获取优惠券发放设置${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为  列表。
   [Tags]           Respcode:200
    get admin coupon distribute settings (invite register|invite first) success 200

put admin coupon distribute settings by setting id Fail With Wrong Params
   [Documentation]  接口名:修改新人优惠券发放设置${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  enabled=ThisIsRobot!  coupon_pool_id=${coupon_pool_id_422}  
   ${unessential_params}  create dictionary  
   run every case by params   put admin coupon distribute settings by setting id fail 422   ${essential_params}  ${unessential_params}    setting_id=${setting_id}  success=False

put admin coupon distribute settings by setting id Success 
   [Documentation]  接口名:修改新人优惠券发放设置${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create dictionary  enabled=False  coupon_pool_id=${coupon_pool_id}  
   ${unessential_params}  create dictionary  
   run every case by params   put admin coupon distribute settings by setting id success 204   ${essential_params}  ${unessential_params}    setting_id=${setting_id}

put admin coupon distribute settings by setting id Fail With Wrong Url
   [Documentation]  接口名:修改新人优惠券发放设置${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   put admin coupon distribute settings by setting id fail 404     setting_id=${wrong_url_id}  enabled=False  coupon_pool_id=${coupon_pool_id}    

put admin coupon distribute settings (invite register|invite first|new user) Success 
   [Documentation]  接口名:优惠券发放设置修改${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create dictionary  coupon_pool_id=${coupon_pool_id}  enabled=False  
   ${unessential_params}  create dictionary  
   run every case by params   put admin coupon distribute settings (invite register|invite first|new user) success 204   ${essential_params}  ${unessential_params}

put admin coupon distribute settings (invite register|invite first|new user) Fail With Wrong Params
   [Documentation]  接口名:优惠券发放设置修改${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  coupon_pool_id=${coupon_pool_id_422}  enabled=ThisIsRobot!  
   ${unessential_params}  create dictionary  
   run every case by params   put admin coupon distribute settings (invite register|invite first|new user) fail 422   ${essential_params}  ${unessential_params}  success=False

delete admin coupon distribute settings by setting id Fail With Wrong Url
   [Documentation]  接口名:删除新人优惠券发放设置${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   delete admin coupon distribute settings by setting id fail 404     setting_id=${wrong_url_id}

delete admin coupon distribute settings by setting id Success 
   [Documentation]  接口名:删除新人优惠券发放设置${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   delete admin coupon distribute settings by setting id success 204     setting_id=${setting_id}


*** Variables ***
${setting_id}  


*** Keywords ***
post admin coupon distribute settings Success 201
   [Arguments]  &{kwargs}
   ${resp}=  post admin coupon distribute settings  &{kwargs}
   expect status is 201  ${resp}  admin_coupon_distribute_setting/post_admin_coupon_distribute_settings_201.json
   ${setting_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0]['setting_id']}
   set global variable   ${setting_id}

post admin coupon distribute settings Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post admin coupon distribute settings  &{kwargs}
   expect status is 422  ${resp}  

get admin coupon distribute settings Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin coupon distribute settings  &{kwargs}
   expect status is 200  ${resp}  admin_coupon_distribute_setting/get_admin_coupon_distribute_settings_200.json
   ${setting_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0]['setting_id']}
   set global variable   ${setting_id}

get admin coupon distribute settings Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get admin coupon distribute settings  &{kwargs}
   expect status is 422  ${resp}  

get admin coupon distribute settings (invite register|invite first) Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin coupon distribute settings (invite register|invite first)  &{kwargs}
   expect status is 200  ${resp}  admin_coupon_distribute_setting/get_admin_coupon_distribute_settings_(invite_register|invite_first)_200.json
   ${setting_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0]['setting_id']}
   set global variable   ${setting_id}

put admin coupon distribute settings by setting id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  put admin coupon distribute settings by setting id  &{kwargs}
   expect status is 422  ${resp}  

put admin coupon distribute settings by setting id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  put admin coupon distribute settings by setting id  &{kwargs}
   expect status is 204  ${resp}  

put admin coupon distribute settings by setting id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  put admin coupon distribute settings by setting id  &{kwargs}
   expect status is 404  ${resp}  

put admin coupon distribute settings (invite register|invite first|new user) Success 204
   [Arguments]  &{kwargs}
   ${resp}=  put admin coupon distribute settings (invite register|invite first|new user)  &{kwargs}
   expect status is 204  ${resp}  

put admin coupon distribute settings (invite register|invite first|new user) Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  put admin coupon distribute settings (invite register|invite first|new user)  &{kwargs}
   expect status is 422  ${resp}  

delete admin coupon distribute settings by setting id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  delete admin coupon distribute settings by setting id  &{kwargs}
   expect status is 404  ${resp}  

delete admin coupon distribute settings by setting id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  delete admin coupon distribute settings by setting id  &{kwargs}
   expect status is 204  ${resp}  

