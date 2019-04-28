*** Settings ***
Documentation  admin_wash_comment
Resource  ../resources.robot
Library  robot_car_wash_server_library.wash_comment.WashCommentLibrary
Force Tags  model:admin_wash_comment  虾洗后台


*** Test Cases ***
get admin wash comments Fail Without Login
   [Documentation]  接口名:获取评价列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  order_no=${order_no}  user_id=${user_id}  car_id=${car_id}  mobile=${mobile}  level=${level}  created_section=${created_section}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  get admin wash comments Fail 403  ${essential_params}  ${unessential_params}

delete admin wash comments by comment id Fail Without Login
   [Documentation]  接口名:删除评价${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   delete admin wash comments by comment id Fail 403    comment_id=${comment_id}


*** Variables ***
${comment_id}  12345678909876543


*** Keywords ***
get admin wash comments Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin wash comments  &{kwargs}
   expect status is 403  ${resp}  

delete admin wash comments by comment id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  delete admin wash comments by comment id  &{kwargs}
   expect status is 403  ${resp}  

