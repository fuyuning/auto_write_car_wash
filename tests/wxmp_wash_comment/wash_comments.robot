*** Settings ***
Documentation  wxmp_wash_comment
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.wash_comment.WashCommentLibrary
Suite Setup  Login By Openid  ${openid}

Force Tags  model:wxmp_wash_comment  车主微信端


*** Test Cases ***
Post wash_comment Fail Without Login
   [Documentation]  接口名:填写评价${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  wash_record_id=${wash_record_id}  level=${level}  
   ${unessential_params}  create list  car_images=${car_images}  comment_remark=${comment_remark}  
   run every case by params  Post user wash comments Fail 403  ${essential_params}  ${unessential_params}



Post wash_comment Success 
   [Documentation]  接口名:填写评价${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 201,返回的Json数据符合验证。
   [Tags]           Respcode:201
   ${essential_params}  create list  wash_record_id=${wash_record_id}  level=${level}  
   ${unessential_params}  create list  car_images=${car_images}  comment_remark=${comment_remark}  
   run every case by params  Post user wash comments Success 201  ${essential_params}  ${unessential_params}



Post wash_comment Fail With Wrong Params
   [Documentation]  接口名:填写评价${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  wash_record_id=${wash_record_id}  level=${level}  
   ${unessential_params}  create list  car_images=${car_images}  comment_remark=${comment_remark}  
   run every case by params  Post user wash comments Fail 422  ${essential_params}  ${unessential_params}



Get wash_comment By Id Fail Without Login
   [Documentation]  接口名:获取评价${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Get user wash comments By Id Fail 403  wash_record_id=${wash_record_id}



Get wash_comment By Id Fail With Wrong Url
   [Documentation]  接口名:获取评价${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   Get user wash comments By Id Fail 404  wash_record_id=${wrong_url_id}



Get wash_comment By Id Success 
   [Documentation]  接口名:获取评价${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 WashComment 对象。
   [Tags]           Respcode:200
   Get user wash comments By Id Success 200  wash_record_id=${wash_record_id}



Get wash_comment Fail Without Login
   [Documentation]  接口名:填写图片地址转换${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  media_id=${media_id}  
   ${unessential_params}  create list  
   run every case by params  Get image upload Fail 403  ${essential_params}  ${unessential_params}



Get wash_comment Success 
   [Documentation]  接口名:填写图片地址转换${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为  列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  media_id=${media_id}  
   ${unessential_params}  create list  
   run every case by params  Get image upload Success 200  ${essential_params}  ${unessential_params}



Get wash_comment Fail With Wrong Params
   [Documentation]  接口名:填写图片地址转换${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  media_id=${media_id}  
   ${unessential_params}  create list  
   run every case by params  Get image upload Fail 422  ${essential_params}  ${unessential_params}



*** Variables ***
${wash_record_id}


*** Keywords ***
Post User wash comments Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post user wash comments   &{kwargs}
   expect status is 403  ${resp}  

Post User wash comments Success 201
   [Arguments]  &{kwargs}
   ${resp}=  post user wash comments   &{kwargs}
   expect status is 201  ${resp}  wxmp_wash_comment/Post_User_wash_comments_201.json
   ${wash_record_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id]}
   set global variable   ${wash_record_id}

Post User wash comments Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post user wash comments   &{kwargs}
   expect status is 422  ${resp}  

Get User wash comments By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get user wash comments by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Get User wash comments By Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  get user wash comments by wash record id  &{kwargs}
   expect status is 404  ${resp}  

Get User wash comments By Id Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get user wash comments by wash record id  &{kwargs}
   expect status is 200  ${resp}  wxmp_wash_comment/Get_User_wash_comments_By_Id_200.json
   ${wash_record_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id]}
   set global variable   ${wash_record_id}

Get Image upload Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get image upload   &{kwargs}
   expect status is 403  ${resp}  

Get Image upload Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get image upload   &{kwargs}
   expect status is 200  ${resp}  wxmp_wash_comment/Get_Image_upload_200.json
   ${wash_record_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id]}
   set global variable   ${wash_record_id}

Get Image upload Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get image upload   &{kwargs}
   expect status is 422  ${resp}  

