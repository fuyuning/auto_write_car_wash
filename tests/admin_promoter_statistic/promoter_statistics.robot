*** Settings ***
Documentation  admin_promoter_statistic
Resource  ../resources.robot
Library  robot_car_wash_server_library.promoter_statistic.PromoterStatisticLibrary
Suite Setup  Login  ${admin_username}   ${admin_password}
Suite Teardown  Logout
Force Tags  model:admin_promoter_statistic  虾洗后台


*** Test Cases ***
Get Admin Promoter Statistics Success 
   [Documentation]  接口名:推广二维码统计列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 PromoterStatistic 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  
   ${unessential_params}  create list  promoter_no=${promoter_no}  name=${name}  mobile=${mobile}  section=${section}  order_by=${order_by}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get Admin Promoter Statistics Success 200  ${essential_params}  ${unessential_params}

Get Admin Promoter Statistics Fail With Wrong Params
   [Documentation]  接口名:推广二维码统计列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  promoter_no=${promoter_no}  name=${name}  mobile=${mobile}  section=${section}  order_by=${order_by}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get Admin Promoter Statistics Fail 422  ${essential_params}  ${unessential_params}

Patch Visible By Promoter Statistic Id Fail With Wrong Url
   [Documentation]  接口名:隐藏${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  visible=False  
   ${unessential_params}  create list  
   run every case by params  Patch Visible By Promoter Statistic Id Fail 404  ${essential_params}  ${unessential_params}  promoter_statistic_id/visible=${wrong_url_id}

Patch Visible By Promoter Statistic Id Success 
   [Documentation]  接口名:隐藏${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create list  visible=False  
   ${unessential_params}  create list  
   run every case by params  Patch Visible By Promoter Statistic Id Success 204  ${essential_params}  ${unessential_params}  promoter_statistic_id/visible=${promoter_statistic_id/visible}

Patch Visible By Promoter Statistic Id Fail With Wrong Params
   [Documentation]  接口名:隐藏${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  visible=False  
   ${unessential_params}  create list  
   run every case by params  Patch Visible By Promoter Statistic Id Fail 422  ${essential_params}  ${unessential_params}  promoter_statistic_id/visible=${promoter_statistic_id/visible}


*** Variables ***
${promoter_statistic_id/visible}


*** Keywords ***
Get Admin Promoter Statistics Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Promoter Statistics   &{kwargs}
   expect status is 200  ${resp}  admin_promoter_statistic/Get_Admin_Promoter_Statistics_200.json
   ${promoter_statistic_id/visible}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][promoter_statistic_id/visible]}
   set global variable   ${promoter_statistic_id/visible}

Get Admin Promoter Statistics Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Promoter Statistics   &{kwargs}
   expect status is 422  ${resp}  

Patch Visible By Promoter Statistic Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  Patch Visible By Promoter Statistic Id   &{kwargs}
   expect status is 404  ${resp}  

Patch Visible By Promoter Statistic Id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  Patch Visible By Promoter Statistic Id   &{kwargs}
   expect status is 204  ${resp}  

Patch Visible By Promoter Statistic Id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Patch Visible By Promoter Statistic Id   &{kwargs}
   expect status is 422  ${resp}  

