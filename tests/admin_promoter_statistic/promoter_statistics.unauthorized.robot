*** Settings ***
Documentation  admin_promoter_statistic
Resource  ../resources.robot
Library  robot_car_wash_server_library.promoter_statistic.PromoterStatisticLibrary
Force Tags  model:admin_promoter_statistic  虾洗后台


*** Test Cases ***
Get Admin Promoter Statistics Fail Without Login
   [Documentation]  接口名:推广二维码统计列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  promoter_no=${promoter_no}  name=${name}  mobile=${mobile}  section=${section}  order_by=${order_by}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get Admin Promoter Statistics Fail 403  ${essential_params}  ${unessential_params}

Patch Visible By Promoter Statistic Id Fail Without Login
   [Documentation]  接口名:隐藏${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  visible=False  
   ${unessential_params}  create list  
   run every case by params  Patch Visible By Promoter Statistic Id Fail 403  ${essential_params}  ${unessential_params}  promoter_statistic_id/visible=${promoter_statistic_id/visible}


*** Variables ***
${promoter_statistic_id/visible}  12345678909876543


*** Keywords ***
Get Admin Promoter Statistics Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Promoter Statistics   &{kwargs}
   expect status is 403  ${resp}  

Patch Visible By Promoter Statistic Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Patch Visible By Promoter Statistic Id   &{kwargs}
   expect status is 403  ${resp}  

