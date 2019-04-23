*** Settings ***
Documentation  admin_promoter
Resource  ../resources.robot
Library  robot_car_wash_server_library.promoter.PromoterLibrary
Suite Setup  Login  ${admin_username}   ${admin_password}
Suite Teardown  Logout
Force Tags  model:admin_promoter  虾洗后台


*** Test Cases ***
Post promoter Fail Without Login
   [Documentation]  接口名:添加二维码${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  promoter_no=${promoter_no}  
   ${unessential_params}  create list  name=${name}  mobile=${mobile}  promoter_remark=${promoter_remark}  enabled=False  
   run every case by params  Post admin promoters Fail 403  ${essential_params}  ${unessential_params}



Post promoter Success 
   [Documentation]  接口名:添加二维码${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 201,返回的Json数据符合验证。
   [Tags]           Respcode:201
   ${essential_params}  create list  promoter_no=${promoter_no}  
   ${unessential_params}  create list  name=${name}  mobile=${mobile}  promoter_remark=${promoter_remark}  enabled=False  
   run every case by params  Post admin promoters Success 201  ${essential_params}  ${unessential_params}



Post promoter Fail With Wrong Params
   [Documentation]  接口名:添加二维码${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  promoter_no=${promoter_no}  
   ${unessential_params}  create list  name=${name}  mobile=${mobile}  promoter_remark=${promoter_remark}  enabled=False  
   run every case by params  Post admin promoters Fail 422  ${essential_params}  ${unessential_params}



Get promoter Fail Without Login
   [Documentation]  接口名:推广二维码列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  name=${name}  mobile=${mobile}  promoter_remark=${promoter_remark}  
   run every case by params  Get admin promoters Fail 403  ${essential_params}  ${unessential_params}



Get promoter Success 
   [Documentation]  接口名:推广二维码列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 Promoter 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  
   ${unessential_params}  create list  name=${name}  mobile=${mobile}  promoter_remark=${promoter_remark}  
   run every case by params  Get admin promoters Success 200  ${essential_params}  ${unessential_params}



Get promoter Fail With Wrong Params
   [Documentation]  接口名:推广二维码列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  name=${name}  mobile=${mobile}  promoter_remark=${promoter_remark}  
   run every case by params  Get admin promoters Fail 422  ${essential_params}  ${unessential_params}



Get promoter Fail Without Login
   [Documentation]  接口名:二维码用户列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  promoter_id=${promoter_id}  
   ${unessential_params}  create list  user_id=${user_id}  mobile=${mobile}  car_id=${car_id}  created_section=${created_section}  
   run every case by params  Get admin promotions Fail 403  ${essential_params}  ${unessential_params}



Get promoter Success 
   [Documentation]  接口名:二维码用户列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 Promotion 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  promoter_id=${promoter_id}  
   ${unessential_params}  create list  user_id=${user_id}  mobile=${mobile}  car_id=${car_id}  created_section=${created_section}  
   run every case by params  Get admin promotions Success 200  ${essential_params}  ${unessential_params}



Get promoter Fail With Wrong Params
   [Documentation]  接口名:二维码用户列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  promoter_id=${promoter_id}  
   ${unessential_params}  create list  user_id=${user_id}  mobile=${mobile}  car_id=${car_id}  created_section=${created_section}  
   run every case by params  Get admin promotions Fail 422  ${essential_params}  ${unessential_params}



Get promoter Fail Without Login
   [Documentation]  接口名:二维码推广统计${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  promoter_id=${promoter_id}  created_section=${created_section}  
   run every case by params  Get admin promotion count Fail 403  ${essential_params}  ${unessential_params}



Get promoter Success 
   [Documentation]  接口名:二维码推广统计${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为  列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  
   ${unessential_params}  create list  promoter_id=${promoter_id}  created_section=${created_section}  
   run every case by params  Get admin promotion count Success 200  ${essential_params}  ${unessential_params}



Get promoter Fail With Wrong Params
   [Documentation]  接口名:二维码推广统计${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  promoter_id=${promoter_id}  created_section=${created_section}  
   run every case by params  Get admin promotion count Fail 422  ${essential_params}  ${unessential_params}



Put promoter By Id Success 
   [Documentation]  接口名:编辑二维码${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create list  
   ${unessential_params}  create list  name=${name}  mobile=${mobile}  promoter_remark=${promoter_remark}  enabled=False  
   run every case by params  Put admin promoters By Id Success 204  ${essential_params}  ${unessential_params}  promoter_id=${promoter_id}



Put promoter By Id Fail With Wrong Params
   [Documentation]  接口名:编辑二维码${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  name=${name}  mobile=${mobile}  promoter_remark=${promoter_remark}  enabled=False  
   run every case by params  Put admin promoters By Id Fail 422  ${essential_params}  ${unessential_params}  promoter_id=${promoter_id}



Put promoter By Id Fail Without Login
   [Documentation]  接口名:编辑二维码${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  name=${name}  mobile=${mobile}  promoter_remark=${promoter_remark}  enabled=False  
   run every case by params  Put admin promoters By Id Fail 403  ${essential_params}  ${unessential_params}  promoter_id=${promoter_id}



Put promoter By Id Fail With Wrong Url
   [Documentation]  接口名:编辑二维码${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  
   ${unessential_params}  create list  name=${name}  mobile=${mobile}  promoter_remark=${promoter_remark}  enabled=False  
   run every case by params  Put admin promoters By Id Fail 404  ${essential_params}  ${unessential_params}  promoter_id=${wrong_url_id}



Patch promoter By Id Success 
   [Documentation]  接口名:二维码推广启用${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create list  
   ${unessential_params}  create list  enabled=False  
   run every case by params  Patch admin promoters By Id Success 204  ${essential_params}  ${unessential_params}  promoter_id/enabled=${promoter_id/enabled}



Patch promoter By Id Fail With Wrong Url
   [Documentation]  接口名:二维码推广启用${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  
   ${unessential_params}  create list  enabled=False  
   run every case by params  Patch admin promoters By Id Fail 404  ${essential_params}  ${unessential_params}  promoter_id/enabled=${wrong_url_id}



Patch promoter By Id Fail Without Login
   [Documentation]  接口名:二维码推广启用${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  enabled=False  
   run every case by params  Patch admin promoters By Id Fail 403  ${essential_params}  ${unessential_params}  promoter_id/enabled=${promoter_id/enabled}



Patch promoter By Id Fail With Wrong Params
   [Documentation]  接口名:二维码推广启用${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  enabled=False  
   run every case by params  Patch admin promoters By Id Fail 422  ${essential_params}  ${unessential_params}  promoter_id/enabled=${promoter_id/enabled}



Delete promoter By Id Success 
   [Documentation]  接口名:删除二维码${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   Delete admin promoters By Id Success 204  promoter_id=${promoter_id}



Delete promoter By Id Fail With Wrong Url
   [Documentation]  接口名:删除二维码${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   Delete admin promoters By Id Fail 404  promoter_id=${wrong_url_id}



Delete promoter By Id Fail Without Login
   [Documentation]  接口名:删除二维码${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Delete admin promoters By Id Fail 403  promoter_id=${promoter_id}



*** Variables ***
${promoter_id}
${promoter_id/enabled}


*** Keywords ***
Post Admin promoters Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post admin promoters   &{kwargs}
   expect status is 403  ${resp}  

Post Admin promoters Success 201
   [Arguments]  &{kwargs}
   ${resp}=  post admin promoters   &{kwargs}
   expect status is 201  ${resp}  admin_promoter/Post_Admin_promoters_201.json
   ${promoter_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][promoter_id]}
   set global variable   ${promoter_id}
   ${promoter_id/enabled}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][promoter_id/enabled]}
   set global variable   ${promoter_id/enabled}

Post Admin promoters Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post admin promoters   &{kwargs}
   expect status is 422  ${resp}  

Get Admin promoters Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin promoters   &{kwargs}
   expect status is 403  ${resp}  

Get Admin promoters Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin promoters   &{kwargs}
   expect status is 200  ${resp}  admin_promoter/Get_Admin_promoters_200.json
   ${promoter_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][promoter_id]}
   set global variable   ${promoter_id}
   ${promoter_id/enabled}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][promoter_id/enabled]}
   set global variable   ${promoter_id/enabled}

Get Admin promoters Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get admin promoters   &{kwargs}
   expect status is 422  ${resp}  

Get Admin promotions Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin promotions   &{kwargs}
   expect status is 403  ${resp}  

Get Admin promotions Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin promotions   &{kwargs}
   expect status is 200  ${resp}  admin_promoter/Get_Admin_promotions_200.json
   ${promoter_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][promoter_id]}
   set global variable   ${promoter_id}
   ${promoter_id/enabled}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][promoter_id/enabled]}
   set global variable   ${promoter_id/enabled}

Get Admin promotions Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get admin promotions   &{kwargs}
   expect status is 422  ${resp}  

Get Admin promotion count Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin promotion count   &{kwargs}
   expect status is 403  ${resp}  

Get Admin promotion count Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin promotion count   &{kwargs}
   expect status is 200  ${resp}  admin_promoter/Get_Admin_promotion_count_200.json
   ${promoter_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][promoter_id]}
   set global variable   ${promoter_id}
   ${promoter_id/enabled}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][promoter_id/enabled]}
   set global variable   ${promoter_id/enabled}

Get Admin promotion count Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get admin promotion count   &{kwargs}
   expect status is 422  ${resp}  

Put Admin promoters By Id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  put admin promoters by promoter id  &{kwargs}
   expect status is 204  ${resp}  

Put Admin promoters By Id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  put admin promoters by promoter id  &{kwargs}
   expect status is 422  ${resp}  

Put Admin promoters By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  put admin promoters by promoter id  &{kwargs}
   expect status is 403  ${resp}  

Put Admin promoters By Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  put admin promoters by promoter id  &{kwargs}
   expect status is 404  ${resp}  

Patch Admin promoters By Id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  patch enabled by promoter id  &{kwargs}
   expect status is 204  ${resp}  

Patch Admin promoters By Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  patch enabled by promoter id  &{kwargs}
   expect status is 404  ${resp}  

Patch Admin promoters By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch enabled by promoter id  &{kwargs}
   expect status is 403  ${resp}  

Patch Admin promoters By Id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  patch enabled by promoter id  &{kwargs}
   expect status is 422  ${resp}  

Delete Admin promoters By Id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  delete admin promoters by promoter id  &{kwargs}
   expect status is 204  ${resp}  

Delete Admin promoters By Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  delete admin promoters by promoter id  &{kwargs}
   expect status is 404  ${resp}  

Delete Admin promoters By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  delete admin promoters by promoter id  &{kwargs}
   expect status is 403  ${resp}  

