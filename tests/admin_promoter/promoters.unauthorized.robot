*** Settings ***
Documentation  admin_promoter
Resource  ../resources.robot
Library  robot_car_wash_server_library.promoter.PromoterLibrary
Force Tags  model:admin_promoter  虾洗后台


*** Test Cases ***
post admin promoters Fail Without Login
   [Documentation]  接口名:添加二维码${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  promoter_no=${promoter_no}  
   ${unessential_params}  create list  name=${name}  mobile=${mobile}  promoter_remark=${promoter_remark}  enabled=False  
   run every case by params  post admin promoters Fail 403  ${essential_params}  ${unessential_params}

get admin promoters Fail Without Login
   [Documentation]  接口名:推广二维码列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  name=${name}  mobile=${mobile}  promoter_remark=${promoter_remark}  
   run every case by params  get admin promoters Fail 403  ${essential_params}  ${unessential_params}

get admin promotions Fail Without Login
   [Documentation]  接口名:二维码用户列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  promoter_id=${promoter_id}  
   ${unessential_params}  create list  user_id=${user_id}  mobile=${mobile}  car_id=${car_id}  created_section=${created_section}  
   run every case by params  get admin promotions Fail 403  ${essential_params}  ${unessential_params}

get admin promotion count Fail Without Login
   [Documentation]  接口名:二维码推广统计${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  promoter_id=${promoter_id}  created_section=${created_section}  
   run every case by params  get admin promotion count Fail 403  ${essential_params}  ${unessential_params}

put admin promoters by promoter id Fail Without Login
   [Documentation]  接口名:编辑二维码${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  name=${name}  mobile=${mobile}  promoter_remark=${promoter_remark}  enabled=False  
   run every case by params  put admin promoters by promoter id Fail 403  ${essential_params}  ${unessential_params}    promoter_id=${promoter_id}

patch admin promoters enabled by promoter id Fail Without Login
   [Documentation]  接口名:二维码推广启用${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  enabled=False  
   run every case by params  patch admin promoters enabled by promoter id Fail 403  ${essential_params}  ${unessential_params}    promoter_id=${promoter_id}

delete admin promoters by promoter id Fail Without Login
   [Documentation]  接口名:删除二维码${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   delete admin promoters by promoter id Fail 403    promoter_id=${promoter_id}


*** Variables ***
${promoter_id}  12345678909876543


*** Keywords ***
post admin promoters Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post admin promoters  &{kwargs}
   expect status is 403  ${resp}  

get admin promoters Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin promoters  &{kwargs}
   expect status is 403  ${resp}  

get admin promotions Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin promotions  &{kwargs}
   expect status is 403  ${resp}  

get admin promotion count Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin promotion count  &{kwargs}
   expect status is 403  ${resp}  

put admin promoters by promoter id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  put admin promoters by promoter id  &{kwargs}
   expect status is 403  ${resp}  

patch admin promoters enabled by promoter id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch admin promoters enabled by promoter id  &{kwargs}
   expect status is 403  ${resp}  

delete admin promoters by promoter id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  delete admin promoters by promoter id  &{kwargs}
   expect status is 403  ${resp}  

