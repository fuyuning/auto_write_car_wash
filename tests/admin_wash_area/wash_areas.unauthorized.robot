*** Settings ***
Documentation  admin_wash_area
Resource  ../resources.robot
Library  robot_car_wash_server_library.wash_area.WashAreaLibrary
Force Tags  model:admin_wash_area  虾洗后台


*** Test Cases ***
Post Admin Wash Areas Fail Without Login
   [Documentation]  接口名:服务区域_添加${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  name=${name}  province=${province}  city=${city}  district=${district}  service_type=${service_type}  
   ${unessential_params}  create list  wash_normal=False  wash_group=False  user_group=False  enabled=False  
   run every case by params  Post Admin Wash Areas Fail 403  ${essential_params}  ${unessential_params}

Get Admin Wash Areas Fail Without Login
   [Documentation]  接口名:服务区域_查询${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  page_num=${page_num}  page_size=${page_size}  
   ${unessential_params}  create list  name=${name}  enabled=False  
   run every case by params  Get Admin Wash Areas Fail 403  ${essential_params}  ${unessential_params}

Get Admin Wash Areas By Wash Area Id Fail Without Login
   [Documentation]  接口名:服务区域_查询${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Get Admin Wash Areas By Wash Area Id Fail 403  wash_area_id=${wash_area_id}

Put Admin Wash Areas By Wash Area Id Fail Without Login
   [Documentation]  接口名:服务区域_编辑${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  name=${name}  province=${province}  city=${city}  district=${district}  service_type=${service_type}  
   ${unessential_params}  create list  wash_normal=False  wash_group=False  user_group=False  enabled=False  
   run every case by params  Put Admin Wash Areas By Wash Area Id Fail 403  ${essential_params}  ${unessential_params}  wash_area_id=${wash_area_id}

Patch (wash Normal|wash Group|user Group|enabled) by wash area id Fail Without Login
   [Documentation]  接口名:服务区域_四个开关${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  wash_normal=False  wash_group=False  user_group=False  enabled=False  
   run every case by params  Patch (wash Normal|wash Group|user Group|enabled) by wash area id Fail 403  ${essential_params}  ${unessential_params}  wash_area_id/(wash_normal|wash_group|user_group|enabled)=${wash_area_id/(wash_normal|wash_group|user_group|enabled)}

Delete Admin Wash Areas By Wash Area Id Fail Without Login
   [Documentation]  接口名:服务区域_删除${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Delete Admin Wash Areas By Wash Area Id Fail 403  wash_area_id=${wash_area_id}


*** Variables ***
${wash_area_id}  12345678909876543
${wash_area_id/(wash_normal|wash_group|user_group|enabled)}  12345678909876543


*** Keywords ***
Post Admin Wash Areas Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Post Admin Wash Areas   &{kwargs}
   expect status is 403  ${resp}  

Get Admin Wash Areas Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Wash Areas   &{kwargs}
   expect status is 403  ${resp}  

Get Admin Wash Areas By Wash Area Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Wash Areas By Wash Area Id   &{kwargs}
   expect status is 403  ${resp}  

Put Admin Wash Areas By Wash Area Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Put Admin Wash Areas By Wash Area Id   &{kwargs}
   expect status is 403  ${resp}  

Patch (wash Normal|wash Group|user Group|enabled) by wash area id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Patch (wash Normal|wash Group|user Group|enabled) by wash area id   &{kwargs}
   expect status is 403  ${resp}  

Delete Admin Wash Areas By Wash Area Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Delete Admin Wash Areas By Wash Area Id   &{kwargs}
   expect status is 403  ${resp}  

