*** Settings ***
Documentation  admin_line_promotion
Resource  ../resources.robot
Library  robot_car_wash_server_library.line_promotion.LinePromotionLibrary
Suite Setup  Login  ${username}   ${password}
Suite Teardown  Logout
Force Tags  model:admin_line_promotion  虾洗后台


*** Test Cases ***
get admin line promotions Success 
   [Documentation]  接口名:查询地推${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 LinePromotion 列表。
   [Tags]           Respcode:200
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  car_id=${car_id}  sex=${sex}  car_status=${car_status}  parking_id=${parking_id}  wash_status=${wash_status}  user_tag=${user_tag}  created_section=${created_section}  page_num=${page_num}  page_size=${page_size}  
   run every case by params   get admin line promotions success 200   ${essential_params}  ${unessential_params}

get admin line promotions Fail With Wrong Params
   [Documentation]  接口名:查询地推${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  car_id=${car_id_422}  sex=${sex_422}  car_status=${car_status_422}  parking_id=${parking_id_422}  wash_status=${wash_status_422}  user_tag=${user_tag_422}  created_section=${created_section_422}  page_num=${page_num_422}  page_size=${page_size_422}  
   run every case by params   get admin line promotions fail 422   ${essential_params}  ${unessential_params}  success=False

get admin line promotions by lpr id Success 
   [Documentation]  接口名:查询地推记录${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 LinePromotionRecord 对象。
   [Tags]           Respcode:200
   get admin line promotions by lpr id success 200     lpr_id=${lpr_id}

get admin line promotions by lpr id Fail With Wrong Url
   [Documentation]  接口名:查询地推记录${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   get admin line promotions by lpr id fail 404     lpr_id=${wrong_url_id}

delete admin line promotions by lpr id Fail With Wrong Url
   [Documentation]  接口名:删除${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   delete admin line promotions by lpr id fail 404     lpr_id=${wrong_url_id}

delete admin line promotions by lpr id Success 
   [Documentation]  接口名:删除${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   delete admin line promotions by lpr id success 204     lpr_id=${lpr_id}


*** Variables ***
${lpr_id}  


*** Keywords ***
get admin line promotions Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin line promotions  &{kwargs}
   expect status is 200  ${resp}  admin_line_promotion/get_admin_line_promotions_200.json
   ${lpr_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0]['lpr_id']}
   set global variable   ${lpr_id}

get admin line promotions Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get admin line promotions  &{kwargs}
   expect status is 422  ${resp}  

get admin line promotions by lpr id Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin line promotions by lpr id  &{kwargs}
   expect status is 200  ${resp}  admin_line_promotion/get_admin_line_promotions_by_lpr_id_200.json
   ${lpr_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0]['lpr_id']}
   set global variable   ${lpr_id}

get admin line promotions by lpr id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  get admin line promotions by lpr id  &{kwargs}
   expect status is 404  ${resp}  

delete admin line promotions by lpr id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  delete admin line promotions by lpr id  &{kwargs}
   expect status is 404  ${resp}  

delete admin line promotions by lpr id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  delete admin line promotions by lpr id  &{kwargs}
   expect status is 204  ${resp}  

