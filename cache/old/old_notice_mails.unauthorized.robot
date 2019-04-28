*** Settings ***
Documentation  admin_notice_mail
Resource  ../resources.robot
Library  robot_car_wash_server_library.notice_mail.NoticeMailLibrary
Force Tags  model:admin_notice_mail  虾洗后台


*** Test Cases ***
post admin notice mails Fail Without Login
   [Documentation]  接口名:新增通知邮件地址${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  notice_mail=${notice_mail}  
   ${unessential_params}  create list  comment_status=False  money_status=False  car_move_qrcode_status=False  wxmp_remark_status=False  washer_remark_status=False  
   run every case by params  post admin notice mails Fail 403  ${essential_params}  ${unessential_params}

get admin notice mails Fail Without Login
   [Documentation]  接口名:邮件通知列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  page_num=${page_num}  page_size=${page_size}  
   run every case by params  get admin notice mails Fail 403  ${essential_params}  ${unessential_params}

patch admin notice mails (comment status|money status|car move qrcode status|wxmp remark status|washer remark status) by notice mail id Fail Without Login
   [Documentation]  接口名:邮件通知开关修改${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  comment_status=False  money_status=False  car_move_qrcode_status=False  wxmp_remark_status=False  washer_remark_status=False  
   run every case by params  patch admin notice mails (comment status|money status|car move qrcode status|wxmp remark status|washer remark status) by notice mail id Fail 403  ${essential_params}  ${unessential_params}    notice_mail_id/(comment_status|money_status|car_move_qrcode_status|wxmp_remark_status|washer_remark_status)=${notice_mail_id/(comment_status|money_status|car_move_qrcode_status|wxmp_remark_status|washer_remark_status)}  notice_mail_id=${notice_mail_id}

delete admin notice mails by notice mail id Fail Without Login
   [Documentation]  接口名:删除邮件通知地址${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   delete admin notice mails by notice mail id Fail 403    notice_mail_id/(comment_status|money_status|car_move_qrcode_status|wxmp_remark_status|washer_remark_status)=${notice_mail_id/(comment_status|money_status|car_move_qrcode_status|wxmp_remark_status|washer_remark_status)}  notice_mail_id=${notice_mail_id}


*** Variables ***
${notice_mail_id/(comment_status|money_status|car_move_qrcode_status|wxmp_remark_status|washer_remark_status)}  12345678909876543
${notice_mail_id}  12345678909876543


*** Keywords ***
post admin notice mails Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post admin notice mails  &{kwargs}
   expect status is 403  ${resp}  

get admin notice mails Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin notice mails  &{kwargs}
   expect status is 403  ${resp}  

patch admin notice mails (comment status|money status|car move qrcode status|wxmp remark status|washer remark status) by notice mail id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch admin notice mails (comment status|money status|car move qrcode status|wxmp remark status|washer remark status) by notice mail id  &{kwargs}
   expect status is 403  ${resp}  

delete admin notice mails by notice mail id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  delete admin notice mails by notice mail id  &{kwargs}
   expect status is 403  ${resp}  

