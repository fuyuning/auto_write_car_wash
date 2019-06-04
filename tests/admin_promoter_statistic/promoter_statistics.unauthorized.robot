*** Settings ***
Documentation  admin_promoter_statistic
Resource  ../resources.robot
Library  robot_car_wash_server_library.promoter_statistic.PromoterStatisticLibrary
Force Tags  model:admin_promoter_statistic  虾洗后台


*** Test Cases ***
get admin promoter statistics Fail Without Login
   [Documentation]  接口名:推广二维码统计列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get admin promoter statistics fail 403     promoter_no=${promoter_no}  name=${name}  mobile=${mobile}  section=${section}  order_by=${order_by}  page_num=${page_num}  page_size=${page_size}  

patch admin promoter statistics visible by promoter statistic id Fail Without Login
   [Documentation]  接口名:隐藏${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   patch admin promoter statistics visible by promoter statistic id fail 403     promoter_statistic_id=${promoter_statistic_id}  visible=False    


*** Variables ***
${promoter_statistic_id}  1a2b3c4d5e6f7zz


*** Keywords ***
get admin promoter statistics Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin promoter statistics  &{kwargs}
   expect status is 403  ${resp}  

patch admin promoter statistics visible by promoter statistic id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch admin promoter statistics visible by promoter statistic id  &{kwargs}
   expect status is 403  ${resp}  

