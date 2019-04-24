*** Settings ***
Documentation  admin_wash_user_group
Resource  ../resources.robot
Library  robot_car_wash_server_library.wash_user_group.WashUserGroupLibrary
Force Tags  model:admin_wash_user_group  虾洗后台


Post Admin Wash User Groups Fail Without Login
   [Documentation]  接口名:新增分组${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  name=${name}  order_by=${order_by}  
   ${unessential_params}  create list  
   run every case by params  Post Admin Wash User Groups Fail 403  ${essential_params}  ${unessential_params}

Get Admin Wash User Groups Fail Without Login
   [Documentation]  接口名:分组列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
    Get Admin Wash User Groups Fail 403

Get Admin Wash User Groups By Wash User Group Id Fail Without Login
   [Documentation]  接口名:分组信息获取${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Get Admin Wash User Groups By Wash User Group Id Fail 403  wash_user_group_id=${wash_user_group_id}

Put Admin Wash User Groups By Wash User Group Id Fail Without Login
   [Documentation]  接口名:编辑分组${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  name=${name}  order_by=${order_by}  
   ${unessential_params}  create list  
   run every case by params  Put Admin Wash User Groups By Wash User Group Id Fail 403  ${essential_params}  ${unessential_params}  wash_user_group_id=${wash_user_group_id}

Delete Admin Wash User Groups By Wash User Group Id Fail Without Login
   [Documentation]  接口名:删除分组${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Delete Admin Wash User Groups By Wash User Group Id Fail 403  wash_user_group_id=${wash_user_group_id}

Post Admin Wash User Groups Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Post Admin Wash User Groups   &{kwargs}
   expect status is 403  ${resp}  

Get Admin Wash User Groups Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Wash User Groups   &{kwargs}
   expect status is 403  ${resp}  

Get Admin Wash User Groups By Wash User Group Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Wash User Groups By Wash User Group Id   &{kwargs}
   expect status is 403  ${resp}  

Put Admin Wash User Groups By Wash User Group Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Put Admin Wash User Groups By Wash User Group Id   &{kwargs}
   expect status is 403  ${resp}  

Delete Admin Wash User Groups By Wash User Group Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Delete Admin Wash User Groups By Wash User Group Id   &{kwargs}
   expect status is 403  ${resp}  

