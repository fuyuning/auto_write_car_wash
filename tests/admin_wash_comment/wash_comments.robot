*** Settings ***
Documentation  admin_wash_comment
Resource  ../resources.robot
Library  robot_car_wash_server_library.wash_comment.WashCommentLibrary
Suite Setup  Login  ${admin_username}   ${admin_password}
Suite Teardown  Logout
Force Tags  model:admin_wash_comment  虾洗后台


*** Test Cases ***
Get Admin Wash Comments Success 
   [Documentation]  接口名:获取评价列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 WashComment 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  
   ${unessential_params}  create list  order_no=${order_no}  user_id=${user_id}  car_id=${car_id}  mobile=${mobile}  level=${level}  created_section=${created_section}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get Admin Wash Comments Success 200  ${essential_params}  ${unessential_params}

Get Admin Wash Comments Fail With Wrong Params
   [Documentation]  接口名:获取评价列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  order_no=${order_no}  user_id=${user_id}  car_id=${car_id}  mobile=${mobile}  level=${level}  created_section=${created_section}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get Admin Wash Comments Fail 422  ${essential_params}  ${unessential_params}

Delete Admin Wash Comments By Comment Id Fail With Wrong Url
   [Documentation]  接口名:删除评价${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   Delete Admin Wash Comments By Comment Id Fail 404  comment_id=${wrong_url_id}

Delete Admin Wash Comments By Comment Id Success 
   [Documentation]  接口名:删除评价${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   Delete Admin Wash Comments By Comment Id Success 204  comment_id=${comment_id}


*** Variables ***
${comment_id}  


*** Keywords ***
Get Admin Wash Comments Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Wash Comments   &{kwargs}
   expect status is 200  ${resp}  admin_wash_comment/Get_Admin_Wash_Comments_200.json
   ${comment_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][comment_id]}
   set global variable   ${comment_id}

Get Admin Wash Comments Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Wash Comments   &{kwargs}
   expect status is 422  ${resp}  

Delete Admin Wash Comments By Comment Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  Delete Admin Wash Comments By Comment Id   &{kwargs}
   expect status is 404  ${resp}  

Delete Admin Wash Comments By Comment Id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  Delete Admin Wash Comments By Comment Id   &{kwargs}
   expect status is 204  ${resp}  

