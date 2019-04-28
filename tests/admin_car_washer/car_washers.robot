*** Settings ***
Documentation  admin_car_washer
Resource  ../resources.robot
Library  robot_car_wash_server_library.car_washer.CarWasherLibrary
Suite Setup  Login  ${admin_username}   ${admin_password}
Suite Teardown  Logout
Force Tags  model:admin_car_washer  虾洗后台


*** Test Cases ***
post admin car washers Fail With Wrong Params
   [Documentation]  接口名:新增虾客${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  username=${username_422}  name=${name_422}  mobile=${mobile_422}  password=${password_422}  
   ${unessential_params}  create list  birthday=${birthday_422}  ID_card=${ID_card_422}  address=${address_422}  sex=${sex_422}  promoter_no=${promoter_no_422}  is_active=ThisIsRobot!  
   run every case by params  post admin car washers Fail 422  ${essential_params}  ${unessential_params}  success=False

post admin car washers Success 
   [Documentation]  接口名:新增虾客${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 201,返回的Json数据符合验证。
   [Tags]           Respcode:201
   ${essential_params}  create list  username=${username}  name=${name}  mobile=${mobile}  password=${password}  
   ${unessential_params}  create list  birthday=${birthday}  ID_card=${ID_card}  address=${address}  sex=${sex}  promoter_no=${promoter_no}  is_active=False  
   run every case by params  post admin car washers Success 201  ${essential_params}  ${unessential_params}

get admin car washers Success 
   [Documentation]  接口名:获取虾客列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 CarWasher 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  page_num=${page_num}  page_size=${page_size}  
   ${unessential_params}  create list  username=${username}  mobile=${mobile}  name=${name}  
   run every case by params  get admin car washers Success 200  ${essential_params}  ${unessential_params}

get admin car washers Fail With Wrong Params
   [Documentation]  接口名:获取虾客列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  page_num=${page_num_422}  page_size=${page_size_422}  
   ${unessential_params}  create list  username=${username_422}  mobile=${mobile_422}  name=${name_422}  
   run every case by params  get admin car washers Fail 422  ${essential_params}  ${unessential_params}  success=False

get admin car washers by username Fail With Wrong Url
   [Documentation]  接口名:获取虾客详情${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   get admin car washers by username Fail 404    username=${w}  username/wash_records=${r}  username/order_count=${o}  username/is_active=${n}

get admin car washers by username Success 
   [Documentation]  接口名:获取虾客详情${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 CarWash 对象。
   [Tags]           Respcode:200
   get admin car washers by username Success 200    username=${username}  username/wash_records=${username/wash_records}  username/order_count=${username/order_count}  username/is_active=${username/is_active}

get admin car washers wash records by username Fail With Wrong Url
   [Documentation]  接口名:虾客接单记录${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  
   ${unessential_params}  create list  page_num=${page_num}  page_size=${page_size}  
   run every case by params  get admin car washers wash records by username Fail 404  ${essential_params}  ${unessential_params}    username=${w}  username/wash_records=${r}  username/order_count=${o}  username/is_active=${n}

get admin car washers wash records by username Success 
   [Documentation]  接口名:虾客接单记录${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 WashRecord 对象。
   [Tags]           Respcode:200
   ${essential_params}  create list  
   ${unessential_params}  create list  page_num=${page_num}  page_size=${page_size}  
   run every case by params  get admin car washers wash records by username Success 200  ${essential_params}  ${unessential_params}    username=${username}  username/wash_records=${username/wash_records}  username/order_count=${username/order_count}  username/is_active=${username/is_active}

get admin car washers wash records by username Fail With Wrong Params
   [Documentation]  接口名:虾客接单记录${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  page_num=${page_num_422}  page_size=${page_size_422}  
   run every case by params  get admin car washers wash records by username Fail 422  ${essential_params}  ${unessential_params}    username=${username}  username/wash_records=${username/wash_records}  username/order_count=${username/order_count}  username/is_active=${username/is_active}  success=False

get admin car washers order count by username Success 
   [Documentation]  接口名:虾客接单数量${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为  对象。
   [Tags]           Respcode:200
   ${essential_params}  create list  
   ${unessential_params}  create list  section=${section}  
   run every case by params  get admin car washers order count by username Success 200  ${essential_params}  ${unessential_params}    username=${username}  username/wash_records=${username/wash_records}  username/order_count=${username/order_count}  username/is_active=${username/is_active}

get admin car washers order count by username Fail With Wrong Params
   [Documentation]  接口名:虾客接单数量${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  section=${section_422}  
   run every case by params  get admin car washers order count by username Fail 422  ${essential_params}  ${unessential_params}    username=${username}  username/wash_records=${username/wash_records}  username/order_count=${username/order_count}  username/is_active=${username/is_active}  success=False

get admin car washers order count by username Fail With Wrong Url
   [Documentation]  接口名:虾客接单数量${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  
   ${unessential_params}  create list  section=${section}  
   run every case by params  get admin car washers order count by username Fail 404  ${essential_params}  ${unessential_params}    username=${w}  username/wash_records=${r}  username/order_count=${o}  username/is_active=${n}

put admin car washers by username Success 
   [Documentation]  接口名:编辑虾客${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create list  
   ${unessential_params}  create list  name=${name}  mobile=${mobile}  sex=${sex}  birthday=${birthday}  ID_card=${ID_card}  address=${address}  promoter_no=${promoter_no}  password=${password}  is_active=False  
   run every case by params  put admin car washers by username Success 204  ${essential_params}  ${unessential_params}    username=${username}  username/wash_records=${username/wash_records}  username/order_count=${username/order_count}  username/is_active=${username/is_active}

put admin car washers by username Fail With Wrong Url
   [Documentation]  接口名:编辑虾客${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  
   ${unessential_params}  create list  name=${name}  mobile=${mobile}  sex=${sex}  birthday=${birthday}  ID_card=${ID_card}  address=${address}  promoter_no=${promoter_no}  password=${password}  is_active=False  
   run every case by params  put admin car washers by username Fail 404  ${essential_params}  ${unessential_params}    username=${w}  username/wash_records=${r}  username/order_count=${o}  username/is_active=${n}

put admin car washers by username Fail With Wrong Params
   [Documentation]  接口名:编辑虾客${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  name=${name_422}  mobile=${mobile_422}  sex=${sex_422}  birthday=${birthday_422}  ID_card=${ID_card_422}  address=${address_422}  promoter_no=${promoter_no_422}  password=${password_422}  is_active=ThisIsRobot!  
   run every case by params  put admin car washers by username Fail 422  ${essential_params}  ${unessential_params}    username=${username}  username/wash_records=${username/wash_records}  username/order_count=${username/order_count}  username/is_active=${username/is_active}  success=False

patch admin car washers is active by username Fail With Wrong Url
   [Documentation]  接口名:编辑启用/禁用${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  
   ${unessential_params}  create list  is_active=False  
   run every case by params  patch admin car washers is active by username Fail 404  ${essential_params}  ${unessential_params}    username=${w}  username/wash_records=${r}  username/order_count=${o}  username/is_active=${n}

patch admin car washers is active by username Success 
   [Documentation]  接口名:编辑启用/禁用${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create list  
   ${unessential_params}  create list  is_active=False  
   run every case by params  patch admin car washers is active by username Success 204  ${essential_params}  ${unessential_params}    username=${username}  username/wash_records=${username/wash_records}  username/order_count=${username/order_count}  username/is_active=${username/is_active}

patch admin car washers is active by username Fail With Wrong Params
   [Documentation]  接口名:编辑启用/禁用${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  is_active=ThisIsRobot!  
   run every case by params  patch admin car washers is active by username Fail 422  ${essential_params}  ${unessential_params}    username=${username}  username/wash_records=${username/wash_records}  username/order_count=${username/order_count}  username/is_active=${username/is_active}  success=False


*** Variables ***
${username}  
${username/wash_records}  
${username/order_count}  
${username/is_active}  


*** Keywords ***
post admin car washers Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post admin car washers  &{kwargs}
   expect status is 422  ${resp}  

post admin car washers Success 201
   [Arguments]  &{kwargs}
   ${resp}=  post admin car washers  &{kwargs}
   expect status is 201  ${resp}  admin_car_washer/post_admin_car_washers_201.json
   ${username}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][username]}
   set global variable   ${username}
   ${username/wash_records}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][username/wash_records]}
   set global variable   ${username/wash_records}
   ${username/order_count}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][username/order_count]}
   set global variable   ${username/order_count}
   ${username/is_active}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][username/is_active]}
   set global variable   ${username/is_active}

get admin car washers Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin car washers  &{kwargs}
   expect status is 200  ${resp}  admin_car_washer/get_admin_car_washers_200.json
   ${username}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][username]}
   set global variable   ${username}
   ${username/wash_records}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][username/wash_records]}
   set global variable   ${username/wash_records}
   ${username/order_count}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][username/order_count]}
   set global variable   ${username/order_count}
   ${username/is_active}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][username/is_active]}
   set global variable   ${username/is_active}

get admin car washers Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get admin car washers  &{kwargs}
   expect status is 422  ${resp}  

get admin car washers by username Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  get admin car washers by username  &{kwargs}
   expect status is 404  ${resp}  

get admin car washers by username Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin car washers by username  &{kwargs}
   expect status is 200  ${resp}  admin_car_washer/get_admin_car_washers_by_username_200.json
   ${username}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][username]}
   set global variable   ${username}
   ${username/wash_records}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][username/wash_records]}
   set global variable   ${username/wash_records}
   ${username/order_count}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][username/order_count]}
   set global variable   ${username/order_count}
   ${username/is_active}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][username/is_active]}
   set global variable   ${username/is_active}

get admin car washers wash records by username Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  get admin car washers wash records by username  &{kwargs}
   expect status is 404  ${resp}  

get admin car washers wash records by username Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin car washers wash records by username  &{kwargs}
   expect status is 200  ${resp}  admin_car_washer/get_admin_car_washers_wash_records_by_username_200.json
   ${username}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][username]}
   set global variable   ${username}
   ${username/wash_records}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][username/wash_records]}
   set global variable   ${username/wash_records}
   ${username/order_count}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][username/order_count]}
   set global variable   ${username/order_count}
   ${username/is_active}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][username/is_active]}
   set global variable   ${username/is_active}

get admin car washers wash records by username Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get admin car washers wash records by username  &{kwargs}
   expect status is 422  ${resp}  

get admin car washers order count by username Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin car washers order count by username  &{kwargs}
   expect status is 200  ${resp}  admin_car_washer/get_admin_car_washers_order_count_by_username_200.json
   ${username}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][username]}
   set global variable   ${username}
   ${username/wash_records}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][username/wash_records]}
   set global variable   ${username/wash_records}
   ${username/order_count}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][username/order_count]}
   set global variable   ${username/order_count}
   ${username/is_active}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][username/is_active]}
   set global variable   ${username/is_active}

get admin car washers order count by username Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get admin car washers order count by username  &{kwargs}
   expect status is 422  ${resp}  

get admin car washers order count by username Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  get admin car washers order count by username  &{kwargs}
   expect status is 404  ${resp}  

put admin car washers by username Success 204
   [Arguments]  &{kwargs}
   ${resp}=  put admin car washers by username  &{kwargs}
   expect status is 204  ${resp}  

put admin car washers by username Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  put admin car washers by username  &{kwargs}
   expect status is 404  ${resp}  

put admin car washers by username Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  put admin car washers by username  &{kwargs}
   expect status is 422  ${resp}  

patch admin car washers is active by username Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  patch admin car washers is active by username  &{kwargs}
   expect status is 404  ${resp}  

patch admin car washers is active by username Success 204
   [Arguments]  &{kwargs}
   ${resp}=  patch admin car washers is active by username  &{kwargs}
   expect status is 204  ${resp}  

patch admin car washers is active by username Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  patch admin car washers is active by username  &{kwargs}
   expect status is 422  ${resp}  

