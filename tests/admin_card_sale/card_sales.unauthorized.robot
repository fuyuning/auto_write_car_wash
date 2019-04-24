*** Settings ***
Documentation  admin_card_sale
Resource  ../resources.robot
Library  robot_car_wash_server_library.card_sale.CardSaleLibrary
Force Tags  model:admin_card_sale  虾洗后台


*** Test Cases ***
Post Admin Card Sales Fail Without Login
   [Documentation]  接口名:创建可购买会员卡${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  card_id=${card_id}  enabled=False  order_by=${order_by}  
   ${unessential_params}  create list  
   run every case by params  Post Admin Card Sales Fail 403  ${essential_params}  ${unessential_params}

Get Admin Card Sales Fail Without Login
   [Documentation]  接口名:查询可购买会员卡${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
    Get Admin Card Sales Fail 403

Put Admin Card Sales By Card Sale Id Fail Without Login
   [Documentation]  接口名:修改可购买会员卡${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  card_id=${card_id}  enabled=False  order_by=${order_by}  
   ${unessential_params}  create list  
   run every case by params  Put Admin Card Sales By Card Sale Id Fail 403  ${essential_params}  ${unessential_params}  card_sale_id=${card_sale_id}

Delete Admin Card Sales By Card Sale Id Fail Without Login
   [Documentation]  接口名:删除可购买会员卡${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Delete Admin Card Sales By Card Sale Id Fail 403  card_sale_id=${card_sale_id}


*** Variables ***
${card_sale_id}  12345678909876543


*** Keywords ***
Post Admin Card Sales Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Post Admin Card Sales   &{kwargs}
   expect status is 403  ${resp}  

Get Admin Card Sales Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Card Sales   &{kwargs}
   expect status is 403  ${resp}  

Put Admin Card Sales By Card Sale Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Put Admin Card Sales By Card Sale Id   &{kwargs}
   expect status is 403  ${resp}  

Delete Admin Card Sales By Card Sale Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Delete Admin Card Sales By Card Sale Id   &{kwargs}
   expect status is 403  ${resp}  

