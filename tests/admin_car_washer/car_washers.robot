*** Settings ***
Documentation  admin_car_washer
Resource  ../resources.robot
Library  robot_car_wash_server_library.car_washer.CarWasherLibrary
Suite Setup  Login  ${admin_username}   ${admin_password}
Suite Teardown  Logout
Force Tags  model:admin_car_washer  虾洗后台


*** Test Cases ***
Post Admin Car Washers Success 
   [Documentation]  接口名:新增虾客${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 201,返回的Json数据符合验证。
   [Tags]           Respcode:201
   ${essential_params}  create list  username=${username}  name=${name}  mobile=${mobile}  password=${password}  
   ${unessential_params}  create list  birthday=${birthday}  ID_card=${ID_card}  address=${address}  sex=${sex}  promoter_no=${promoter_no}  is_active=False  
   run every case by params  Post Admin Car Washers Success 201  ${essential_params}  ${unessential_params}

Post Admin Car Washers Fail With Wrong Params
   [Documentation]  接口名:新增虾客${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  username=${username}  name=${name}  mobile=${mobile}  password=${password}  
   ${unessential_params}  create list  birthday=${birthday}  ID_card=${ID_card}  address=${address}  sex=${sex}  promoter_no=${promoter_no}  is_active=False  
   run every case by params  Post Admin Car Washers Fail 422  ${essential_params}  ${unessential_params}

Get Admin Car Washers Success 
   [Documentation]  接口名:获取虾客列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 CarWasher 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  page_num=${page_num}  page_size=${page_size}  
   ${unessential_params}  create list  username=${username}  mobile=${mobile}  name=${name}  
   run every case by params  Get Admin Car Washers Success 200  ${essential_params}  ${unessential_params}

Get Admin Car Washers Fail With Wrong Params
   [Documentation]  接口名:获取虾客列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  page_num=${page_num}  page_size=${page_size}  
   ${unessential_params}  create list  username=${username}  mobile=${mobile}  name=${name}  
   run every case by params  Get Admin Car Washers Fail 422  ${essential_params}  ${unessential_params}

Get Admin Car Washers By Username Fail With Wrong Url
   [Documentation]  接口名:获取虾客详情${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   Get Admin Car Washers By Username Fail 404  username=${wrong_url_id}

Get Admin Car Washers By Username Success 
   [Documentation]  接口名:获取虾客详情${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 CarWash 对象。
   [Tags]           Respcode:200
   Get Admin Car Washers By Username Success 200  username=${username}

Get wash Records by username Fail With Wrong Url
   [Documentation]  接口名:虾客接单记录${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  
   ${unessential_params}  create list  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get wash Records by username Fail 404  ${essential_params}  ${unessential_params}  username/wash_records=${wrong_url_id}

Get wash Records by username Success 
   [Documentation]  接口名:虾客接单记录${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 WashRecord 对象。
   [Tags]           Respcode:200
   ${essential_params}  create list  
   ${unessential_params}  create list  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get wash Records by username Success 200  ${essential_params}  ${unessential_params}  username/wash_records=${username/wash_records}

Get wash Records by username Fail With Wrong Params
   [Documentation]  接口名:虾客接单记录${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get wash Records by username Fail 422  ${essential_params}  ${unessential_params}  username/wash_records=${username/wash_records}

Put Admin Car Washers By Username Fail With Wrong Url
   [Documentation]  接口名:编辑虾客${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  
   ${unessential_params}  create list  name=${name}  mobile=${mobile}  sex=${sex}  birthday=${birthday}  ID_card=${ID_card}  address=${address}  promoter_no=${promoter_no}  password=${password}  is_active=False  
   run every case by params  Put Admin Car Washers By Username Fail 404  ${essential_params}  ${unessential_params}  username=${wrong_url_id}

Put Admin Car Washers By Username Success 
   [Documentation]  接口名:编辑虾客${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create list  
   ${unessential_params}  create list  name=${name}  mobile=${mobile}  sex=${sex}  birthday=${birthday}  ID_card=${ID_card}  address=${address}  promoter_no=${promoter_no}  password=${password}  is_active=False  
   run every case by params  Put Admin Car Washers By Username Success 204  ${essential_params}  ${unessential_params}  username=${username}

Put Admin Car Washers By Username Fail With Wrong Params
   [Documentation]  接口名:编辑虾客${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  name=${name}  mobile=${mobile}  sex=${sex}  birthday=${birthday}  ID_card=${ID_card}  address=${address}  promoter_no=${promoter_no}  password=${password}  is_active=False  
   run every case by params  Put Admin Car Washers By Username Fail 422  ${essential_params}  ${unessential_params}  username=${username}

Patch is Active by username Success 
   [Documentation]  接口名:编辑启用/禁用${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create list  
   ${unessential_params}  create list  is_active=False  
   run every case by params  Patch is Active by username Success 204  ${essential_params}  ${unessential_params}  username/is_active=${username/is_active}

Patch is Active by username Fail With Wrong Url
   [Documentation]  接口名:编辑启用/禁用${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  
   ${unessential_params}  create list  is_active=False  
   run every case by params  Patch is Active by username Fail 404  ${essential_params}  ${unessential_params}  username/is_active=${wrong_url_id}

Patch is Active by username Fail With Wrong Params
   [Documentation]  接口名:编辑启用/禁用${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  is_active=False  
   run every case by params  Patch is Active by username Fail 422  ${essential_params}  ${unessential_params}  username/is_active=${username/is_active}


*** Variables ***
${username}
${username/wash_records}
${username/is_active}


*** Keywords ***
Post Admin Car Washers Success 201
   [Arguments]  &{kwargs}
   ${resp}=  Post Admin Car Washers   &{kwargs}
   expect status is 201  ${resp}  admin_car_washer/Post_Admin_Car_Washers_201.json
   ${username}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][username]}
   set global variable   ${username}
   ${username/wash_records}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][username/wash_records]}
   set global variable   ${username/wash_records}
   ${username/is_active}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][username/is_active]}
   set global variable   ${username/is_active}

Post Admin Car Washers Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Post Admin Car Washers   &{kwargs}
   expect status is 422  ${resp}  

Get Admin Car Washers Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Car Washers   &{kwargs}
   expect status is 200  ${resp}  admin_car_washer/Get_Admin_Car_Washers_200.json
   ${username}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][username]}
   set global variable   ${username}
   ${username/wash_records}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][username/wash_records]}
   set global variable   ${username/wash_records}
   ${username/is_active}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][username/is_active]}
   set global variable   ${username/is_active}

Get Admin Car Washers Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Car Washers   &{kwargs}
   expect status is 422  ${resp}  

Get Admin Car Washers By Username Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Car Washers By Username   &{kwargs}
   expect status is 404  ${resp}  

Get Admin Car Washers By Username Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Car Washers By Username   &{kwargs}
   expect status is 200  ${resp}  admin_car_washer/Get_Admin_Car_Washers_By_Username_200.json
   ${username}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][username]}
   set global variable   ${username}
   ${username/wash_records}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][username/wash_records]}
   set global variable   ${username/wash_records}
   ${username/is_active}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][username/is_active]}
   set global variable   ${username/is_active}

Get wash Records by username Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  Get wash Records by username   &{kwargs}
   expect status is 404  ${resp}  

Get wash Records by username Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Get wash Records by username   &{kwargs}
   expect status is 200  ${resp}  admin_car_washer/Get_wash_Records_by_username_200.json
   ${username}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][username]}
   set global variable   ${username}
   ${username/wash_records}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][username/wash_records]}
   set global variable   ${username/wash_records}
   ${username/is_active}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][username/is_active]}
   set global variable   ${username/is_active}

Get wash Records by username Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Get wash Records by username   &{kwargs}
   expect status is 422  ${resp}  

Put Admin Car Washers By Username Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  Put Admin Car Washers By Username   &{kwargs}
   expect status is 404  ${resp}  

Put Admin Car Washers By Username Success 204
   [Arguments]  &{kwargs}
   ${resp}=  Put Admin Car Washers By Username   &{kwargs}
   expect status is 204  ${resp}  

Put Admin Car Washers By Username Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Put Admin Car Washers By Username   &{kwargs}
   expect status is 422  ${resp}  

Patch is Active by username Success 204
   [Arguments]  &{kwargs}
   ${resp}=  Patch is Active by username   &{kwargs}
   expect status is 204  ${resp}  

Patch is Active by username Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  Patch is Active by username   &{kwargs}
   expect status is 404  ${resp}  

Patch is Active by username Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Patch is Active by username   &{kwargs}
   expect status is 422  ${resp}  

