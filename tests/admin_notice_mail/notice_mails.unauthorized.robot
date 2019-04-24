*** Settings ***
Documentation  admin_notice_mail
Resource  ../resources.robot
Library  robot_car_wash_server_library.notice_mail.NoticeMailLibrary
Force Tags  model:admin_notice_mail  虾洗后台


*** Test Cases ***
Post Admin Notice Mails Fail Without Login
   [Documentation]  接口名:新增通知邮件地址${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  notice_mail=${notice_mail}  
   ${unessential_params}  create list  comment_status=False  money_status=False  car_move_qrcode_status=False  wxmp_remark_status=False  washer_remark_status=False  
   run every case by params  Post Admin Notice Mails Fail 403  ${essential_params}  ${unessential_params}

Get Admin Notice Mails Fail Without Login
   [Documentation]  接口名:邮件通知列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get Admin Notice Mails Fail 403  ${essential_params}  ${unessential_params}

Patch (comment Status|money Status|car Move Qrcode Status|wxmp Remark Status|washer Remark Status) by notice mail id Fail Without Login
   [Documentation]  接口名:邮件通知开关修改${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  comment_status=False  money_status=False  car_move_qrcode_status=False  wxmp_remark_status=False  washer_remark_status=False  
   run every case by params  Patch (comment Status|money Status|car Move Qrcode Status|wxmp Remark Status|washer Remark Status) by notice mail id Fail 403  ${essential_params}  ${unessential_params}  notice_mail_id/(comment_status|money_status|car_move_qrcode_status|wxmp_remark_status|washer_remark_status)=${notice_mail_id/(comment_status|money_status|car_move_qrcode_status|wxmp_remark_status|washer_remark_status)}

Delete Admin Notice Mails By Notice Mail Id Fail Without Login
   [Documentation]  接口名:删除邮件通知地址${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Delete Admin Notice Mails By Notice Mail Id Fail 403  notice_mail_id=${notice_mail_id}


*** Variables ***
${notice_mail_id/(comment_status|money_status|car_move_qrcode_status|wxmp_remark_status|washer_remark_status)}  12345678909876543
${notice_mail_id}  12345678909876543


*** Keywords ***
Post Admin Notice Mails Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Post Admin Notice Mails   &{kwargs}
   expect status is 403  ${resp}  

Get Admin Notice Mails Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Notice Mails   &{kwargs}
   expect status is 403  ${resp}  

Patch (comment Status|money Status|car Move Qrcode Status|wxmp Remark Status|washer Remark Status) by notice mail id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Patch (comment Status|money Status|car Move Qrcode Status|wxmp Remark Status|washer Remark Status) by notice mail id   &{kwargs}
   expect status is 403  ${resp}  

Delete Admin Notice Mails By Notice Mail Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Delete Admin Notice Mails By Notice Mail Id   &{kwargs}
   expect status is 403  ${resp}  

