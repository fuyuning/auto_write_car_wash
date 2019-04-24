*** Settings ***
Documentation  wxmp_wash_comment
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.wash_comment.WashCommentLibrary
Suite Setup  Login By Openid  ${openid}
Force Tags  model:wxmp_wash_comment  车主微信端


*** Test Cases ***
Post User Wash Comments Success 
   [Documentation]  接口名:填写评价${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 201,返回的Json数据符合验证。
   [Tags]           Respcode:201
   ${essential_params}  create list  wash_record_id=${wash_record_id}  level=${level}  
   ${unessential_params}  create list  car_images=${car_images}  comment_remark=${comment_remark}  
   run every case by params  Post User Wash Comments Success 201  ${essential_params}  ${unessential_params}

Post User Wash Comments Fail With Wrong Params
   [Documentation]  接口名:填写评价${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  wash_record_id=${wash_record_id}  level=${level}  
   ${unessential_params}  create list  car_images=${car_images}  comment_remark=${comment_remark}  
   run every case by params  Post User Wash Comments Fail 422  ${essential_params}  ${unessential_params}

Get User Wash Comments By Wash Record Id Fail With Wrong Url
   [Documentation]  接口名:获取评价${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   Get User Wash Comments By Wash Record Id Fail 404  wash_record_id=${wrong_url_id}

Get User Wash Comments By Wash Record Id Success 
   [Documentation]  接口名:获取评价${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 WashComment 对象。
   [Tags]           Respcode:200
   Get User Wash Comments By Wash Record Id Success 200  wash_record_id=${wash_record_id}

Get Image Upload Success 
   [Documentation]  接口名:填写图片地址转换${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为  列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  media_id=${media_id}  
   ${unessential_params}  create list  
   run every case by params  Get Image Upload Success 200  ${essential_params}  ${unessential_params}

Get Image Upload Fail With Wrong Params
   [Documentation]  接口名:填写图片地址转换${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  media_id=${media_id}  
   ${unessential_params}  create list  
   run every case by params  Get Image Upload Fail 422  ${essential_params}  ${unessential_params}


*** Variables ***
${wash_record_id}  


*** Keywords ***
Post User Wash Comments Success 201
   [Arguments]  &{kwargs}
   ${resp}=  Post User Wash Comments   &{kwargs}
   expect status is 201  ${resp}  wxmp_wash_comment/Post_User_Wash_Comments_201.json
   ${wash_record_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id]}
   set global variable   ${wash_record_id}

Post User Wash Comments Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Post User Wash Comments   &{kwargs}
   expect status is 422  ${resp}  

Get User Wash Comments By Wash Record Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  Get User Wash Comments By Wash Record Id   &{kwargs}
   expect status is 404  ${resp}  

Get User Wash Comments By Wash Record Id Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Get User Wash Comments By Wash Record Id   &{kwargs}
   expect status is 200  ${resp}  wxmp_wash_comment/Get_User_Wash_Comments_By_Wash_Record_Id_200.json
   ${wash_record_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id]}
   set global variable   ${wash_record_id}

Get Image Upload Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Get Image Upload   &{kwargs}
   expect status is 200  ${resp}  wxmp_wash_comment/Get_Image_Upload_200.json
   ${wash_record_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id]}
   set global variable   ${wash_record_id}

Get Image Upload Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Get Image Upload   &{kwargs}
   expect status is 422  ${resp}  

