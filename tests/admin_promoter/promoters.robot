*** Settings ***
Documentation  admin_promoter
Resource  ../resources.robot
Library  robot_car_wash_server_library.promoter.PromoterLibrary
Suite Setup  Login  ${admin_username}   ${admin_password}
Suite Teardown  Logout
Force Tags  model:admin_promoter  虾洗后台


*** Test Cases ***
Post Admin Promoters Success 
   [Documentation]  接口名:添加二维码${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 201,返回的Json数据符合验证。
   [Tags]           Respcode:201
   ${essential_params}  create list  promoter_no=${promoter_no}  
   ${unessential_params}  create list  name=${name}  mobile=${mobile}  promoter_remark=${promoter_remark}  enabled=False  
   run every case by params  Post Admin Promoters Success 201  ${essential_params}  ${unessential_params}

Post Admin Promoters Fail With Wrong Params
   [Documentation]  接口名:添加二维码${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  promoter_no=${promoter_no}  
   ${unessential_params}  create list  name=${name}  mobile=${mobile}  promoter_remark=${promoter_remark}  enabled=False  
   run every case by params  Post Admin Promoters Fail 422  ${essential_params}  ${unessential_params}

Get Admin Promoters Success 
   [Documentation]  接口名:推广二维码列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 Promoter 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  
   ${unessential_params}  create list  name=${name}  mobile=${mobile}  promoter_remark=${promoter_remark}  
   run every case by params  Get Admin Promoters Success 200  ${essential_params}  ${unessential_params}

Get Admin Promoters Fail With Wrong Params
   [Documentation]  接口名:推广二维码列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  name=${name}  mobile=${mobile}  promoter_remark=${promoter_remark}  
   run every case by params  Get Admin Promoters Fail 422  ${essential_params}  ${unessential_params}

Get Admin Promotions Success 
   [Documentation]  接口名:二维码用户列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 Promotion 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  promoter_id=${promoter_id}  
   ${unessential_params}  create list  user_id=${user_id}  mobile=${mobile}  car_id=${car_id}  created_section=${created_section}  
   run every case by params  Get Admin Promotions Success 200  ${essential_params}  ${unessential_params}

Get Admin Promotions Fail With Wrong Params
   [Documentation]  接口名:二维码用户列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  promoter_id=${promoter_id}  
   ${unessential_params}  create list  user_id=${user_id}  mobile=${mobile}  car_id=${car_id}  created_section=${created_section}  
   run every case by params  Get Admin Promotions Fail 422  ${essential_params}  ${unessential_params}

Get Admin Promotion Count Success 
   [Documentation]  接口名:二维码推广统计${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为  列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  
   ${unessential_params}  create list  promoter_id=${promoter_id}  created_section=${created_section}  
   run every case by params  Get Admin Promotion Count Success 200  ${essential_params}  ${unessential_params}

Get Admin Promotion Count Fail With Wrong Params
   [Documentation]  接口名:二维码推广统计${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  promoter_id=${promoter_id}  created_section=${created_section}  
   run every case by params  Get Admin Promotion Count Fail 422  ${essential_params}  ${unessential_params}

Put Admin Promoters By Promoter Id Success 
   [Documentation]  接口名:编辑二维码${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create list  
   ${unessential_params}  create list  name=${name}  mobile=${mobile}  promoter_remark=${promoter_remark}  enabled=False  
   run every case by params  Put Admin Promoters By Promoter Id Success 204  ${essential_params}  ${unessential_params}  promoter_id=${promoter_id}

Put Admin Promoters By Promoter Id Fail With Wrong Params
   [Documentation]  接口名:编辑二维码${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  name=${name}  mobile=${mobile}  promoter_remark=${promoter_remark}  enabled=False  
   run every case by params  Put Admin Promoters By Promoter Id Fail 422  ${essential_params}  ${unessential_params}  promoter_id=${promoter_id}

Put Admin Promoters By Promoter Id Fail With Wrong Url
   [Documentation]  接口名:编辑二维码${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  
   ${unessential_params}  create list  name=${name}  mobile=${mobile}  promoter_remark=${promoter_remark}  enabled=False  
   run every case by params  Put Admin Promoters By Promoter Id Fail 404  ${essential_params}  ${unessential_params}  promoter_id=${wrong_url_id}

Patch Enabled By Promoter Id Success 
   [Documentation]  接口名:二维码推广启用${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create list  
   ${unessential_params}  create list  enabled=False  
   run every case by params  Patch Enabled By Promoter Id Success 204  ${essential_params}  ${unessential_params}  promoter_id/enabled=${promoter_id/enabled}

Patch Enabled By Promoter Id Fail With Wrong Url
   [Documentation]  接口名:二维码推广启用${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  
   ${unessential_params}  create list  enabled=False  
   run every case by params  Patch Enabled By Promoter Id Fail 404  ${essential_params}  ${unessential_params}  promoter_id/enabled=${wrong_url_id}

Patch Enabled By Promoter Id Fail With Wrong Params
   [Documentation]  接口名:二维码推广启用${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  enabled=False  
   run every case by params  Patch Enabled By Promoter Id Fail 422  ${essential_params}  ${unessential_params}  promoter_id/enabled=${promoter_id/enabled}

Delete Admin Promoters By Promoter Id Success 
   [Documentation]  接口名:删除二维码${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   Delete Admin Promoters By Promoter Id Success 204  promoter_id=${promoter_id}

Delete Admin Promoters By Promoter Id Fail With Wrong Url
   [Documentation]  接口名:删除二维码${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   Delete Admin Promoters By Promoter Id Fail 404  promoter_id=${wrong_url_id}


*** Variables ***
${promoter_id}
${promoter_id/enabled}


*** Keywords ***
Post Admin Promoters Success 201
   [Arguments]  &{kwargs}
   ${resp}=  Post Admin Promoters   &{kwargs}
   expect status is 201  ${resp}  admin_promoter/Post_Admin_Promoters_201.json
   ${promoter_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][promoter_id]}
   set global variable   ${promoter_id}
   ${promoter_id/enabled}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][promoter_id/enabled]}
   set global variable   ${promoter_id/enabled}

Post Admin Promoters Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Post Admin Promoters   &{kwargs}
   expect status is 422  ${resp}  

Get Admin Promoters Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Promoters   &{kwargs}
   expect status is 200  ${resp}  admin_promoter/Get_Admin_Promoters_200.json
   ${promoter_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][promoter_id]}
   set global variable   ${promoter_id}
   ${promoter_id/enabled}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][promoter_id/enabled]}
   set global variable   ${promoter_id/enabled}

Get Admin Promoters Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Promoters   &{kwargs}
   expect status is 422  ${resp}  

Get Admin Promotions Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Promotions   &{kwargs}
   expect status is 200  ${resp}  admin_promoter/Get_Admin_Promotions_200.json
   ${promoter_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][promoter_id]}
   set global variable   ${promoter_id}
   ${promoter_id/enabled}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][promoter_id/enabled]}
   set global variable   ${promoter_id/enabled}

Get Admin Promotions Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Promotions   &{kwargs}
   expect status is 422  ${resp}  

Get Admin Promotion Count Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Promotion Count   &{kwargs}
   expect status is 200  ${resp}  admin_promoter/Get_Admin_Promotion_Count_200.json
   ${promoter_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][promoter_id]}
   set global variable   ${promoter_id}
   ${promoter_id/enabled}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][promoter_id/enabled]}
   set global variable   ${promoter_id/enabled}

Get Admin Promotion Count Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Promotion Count   &{kwargs}
   expect status is 422  ${resp}  

Put Admin Promoters By Promoter Id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  Put Admin Promoters By Promoter Id   &{kwargs}
   expect status is 204  ${resp}  

Put Admin Promoters By Promoter Id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Put Admin Promoters By Promoter Id   &{kwargs}
   expect status is 422  ${resp}  

Put Admin Promoters By Promoter Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  Put Admin Promoters By Promoter Id   &{kwargs}
   expect status is 404  ${resp}  

Patch Enabled By Promoter Id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  Patch Enabled By Promoter Id   &{kwargs}
   expect status is 204  ${resp}  

Patch Enabled By Promoter Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  Patch Enabled By Promoter Id   &{kwargs}
   expect status is 404  ${resp}  

Patch Enabled By Promoter Id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Patch Enabled By Promoter Id   &{kwargs}
   expect status is 422  ${resp}  

Delete Admin Promoters By Promoter Id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  Delete Admin Promoters By Promoter Id   &{kwargs}
   expect status is 204  ${resp}  

Delete Admin Promoters By Promoter Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  Delete Admin Promoters By Promoter Id   &{kwargs}
   expect status is 404  ${resp}  

