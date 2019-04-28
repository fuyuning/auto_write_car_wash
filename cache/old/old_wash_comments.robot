*** Settings ***
Documentation  wxmp_wash_comment
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.wash_comment.WashCommentLibrary
Suite Setup  Login By Openid  ${openid}
Force Tags  model:wxmp_wash_comment  车主微信端


*** Test Cases ***
post user wash comments Success 
   [Documentation]  接口名:填写评价${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 201,返回的Json数据符合验证。
   [Tags]           Respcode:201
   ${essential_params}  create list  wash_record_id=${wash_record_id}  level=${level}  
   ${unessential_params}  create list  car_images=${car_images}  comment_remark=${comment_remark}  
   run every case by params  post user wash comments Success 201  ${essential_params}  ${unessential_params}

post user wash comments Fail With Wrong Params
   [Documentation]  接口名:填写评价${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  wash_record_id=${wash_record_id_422}  level=${level_422}  
   ${unessential_params}  create list  car_images=${car_images_422}  comment_remark=${comment_remark_422}  
   run every case by params  post user wash comments Fail 422  ${essential_params}  ${unessential_params}  success=False

get user wash comments by wash record id Fail With Wrong Url
   [Documentation]  接口名:获取评价${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   get user wash comments by wash record id Fail 404    wash_record_id=${wrong_url_id}

get user wash comments by wash record id Success 
   [Documentation]  接口名:获取评价${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 WashComment 对象。
   [Tags]           Respcode:200
   get user wash comments by wash record id Success 200    wash_record_id=${wash_record_id}

get wechat image upload Success 
   [Documentation]  接口名:填写图片地址转换${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为  列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  media_id=${media_id}  
   ${unessential_params}  create list  
   run every case by params  get wechat image upload Success 200  ${essential_params}  ${unessential_params}

get wechat image upload Fail With Wrong Params
   [Documentation]  接口名:填写图片地址转换${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  media_id=${media_id_422}  
   ${unessential_params}  create list  
   run every case by params  get wechat image upload Fail 422  ${essential_params}  ${unessential_params}  success=False


*** Variables ***
${wash_record_id}  


*** Keywords ***
post user wash comments Success 201
   [Arguments]  &{kwargs}
   ${resp}=  post user wash comments  &{kwargs}
   expect status is 201  ${resp}  wxmp_wash_comment/post_user_wash_comments_201.json
   ${wash_record_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id]}
   set global variable   ${wash_record_id}

post user wash comments Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post user wash comments  &{kwargs}
   expect status is 422  ${resp}  

get user wash comments by wash record id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  get user wash comments by wash record id  &{kwargs}
   expect status is 404  ${resp}  

get user wash comments by wash record id Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get user wash comments by wash record id  &{kwargs}
   expect status is 200  ${resp}  wxmp_wash_comment/get_user_wash_comments_by_wash_record_id_200.json
   ${wash_record_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id]}
   set global variable   ${wash_record_id}

get wechat image upload Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get wechat image upload  &{kwargs}
   expect status is 200  ${resp}  wxmp_wash_comment/get_wechat_image_upload_200.json
   ${wash_record_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id]}
   set global variable   ${wash_record_id}

get wechat image upload Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get wechat image upload  &{kwargs}
   expect status is 422  ${resp}  

