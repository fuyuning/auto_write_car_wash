*** Settings ***
Documentation  admin_car_washer
Resource  ../resources.robot
Library  robot_car_wash_server_library.car_washer.CarWasherLibrary
Force Tags  model:admin_car_washer  虾洗后台


*** Test Cases ***
Post Admin Car Washers Fail Without Login
   [Documentation]  接口名:新增虾客${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  username=${username}  name=${name}  mobile=${mobile}  password=${password}  
   ${unessential_params}  create list  birthday=${birthday}  ID_card=${ID_card}  address=${address}  sex=${sex}  promoter_no=${promoter_no}  is_active=False  
   run every case by params  Post Admin Car Washers Fail 403  ${essential_params}  ${unessential_params}

Get Admin Car Washers Fail Without Login
   [Documentation]  接口名:获取虾客列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  page_num=${page_num}  page_size=${page_size}  
   ${unessential_params}  create list  username=${username}  mobile=${mobile}  name=${name}  
   run every case by params  Get Admin Car Washers Fail 403  ${essential_params}  ${unessential_params}

Get Admin Car Washers By Username Fail Without Login
   [Documentation]  接口名:获取虾客详情${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Get Admin Car Washers By Username Fail 403  username=${username}

Get wash Records by username Fail Without Login
   [Documentation]  接口名:虾客接单记录${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get wash Records by username Fail 403  ${essential_params}  ${unessential_params}  username/wash_records=${username/wash_records}

Get order Count by username Fail Without Login
   [Documentation]  接口名:虾客接单数量${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  section=${section}  
   run every case by params  Get order Count by username Fail 403  ${essential_params}  ${unessential_params}  username/order_count=${username/order_count}

Put Admin Car Washers By Username Fail Without Login
   [Documentation]  接口名:编辑虾客${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  name=${name}  mobile=${mobile}  sex=${sex}  birthday=${birthday}  ID_card=${ID_card}  address=${address}  promoter_no=${promoter_no}  password=${password}  is_active=False  
   run every case by params  Put Admin Car Washers By Username Fail 403  ${essential_params}  ${unessential_params}  username=${username}

Patch is Active by username Fail Without Login
   [Documentation]  接口名:编辑启用/禁用${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  is_active=False  
   run every case by params  Patch is Active by username Fail 403  ${essential_params}  ${unessential_params}  username/is_active=${username/is_active}


*** Variables ***
${username}  12345678909876543
${username/wash_records}  12345678909876543
${username/order_count}  12345678909876543
${username/is_active}  12345678909876543


*** Keywords ***
Post Admin Car Washers Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Post Admin Car Washers   &{kwargs}
   expect status is 403  ${resp}  

Get Admin Car Washers Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Car Washers   &{kwargs}
   expect status is 403  ${resp}  

Get Admin Car Washers By Username Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Car Washers By Username   &{kwargs}
   expect status is 403  ${resp}  

Get wash Records by username Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get wash Records by username   &{kwargs}
   expect status is 403  ${resp}  

Get order Count by username Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get order Count by username   &{kwargs}
   expect status is 403  ${resp}  

Put Admin Car Washers By Username Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Put Admin Car Washers By Username   &{kwargs}
   expect status is 403  ${resp}  

Patch is Active by username Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Patch is Active by username   &{kwargs}
   expect status is 403  ${resp}  

