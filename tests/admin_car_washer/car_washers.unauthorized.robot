*** Settings ***
Documentation  admin_car_washer
Resource  ../resources.robot
Library  robot_car_wash_server_library.car_washer.CarWasherLibrary
Force Tags  model:admin_car_washer  虾洗后台


*** Test Cases ***
post admin car washers Fail Without Login
   [Documentation]  接口名:新增虾客${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  username=${username}  name=${name}  mobile=${mobile}  password=${password}  
   ${unessential_params}  create list  birthday=${birthday}  ID_card=${ID_card}  address=${address}  sex=${sex}  promoter_no=${promoter_no}  is_active=False  
   run every case by params  post admin car washers Fail 403  ${essential_params}  ${unessential_params}

get admin car washers Fail Without Login
   [Documentation]  接口名:获取虾客列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  page_num=${page_num}  page_size=${page_size}  
   ${unessential_params}  create list  username=${username}  mobile=${mobile}  name=${name}  
   run every case by params  get admin car washers Fail 403  ${essential_params}  ${unessential_params}

get admin car washers by username Fail Without Login
   [Documentation]  接口名:获取虾客详情${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get admin car washers by username Fail 403    username=${username}

get admin car washers wash records by username Fail Without Login
   [Documentation]  接口名:虾客接单记录${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  page_num=${page_num}  page_size=${page_size}  
   run every case by params  get admin car washers wash records by username Fail 403  ${essential_params}  ${unessential_params}    username=${username}

get admin car washers order count by username Fail Without Login
   [Documentation]  接口名:虾客接单数量${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  section=${section}  
   run every case by params  get admin car washers order count by username Fail 403  ${essential_params}  ${unessential_params}    username=${username}

put admin car washers by username Fail Without Login
   [Documentation]  接口名:编辑虾客${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  name=${name}  mobile=${mobile}  sex=${sex}  birthday=${birthday}  ID_card=${ID_card}  address=${address}  promoter_no=${promoter_no}  password=${password}  is_active=False  
   run every case by params  put admin car washers by username Fail 403  ${essential_params}  ${unessential_params}    username=${username}

patch admin car washers is active by username Fail Without Login
   [Documentation]  接口名:编辑启用/禁用${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  is_active=False  
   run every case by params  patch admin car washers is active by username Fail 403  ${essential_params}  ${unessential_params}    username=${username}


*** Variables ***
${username}  12345678909876543


*** Keywords ***
post admin car washers Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post admin car washers  &{kwargs}
   expect status is 403  ${resp}  

get admin car washers Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin car washers  &{kwargs}
   expect status is 403  ${resp}  

get admin car washers by username Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin car washers by username  &{kwargs}
   expect status is 403  ${resp}  

get admin car washers wash records by username Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin car washers wash records by username  &{kwargs}
   expect status is 403  ${resp}  

get admin car washers order count by username Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin car washers order count by username  &{kwargs}
   expect status is 403  ${resp}  

put admin car washers by username Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  put admin car washers by username  &{kwargs}
   expect status is 403  ${resp}  

patch admin car washers is active by username Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch admin car washers is active by username  &{kwargs}
   expect status is 403  ${resp}  

