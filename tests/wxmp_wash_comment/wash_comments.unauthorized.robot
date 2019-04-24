*** Settings ***
Documentation  wxmp_wash_comment
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.wash_comment.WashCommentLibrary
Force Tags  model:wxmp_wash_comment  车主微信端


*** Test Cases ***
Post User Wash Comments Fail Without Login
   [Documentation]  接口名:填写评价${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  wash_record_id=${wash_record_id}  level=${level}  
   ${unessential_params}  create list  car_images=${car_images}  comment_remark=${comment_remark}  
   run every case by params  Post User Wash Comments Fail 403  ${essential_params}  ${unessential_params}

Get User Wash Comments By Wash Record Id Fail Without Login
   [Documentation]  接口名:获取评价${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Get User Wash Comments By Wash Record Id Fail 403  wash_record_id=${wash_record_id}

Get Image Upload Fail Without Login
   [Documentation]  接口名:填写图片地址转换${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  media_id=${media_id}  
   ${unessential_params}  create list  
   run every case by params  Get Image Upload Fail 403  ${essential_params}  ${unessential_params}


*** Variables ***
${wash_record_id}


*** Keywords ***
Post User Wash Comments Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Post User Wash Comments   &{kwargs}
   expect status is 403  ${resp}  

Get User Wash Comments By Wash Record Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get User Wash Comments By Wash Record Id   &{kwargs}
   expect status is 403  ${resp}  

Get Image Upload Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get Image Upload   &{kwargs}
   expect status is 403  ${resp}  

