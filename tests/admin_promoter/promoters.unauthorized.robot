*** Settings ***
Documentation  admin_promoter
Resource  ../resources.robot
Library  robot_car_wash_server_library.promoter.PromoterLibrary
Force Tags  model:admin_promoter  虾洗后台


*** Test Cases ***
Post Admin Promoters Fail Without Login
   [Documentation]  接口名:添加二维码${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  promoter_no=${promoter_no}  
   ${unessential_params}  create list  name=${name}  mobile=${mobile}  promoter_remark=${promoter_remark}  enabled=False  
   run every case by params  Post Admin Promoters Fail 403  ${essential_params}  ${unessential_params}

Get Admin Promoters Fail Without Login
   [Documentation]  接口名:推广二维码列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  name=${name}  mobile=${mobile}  promoter_remark=${promoter_remark}  
   run every case by params  Get Admin Promoters Fail 403  ${essential_params}  ${unessential_params}

Get Admin Promotions Fail Without Login
   [Documentation]  接口名:二维码用户列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  promoter_id=${promoter_id}  
   ${unessential_params}  create list  user_id=${user_id}  mobile=${mobile}  car_id=${car_id}  created_section=${created_section}  
   run every case by params  Get Admin Promotions Fail 403  ${essential_params}  ${unessential_params}

Get Admin Promotion Count Fail Without Login
   [Documentation]  接口名:二维码推广统计${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  promoter_id=${promoter_id}  created_section=${created_section}  
   run every case by params  Get Admin Promotion Count Fail 403  ${essential_params}  ${unessential_params}

Put Admin Promoters By Promoter Id Fail Without Login
   [Documentation]  接口名:编辑二维码${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  name=${name}  mobile=${mobile}  promoter_remark=${promoter_remark}  enabled=False  
   run every case by params  Put Admin Promoters By Promoter Id Fail 403  ${essential_params}  ${unessential_params}  promoter_id=${promoter_id}

Patch Enabled By Promoter Id Fail Without Login
   [Documentation]  接口名:二维码推广启用${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  enabled=False  
   run every case by params  Patch Enabled By Promoter Id Fail 403  ${essential_params}  ${unessential_params}  promoter_id/enabled=${promoter_id/enabled}

Delete Admin Promoters By Promoter Id Fail Without Login
   [Documentation]  接口名:删除二维码${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Delete Admin Promoters By Promoter Id Fail 403  promoter_id=${promoter_id}


*** Variables ***
${promoter_id}  12345678909876543
${promoter_id/enabled}  12345678909876543


*** Keywords ***
Post Admin Promoters Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Post Admin Promoters   &{kwargs}
   expect status is 403  ${resp}  

Get Admin Promoters Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Promoters   &{kwargs}
   expect status is 403  ${resp}  

Get Admin Promotions Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Promotions   &{kwargs}
   expect status is 403  ${resp}  

Get Admin Promotion Count Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Promotion Count   &{kwargs}
   expect status is 403  ${resp}  

Put Admin Promoters By Promoter Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Put Admin Promoters By Promoter Id   &{kwargs}
   expect status is 403  ${resp}  

Patch Enabled By Promoter Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Patch Enabled By Promoter Id   &{kwargs}
   expect status is 403  ${resp}  

Delete Admin Promoters By Promoter Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Delete Admin Promoters By Promoter Id   &{kwargs}
   expect status is 403  ${resp}  

