*** Settings ***
Documentation  admin_notice_mail
Resource  ../resources.robot
Library  robot_car_wash_server_library.notice_mail.NoticeMailLibrary
Suite Setup  Login  ${admin_username}   ${admin_password}
Suite Teardown  Logout
Force Tags  model:admin_notice_mail  虾洗后台


*** Test Cases ***
post admin notice mails Fail With Wrong Params
   [Documentation]  接口名:新增通知邮件地址${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  notice_mail=${notice_mail_422}  
   ${unessential_params}  create list  comment_status=ThisIsRobot!  money_status=ThisIsRobot!  car_move_qrcode_status=ThisIsRobot!  wxmp_remark_status=ThisIsRobot!  washer_remark_status=ThisIsRobot!  
   run every case by params  post admin notice mails Fail 422  ${essential_params}  ${unessential_params}  success=False

post admin notice mails Success 
   [Documentation]  接口名:新增通知邮件地址${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 201,返回的Json数据符合验证。
   [Tags]           Respcode:201
   ${essential_params}  create list  notice_mail=${notice_mail}  
   ${unessential_params}  create list  comment_status=False  money_status=False  car_move_qrcode_status=False  wxmp_remark_status=False  washer_remark_status=False  
   run every case by params  post admin notice mails Success 201  ${essential_params}  ${unessential_params}

get admin notice mails Success 
   [Documentation]  接口名:邮件通知列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 NoticeMail 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  
   ${unessential_params}  create list  page_num=${page_num}  page_size=${page_size}  
   run every case by params  get admin notice mails Success 200  ${essential_params}  ${unessential_params}

get admin notice mails Fail With Wrong Params
   [Documentation]  接口名:邮件通知列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  page_num=${page_num_422}  page_size=${page_size_422}  
   run every case by params  get admin notice mails Fail 422  ${essential_params}  ${unessential_params}  success=False

patch admin notice mails (comment status|money status|car move qrcode status|wxmp remark status|washer remark status) by notice mail id Success 
   [Documentation]  接口名:邮件通知开关修改${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create list  
   ${unessential_params}  create list  comment_status=False  money_status=False  car_move_qrcode_status=False  wxmp_remark_status=False  washer_remark_status=False  
   run every case by params  patch admin notice mails (comment status|money status|car move qrcode status|wxmp remark status|washer remark status) by notice mail id Success 204  ${essential_params}  ${unessential_params}    notice_mail_id/(comment_status|money_status|car_move_qrcode_status|wxmp_remark_status|washer_remark_status)=${notice_mail_id/(comment_status|money_status|car_move_qrcode_status|wxmp_remark_status|washer_remark_status)}  notice_mail_id=${notice_mail_id}

patch admin notice mails (comment status|money status|car move qrcode status|wxmp remark status|washer remark status) by notice mail id Fail With Wrong Url
   [Documentation]  接口名:邮件通知开关修改${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  
   ${unessential_params}  create list  comment_status=False  money_status=False  car_move_qrcode_status=False  wxmp_remark_status=False  washer_remark_status=False  
   run every case by params  patch admin notice mails (comment status|money status|car move qrcode status|wxmp remark status|washer remark status) by notice mail id Fail 404  ${essential_params}  ${unessential_params}    notice_mail_id/(comment_status|money_status|car_move_qrcode_status|wxmp_remark_status|washer_remark_status)=${w}  notice_mail_id=${r}

patch admin notice mails (comment status|money status|car move qrcode status|wxmp remark status|washer remark status) by notice mail id Fail With Wrong Params
   [Documentation]  接口名:邮件通知开关修改${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  comment_status=ThisIsRobot!  money_status=ThisIsRobot!  car_move_qrcode_status=ThisIsRobot!  wxmp_remark_status=ThisIsRobot!  washer_remark_status=ThisIsRobot!  
   run every case by params  patch admin notice mails (comment status|money status|car move qrcode status|wxmp remark status|washer remark status) by notice mail id Fail 422  ${essential_params}  ${unessential_params}    notice_mail_id/(comment_status|money_status|car_move_qrcode_status|wxmp_remark_status|washer_remark_status)=${notice_mail_id/(comment_status|money_status|car_move_qrcode_status|wxmp_remark_status|washer_remark_status)}  notice_mail_id=${notice_mail_id}  success=False

delete admin notice mails by notice mail id Success 
   [Documentation]  接口名:删除邮件通知地址${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   delete admin notice mails by notice mail id Success 204    notice_mail_id/(comment_status|money_status|car_move_qrcode_status|wxmp_remark_status|washer_remark_status)=${notice_mail_id/(comment_status|money_status|car_move_qrcode_status|wxmp_remark_status|washer_remark_status)}  notice_mail_id=${notice_mail_id}

delete admin notice mails by notice mail id Fail With Wrong Url
   [Documentation]  接口名:删除邮件通知地址${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   delete admin notice mails by notice mail id Fail 404    notice_mail_id/(comment_status|money_status|car_move_qrcode_status|wxmp_remark_status|washer_remark_status)=${w}  notice_mail_id=${r}


*** Variables ***
${notice_mail_id/(comment_status|money_status|car_move_qrcode_status|wxmp_remark_status|washer_remark_status)}  
${notice_mail_id}  


*** Keywords ***
post admin notice mails Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post admin notice mails  &{kwargs}
   expect status is 422  ${resp}  

post admin notice mails Success 201
   [Arguments]  &{kwargs}
   ${resp}=  post admin notice mails  &{kwargs}
   expect status is 201  ${resp}  admin_notice_mail/post_admin_notice_mails_201.json
   ${notice_mail_id/(comment_status|money_status|car_move_qrcode_status|wxmp_remark_status|washer_remark_status)}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][notice_mail_id/(comment_status|money_status|car_move_qrcode_status|wxmp_remark_status|washer_remark_status)]}
   set global variable   ${notice_mail_id/(comment_status|money_status|car_move_qrcode_status|wxmp_remark_status|washer_remark_status)}
   ${notice_mail_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][notice_mail_id]}
   set global variable   ${notice_mail_id}

get admin notice mails Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin notice mails  &{kwargs}
   expect status is 200  ${resp}  admin_notice_mail/get_admin_notice_mails_200.json
   ${notice_mail_id/(comment_status|money_status|car_move_qrcode_status|wxmp_remark_status|washer_remark_status)}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][notice_mail_id/(comment_status|money_status|car_move_qrcode_status|wxmp_remark_status|washer_remark_status)]}
   set global variable   ${notice_mail_id/(comment_status|money_status|car_move_qrcode_status|wxmp_remark_status|washer_remark_status)}
   ${notice_mail_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][notice_mail_id]}
   set global variable   ${notice_mail_id}

get admin notice mails Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get admin notice mails  &{kwargs}
   expect status is 422  ${resp}  

patch admin notice mails (comment status|money status|car move qrcode status|wxmp remark status|washer remark status) by notice mail id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  patch admin notice mails (comment status|money status|car move qrcode status|wxmp remark status|washer remark status) by notice mail id  &{kwargs}
   expect status is 204  ${resp}  

patch admin notice mails (comment status|money status|car move qrcode status|wxmp remark status|washer remark status) by notice mail id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  patch admin notice mails (comment status|money status|car move qrcode status|wxmp remark status|washer remark status) by notice mail id  &{kwargs}
   expect status is 404  ${resp}  

patch admin notice mails (comment status|money status|car move qrcode status|wxmp remark status|washer remark status) by notice mail id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  patch admin notice mails (comment status|money status|car move qrcode status|wxmp remark status|washer remark status) by notice mail id  &{kwargs}
   expect status is 422  ${resp}  

delete admin notice mails by notice mail id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  delete admin notice mails by notice mail id  &{kwargs}
   expect status is 204  ${resp}  

delete admin notice mails by notice mail id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  delete admin notice mails by notice mail id  &{kwargs}
   expect status is 404  ${resp}  

