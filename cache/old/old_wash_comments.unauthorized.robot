*** Settings ***
Documentation  wxmp_wash_comment
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.wash_comment.WashCommentLibrary
Force Tags  model:wxmp_wash_comment  车主微信端


*** Test Cases ***
post user wash comments Fail Without Login
   [Documentation]  接口名:填写评价${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  wash_record_id=${wash_record_id}  level=${level}  
   ${unessential_params}  create list  car_images=${car_images}  comment_remark=${comment_remark}  
   run every case by params  post user wash comments Fail 403  ${essential_params}  ${unessential_params}

get user wash comments by wash record id Fail Without Login
   [Documentation]  接口名:获取评价${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get user wash comments by wash record id Fail 403    wash_record_id=${wash_record_id}

get wechat image upload Fail Without Login
   [Documentation]  接口名:填写图片地址转换${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  media_id=${media_id}  
   ${unessential_params}  create list  
   run every case by params  get wechat image upload Fail 403  ${essential_params}  ${unessential_params}


*** Variables ***
${wash_record_id}  12345678909876543


*** Keywords ***
post user wash comments Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post user wash comments  &{kwargs}
   expect status is 403  ${resp}  

get user wash comments by wash record id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get user wash comments by wash record id  &{kwargs}
   expect status is 403  ${resp}  

get wechat image upload Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get wechat image upload  &{kwargs}
   expect status is 403  ${resp}  

