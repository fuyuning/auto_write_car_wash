*** Settings ***
Documentation  admin_wash_comment
Resource  ../resources.robot
Library  robot_car_wash_server_library.wash_comment.WashCommentLibrary
Suite Setup  Login  ${admin_username}   ${admin_password}
Suite Teardown  Logout
Force Tags  model:admin_wash_comment  虾洗后台


*** Test Cases ***
get admin wash comments Success 
   [Documentation]  接口名:获取评价列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 WashComment 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  
   ${unessential_params}  create list  order_no=${order_no}  user_id=${user_id}  car_id=${car_id}  mobile=${mobile}  level=${level}  created_section=${created_section}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  get admin wash comments Success 200  ${essential_params}  ${unessential_params}

get admin wash comments Fail With Wrong Params
   [Documentation]  接口名:获取评价列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  order_no=${order_no_422}  user_id=${user_id_422}  car_id=${car_id_422}  mobile=${mobile_422}  level=${level_422}  created_section=${created_section_422}  page_num=${page_num_422}  page_size=${page_size_422}  
   run every case by params  get admin wash comments Fail 422  ${essential_params}  ${unessential_params}  success=False

delete admin wash comments by comment id Fail With Wrong Url
   [Documentation]  接口名:删除评价${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   delete admin wash comments by comment id Fail 404    comment_id=${wrong_url_id}

delete admin wash comments by comment id Success 
   [Documentation]  接口名:删除评价${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   delete admin wash comments by comment id Success 204    comment_id=${comment_id}


*** Variables ***
${comment_id}  


*** Keywords ***
get admin wash comments Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin wash comments  &{kwargs}
   expect status is 200  ${resp}  admin_wash_comment/get_admin_wash_comments_200.json
   ${comment_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][comment_id]}
   set global variable   ${comment_id}

get admin wash comments Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get admin wash comments  &{kwargs}
   expect status is 422  ${resp}  

delete admin wash comments by comment id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  delete admin wash comments by comment id  &{kwargs}
   expect status is 404  ${resp}  

delete admin wash comments by comment id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  delete admin wash comments by comment id  &{kwargs}
   expect status is 204  ${resp}  

