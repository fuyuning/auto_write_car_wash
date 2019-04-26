*** Settings ***
Documentation  admin_membership_statistic
Resource  ../resources.robot
Library  robot_car_wash_server_library.membership_statistic.MembershipStatisticLibrary
Force Tags  model:admin_membership_statistic  虾洗后台


*** Test Cases ***
Get Admin Membership Statistic Fail Without Login
   [Documentation]  接口名:会员趋势统计${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  order_by=${order_by}  section=${section}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get Admin Membership Statistic Fail 403  ${essential_params}  ${unessential_params}


*** Keywords ***
Get Admin Membership Statistic Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Membership Statistic   &{kwargs}
   expect status is 403  ${resp}  

