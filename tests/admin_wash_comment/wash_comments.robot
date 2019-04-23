*** Settings ***
Documentation  admin_wash_comment
Resource  ../resources.robot
Library  robot_car_wash_server_library.wash_comment.WashCommentLibrary
Suite Setup  Login  ${admin_username}   ${admin_password}
Suite Teardown  Logout
Force Tags  model:admin_wash_comment  虾洗后台


*** Test Cases ***
Get wash_comment Fail Without Login
   [Documentation]  接口名:获取评价列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  order_no=${order_no}  user_id=${user_id}  car_id=${car_id}  mobile=${mobile}  level=${level}  created_section=${created_section}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get admin wash comments Fail 403  ${essential_params}  ${unessential_params}



Get wash_comment Success 
   [Documentation]  接口名:获取评价列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 WashComment 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  
   ${unessential_params}  create list  order_no=${order_no}  user_id=${user_id}  car_id=${car_id}  mobile=${mobile}  level=${level}  created_section=${created_section}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get admin wash comments Success 200  ${essential_params}  ${unessential_params}



Get wash_comment Fail With Wrong Params
   [Documentation]  接口名:获取评价列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  order_no=${order_no}  user_id=${user_id}  car_id=${car_id}  mobile=${mobile}  level=${level}  created_section=${created_section}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get admin wash comments Fail 422  ${essential_params}  ${unessential_params}



Delete wash_comment By Id Success 
   [Documentation]  接口名:删除评价${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   Delete admin wash comments By Id Success 204  comment_id=${comment_id}



Delete wash_comment By Id Fail With Wrong Url
   [Documentation]  接口名:删除评价${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   Delete admin wash comments By Id Fail 404  comment_id=${wrong_url_id}



Delete wash_comment By Id Fail Without Login
   [Documentation]  接口名:删除评价${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Delete admin wash comments By Id Fail 403  comment_id=${comment_id}



*** Variables ***
${comment_id}


*** Keywords ***
Get Admin wash comments Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin wash comments   &{kwargs}
   expect status is 403  ${resp}  

Get Admin wash comments Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin wash comments   &{kwargs}
   expect status is 200  ${resp}  admin_wash_comment/Get_Admin_wash_comments_200.json
   ${comment_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][comment_id]}
   set global variable   ${comment_id}

Get Admin wash comments Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get admin wash comments   &{kwargs}
   expect status is 422  ${resp}  

Delete Admin wash comments By Id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  delete admin wash comments by comment id  &{kwargs}
   expect status is 204  ${resp}  

Delete Admin wash comments By Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  delete admin wash comments by comment id  &{kwargs}
   expect status is 404  ${resp}  

Delete Admin wash comments By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  delete admin wash comments by comment id  &{kwargs}
   expect status is 403  ${resp}  

