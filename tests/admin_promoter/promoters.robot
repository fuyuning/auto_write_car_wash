*** Settings ***
Documentation  admin_promoter
Resource  ../resources.robot
Library  robot_car_wash_server_library.promoter.PromoterLibrary
Suite Setup  Login  ${admin_username}   ${admin_password}
Suite Teardown  Logout
Force Tags  model:admin_promoter  虾洗后台


*** Test Cases ***
post admin promoters Success 
   [Documentation]  接口名:添加二维码${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 201,返回的Json数据符合验证。
   [Tags]           Respcode:201
   ${essential_params}  create list  promoter_no=${promoter_no}  
   ${unessential_params}  create list  name=${name}  mobile=${mobile}  promoter_remark=${promoter_remark}  enabled=False  
   run every case by params  post admin promoters Success 201  ${essential_params}  ${unessential_params}

post admin promoters Fail With Wrong Params
   [Documentation]  接口名:添加二维码${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  promoter_no=${promoter_no_422}  
   ${unessential_params}  create list  name=${name_422}  mobile=${mobile_422}  promoter_remark=${promoter_remark_422}  enabled=ThisIsRobot!  
   run every case by params  post admin promoters Fail 422  ${essential_params}  ${unessential_params}  success=False

get admin promoters Success 
   [Documentation]  接口名:推广二维码列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 Promoter 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  
   ${unessential_params}  create list  name=${name}  mobile=${mobile}  promoter_remark=${promoter_remark}  
   run every case by params  get admin promoters Success 200  ${essential_params}  ${unessential_params}

get admin promoters Fail With Wrong Params
   [Documentation]  接口名:推广二维码列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  name=${name_422}  mobile=${mobile_422}  promoter_remark=${promoter_remark_422}  
   run every case by params  get admin promoters Fail 422  ${essential_params}  ${unessential_params}  success=False

get admin promotions Success 
   [Documentation]  接口名:二维码用户列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 Promotion 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  promoter_id=${promoter_id}  
   ${unessential_params}  create list  user_id=${user_id}  mobile=${mobile}  car_id=${car_id}  created_section=${created_section}  
   run every case by params  get admin promotions Success 200  ${essential_params}  ${unessential_params}

get admin promotions Fail With Wrong Params
   [Documentation]  接口名:二维码用户列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  promoter_id=${promoter_id_422}  
   ${unessential_params}  create list  user_id=${user_id_422}  mobile=${mobile_422}  car_id=${car_id_422}  created_section=${created_section_422}  
   run every case by params  get admin promotions Fail 422  ${essential_params}  ${unessential_params}  success=False

get admin promotion count Success 
   [Documentation]  接口名:二维码推广统计${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为  列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  
   ${unessential_params}  create list  promoter_id=${promoter_id}  created_section=${created_section}  
   run every case by params  get admin promotion count Success 200  ${essential_params}  ${unessential_params}

get admin promotion count Fail With Wrong Params
   [Documentation]  接口名:二维码推广统计${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  promoter_id=${promoter_id_422}  created_section=${created_section_422}  
   run every case by params  get admin promotion count Fail 422  ${essential_params}  ${unessential_params}  success=False

put admin promoters by promoter id Fail With Wrong Params
   [Documentation]  接口名:编辑二维码${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  name=${name_422}  mobile=${mobile_422}  promoter_remark=${promoter_remark_422}  enabled=ThisIsRobot!  
   run every case by params  put admin promoters by promoter id Fail 422  ${essential_params}  ${unessential_params}    promoter_id=${promoter_id}  success=False

put admin promoters by promoter id Success 
   [Documentation]  接口名:编辑二维码${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create list  
   ${unessential_params}  create list  name=${name}  mobile=${mobile}  promoter_remark=${promoter_remark}  enabled=False  
   run every case by params  put admin promoters by promoter id Success 204  ${essential_params}  ${unessential_params}    promoter_id=${promoter_id}

put admin promoters by promoter id Fail With Wrong Url
   [Documentation]  接口名:编辑二维码${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  
   ${unessential_params}  create list  name=${name}  mobile=${mobile}  promoter_remark=${promoter_remark}  enabled=False  
   run every case by params  put admin promoters by promoter id Fail 404  ${essential_params}  ${unessential_params}    promoter_id=${wrong_url_id}

patch admin promoters enabled by promoter id Fail With Wrong Url
   [Documentation]  接口名:二维码推广启用${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  
   ${unessential_params}  create list  enabled=False  
   run every case by params  patch admin promoters enabled by promoter id Fail 404  ${essential_params}  ${unessential_params}    promoter_id=${wrong_url_id}

patch admin promoters enabled by promoter id Success 
   [Documentation]  接口名:二维码推广启用${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create list  
   ${unessential_params}  create list  enabled=False  
   run every case by params  patch admin promoters enabled by promoter id Success 204  ${essential_params}  ${unessential_params}    promoter_id=${promoter_id}

patch admin promoters enabled by promoter id Fail With Wrong Params
   [Documentation]  接口名:二维码推广启用${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  enabled=ThisIsRobot!  
   run every case by params  patch admin promoters enabled by promoter id Fail 422  ${essential_params}  ${unessential_params}    promoter_id=${promoter_id}  success=False

delete admin promoters by promoter id Fail With Wrong Url
   [Documentation]  接口名:删除二维码${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   delete admin promoters by promoter id Fail 404    promoter_id=${wrong_url_id}

delete admin promoters by promoter id Success 
   [Documentation]  接口名:删除二维码${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   delete admin promoters by promoter id Success 204    promoter_id=${promoter_id}


*** Variables ***
${promoter_id}  


*** Keywords ***
post admin promoters Success 201
   [Arguments]  &{kwargs}
   ${resp}=  post admin promoters  &{kwargs}
   expect status is 201  ${resp}  admin_promoter/post_admin_promoters_201.json
   ${promoter_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][promoter_id]}
   set global variable   ${promoter_id}

post admin promoters Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post admin promoters  &{kwargs}
   expect status is 422  ${resp}  

get admin promoters Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin promoters  &{kwargs}
   expect status is 200  ${resp}  admin_promoter/get_admin_promoters_200.json
   ${promoter_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][promoter_id]}
   set global variable   ${promoter_id}

get admin promoters Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get admin promoters  &{kwargs}
   expect status is 422  ${resp}  

get admin promotions Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin promotions  &{kwargs}
   expect status is 200  ${resp}  admin_promoter/get_admin_promotions_200.json
   ${promoter_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][promoter_id]}
   set global variable   ${promoter_id}

get admin promotions Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get admin promotions  &{kwargs}
   expect status is 422  ${resp}  

get admin promotion count Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin promotion count  &{kwargs}
   expect status is 200  ${resp}  admin_promoter/get_admin_promotion_count_200.json
   ${promoter_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][promoter_id]}
   set global variable   ${promoter_id}

get admin promotion count Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get admin promotion count  &{kwargs}
   expect status is 422  ${resp}  

put admin promoters by promoter id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  put admin promoters by promoter id  &{kwargs}
   expect status is 422  ${resp}  

put admin promoters by promoter id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  put admin promoters by promoter id  &{kwargs}
   expect status is 204  ${resp}  

put admin promoters by promoter id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  put admin promoters by promoter id  &{kwargs}
   expect status is 404  ${resp}  

patch admin promoters enabled by promoter id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  patch admin promoters enabled by promoter id  &{kwargs}
   expect status is 404  ${resp}  

patch admin promoters enabled by promoter id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  patch admin promoters enabled by promoter id  &{kwargs}
   expect status is 204  ${resp}  

patch admin promoters enabled by promoter id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  patch admin promoters enabled by promoter id  &{kwargs}
   expect status is 422  ${resp}  

delete admin promoters by promoter id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  delete admin promoters by promoter id  &{kwargs}
   expect status is 404  ${resp}  

delete admin promoters by promoter id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  delete admin promoters by promoter id  &{kwargs}
   expect status is 204  ${resp}  

