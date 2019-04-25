*** Settings ***
Documentation  admin_membership_statistic
Resource  ../resources.robot
Library  robot_car_wash_server_library.membership_statistic.MembershipStatisticLibrary
Suite Setup  Login  ${admin_username}   ${admin_password}
Suite Teardown  Logout
Force Tags  model:admin_membership_statistic  虾洗后台


*** Test Cases ***
Get Admin Membership Statistic Success 
   [Documentation]  接口名:会员趋势统计${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 MembershipStatistic 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  
   ${unessential_params}  create list  order_by=${order_by}  section=${section}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get Admin Membership Statistic Success 200  ${essential_params}  ${unessential_params}

Get Admin Membership Statistic Fail With Wrong Params
   [Documentation]  接口名:会员趋势统计${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  order_by=${order_by_422}  section=${section_422}  page_num=${page_num_422}  page_size=${page_size_422}  
   run every case by params  Get Admin Membership Statistic Fail 422  ${essential_params}  ${unessential_params}


*** Keywords ***
Get Admin Membership Statistic Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Membership Statistic   &{kwargs}
   expect status is 200  ${resp}  admin_membership_statistic/Get_Admin_Membership_Statistic_200.json

Get Admin Membership Statistic Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Membership Statistic   &{kwargs}
   expect status is 422  ${resp}  

