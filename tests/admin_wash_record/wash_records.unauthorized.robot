Post wash_record By Id Fail Without Login
   [Documentation]  接口名:订单部分退款${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  refunds=${refunds}  
   ${unessential_params}  create list  refund_description=${refund_description}  
   run every case by params  Post admin wash records By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/refund=${wash_record_id/refund}



Patch wash_record By Id Fail Without Login
   [Documentation]  接口名:回收站恢复${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  is_deleted=False  
   ${unessential_params}  create list  
   run every case by params  Patch admin wash records By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/is_deleted=${wash_record_id/is_deleted}



Patch wash_record By Id Fail Without Login
   [Documentation]  接口名:洗车订单添加备注${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  admin_remark=${admin_remark}  
   ${unessential_params}  create list  
   run every case by params  Patch admin wash record By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id=${wash_record_id}



Patch wash_record By Id Fail Without Login
   [Documentation]  接口名:订单详情修改（车牌,手机号,名字）${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  car_id=${car_id}  mobile=${mobile}  name=${name}  
   run every case by params  Patch admin wash records By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/(car_id|mobile|name)=${wash_record_id/(car_id|mobile|name)}



Delete wash_record By Id Fail Without Login
   [Documentation]  接口名:删除洗车订单${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Delete admin wash records By Id Fail 403  wash_record_id=${wash_record_id}



Post Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post refund by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch is deleted by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch Admin wash record By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch admin wash record by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch (car id|mobile|name) by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Delete Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  delete admin wash records by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Post wash_record By Id Fail Without Login
   [Documentation]  接口名:订单部分退款${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  refunds=${refunds}  
   ${unessential_params}  create list  refund_description=${refund_description}  
   run every case by params  Post admin wash records By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/refund=${wash_record_id/refund}



Patch wash_record By Id Fail Without Login
   [Documentation]  接口名:回收站恢复${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  is_deleted=False  
   ${unessential_params}  create list  
   run every case by params  Patch admin wash records By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/is_deleted=${wash_record_id/is_deleted}



Patch wash_record By Id Fail Without Login
   [Documentation]  接口名:洗车订单添加备注${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  admin_remark=${admin_remark}  
   ${unessential_params}  create list  
   run every case by params  Patch admin wash record By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id=${wash_record_id}



Patch wash_record By Id Fail Without Login
   [Documentation]  接口名:订单详情修改（车牌,手机号,名字）${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  car_id=${car_id}  mobile=${mobile}  name=${name}  
   run every case by params  Patch admin wash records By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/(car_id|mobile|name)=${wash_record_id/(car_id|mobile|name)}



Delete wash_record By Id Fail Without Login
   [Documentation]  接口名:删除洗车订单${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Delete admin wash records By Id Fail 403  wash_record_id=${wash_record_id}



Post Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post refund by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch is deleted by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch Admin wash record By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch admin wash record by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch (car id|mobile|name) by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Delete Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  delete admin wash records by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Post wash_record By Id Fail Without Login
   [Documentation]  接口名:订单部分退款${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  refunds=${refunds}  
   ${unessential_params}  create list  refund_description=${refund_description}  
   run every case by params  Post admin wash records By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/refund=${wash_record_id/refund}



Patch wash_record By Id Fail Without Login
   [Documentation]  接口名:回收站恢复${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  is_deleted=False  
   ${unessential_params}  create list  
   run every case by params  Patch admin wash records By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/is_deleted=${wash_record_id/is_deleted}



Patch wash_record By Id Fail Without Login
   [Documentation]  接口名:洗车订单添加备注${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  admin_remark=${admin_remark}  
   ${unessential_params}  create list  
   run every case by params  Patch admin wash record By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id=${wash_record_id}



Patch wash_record By Id Fail Without Login
   [Documentation]  接口名:订单详情修改（车牌,手机号,名字）${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  car_id=${car_id}  mobile=${mobile}  name=${name}  
   run every case by params  Patch admin wash records By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/(car_id|mobile|name)=${wash_record_id/(car_id|mobile|name)}



Delete wash_record By Id Fail Without Login
   [Documentation]  接口名:删除洗车订单${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Delete admin wash records By Id Fail 403  wash_record_id=${wash_record_id}



*** Variables ***
${wash_record_id/refund}
${wash_record_id/close}
${wash_record_id}
${wash_record_id/is_deleted}
${wash_record_id/(car_id|mobile|name)}


*** Keywords ***
Post Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post refund by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch is deleted by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch Admin wash record By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch admin wash record by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch (car id|mobile|name) by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Delete Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  delete admin wash records by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Post wash_record By Id Fail Without Login
   [Documentation]  接口名:订单部分退款${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  refunds=${refunds}  
   ${unessential_params}  create list  refund_description=${refund_description}  
   run every case by params  Post admin wash records By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/refund=${wash_record_id/refund}



Patch wash_record By Id Fail Without Login
   [Documentation]  接口名:回收站恢复${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  is_deleted=False  
   ${unessential_params}  create list  
   run every case by params  Patch admin wash records By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/is_deleted=${wash_record_id/is_deleted}



Patch wash_record By Id Fail Without Login
   [Documentation]  接口名:洗车订单添加备注${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  admin_remark=${admin_remark}  
   ${unessential_params}  create list  
   run every case by params  Patch admin wash record By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id=${wash_record_id}



Patch wash_record By Id Fail Without Login
   [Documentation]  接口名:订单详情修改（车牌,手机号,名字）${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  car_id=${car_id}  mobile=${mobile}  name=${name}  
   run every case by params  Patch admin wash records By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/(car_id|mobile|name)=${wash_record_id/(car_id|mobile|name)}



Delete wash_record By Id Fail Without Login
   [Documentation]  接口名:删除洗车订单${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Delete admin wash records By Id Fail 403  wash_record_id=${wash_record_id}



Post Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post refund by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch is deleted by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch Admin wash record By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch admin wash record by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch (car id|mobile|name) by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Delete Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  delete admin wash records by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Post wash_record By Id Fail Without Login
   [Documentation]  接口名:订单部分退款${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  refunds=${refunds}  
   ${unessential_params}  create list  refund_description=${refund_description}  
   run every case by params  Post admin wash records By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/refund=${wash_record_id/refund}



Patch wash_record By Id Fail Without Login
   [Documentation]  接口名:回收站恢复${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  is_deleted=False  
   ${unessential_params}  create list  
   run every case by params  Patch admin wash records By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/is_deleted=${wash_record_id/is_deleted}



Patch wash_record By Id Fail Without Login
   [Documentation]  接口名:洗车订单添加备注${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  admin_remark=${admin_remark}  
   ${unessential_params}  create list  
   run every case by params  Patch admin wash record By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id=${wash_record_id}



Patch wash_record By Id Fail Without Login
   [Documentation]  接口名:订单详情修改（车牌,手机号,名字）${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  car_id=${car_id}  mobile=${mobile}  name=${name}  
   run every case by params  Patch admin wash records By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/(car_id|mobile|name)=${wash_record_id/(car_id|mobile|name)}



Delete wash_record By Id Fail Without Login
   [Documentation]  接口名:删除洗车订单${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Delete admin wash records By Id Fail 403  wash_record_id=${wash_record_id}



Post Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post refund by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch is deleted by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch Admin wash record By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch admin wash record by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch (car id|mobile|name) by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Delete Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  delete admin wash records by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Post wash_record By Id Fail Without Login
   [Documentation]  接口名:订单部分退款${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  refunds=${refunds}  
   ${unessential_params}  create list  refund_description=${refund_description}  
   run every case by params  Post admin wash records By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/refund=${wash_record_id/refund}



Patch wash_record By Id Fail Without Login
   [Documentation]  接口名:回收站恢复${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  is_deleted=False  
   ${unessential_params}  create list  
   run every case by params  Patch admin wash records By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/is_deleted=${wash_record_id/is_deleted}



Patch wash_record By Id Fail Without Login
   [Documentation]  接口名:洗车订单添加备注${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  admin_remark=${admin_remark}  
   ${unessential_params}  create list  
   run every case by params  Patch admin wash record By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id=${wash_record_id}



Patch wash_record By Id Fail Without Login
   [Documentation]  接口名:订单详情修改（车牌,手机号,名字）${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  car_id=${car_id}  mobile=${mobile}  name=${name}  
   run every case by params  Patch admin wash records By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/(car_id|mobile|name)=${wash_record_id/(car_id|mobile|name)}



Delete wash_record By Id Fail Without Login
   [Documentation]  接口名:删除洗车订单${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Delete admin wash records By Id Fail 403  wash_record_id=${wash_record_id}


Post Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post refund by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch is deleted by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch Admin wash record By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch admin wash record by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch (car id|mobile|name) by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Delete Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  delete admin wash records by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Post wash_record By Id Fail Without Login
   [Documentation]  接口名:订单部分退款${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  refunds=${refunds}  
   ${unessential_params}  create list  refund_description=${refund_description}  
   run every case by params  Post admin wash records By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/refund=${wash_record_id/refund}


Patch wash_record By Id Fail Without Login
   [Documentation]  接口名:回收站恢复${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  is_deleted=False  
   ${unessential_params}  create list  
   run every case by params  Patch admin wash records By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/is_deleted=${wash_record_id/is_deleted}


Patch wash_record By Id Fail Without Login
   [Documentation]  接口名:洗车订单添加备注${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  admin_remark=${admin_remark}  
   ${unessential_params}  create list  
   run every case by params  Patch admin wash record By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id=${wash_record_id}


Patch wash_record By Id Fail Without Login
   [Documentation]  接口名:订单详情修改（车牌,手机号,名字）${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  car_id=${car_id}  mobile=${mobile}  name=${name}  
   run every case by params  Patch admin wash records By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/(car_id|mobile|name)=${wash_record_id/(car_id|mobile|name)}


Delete wash_record By Id Fail Without Login
   [Documentation]  接口名:删除洗车订单${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Delete admin wash records By Id Fail 403  wash_record_id=${wash_record_id}


Post Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post refund by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch is deleted by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch Admin wash record By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch admin wash record by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch (car id|mobile|name) by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Delete Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  delete admin wash records by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Post wash_record By Id Fail Without Login
   [Documentation]  接口名:订单部分退款${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  refunds=${refunds}  
   ${unessential_params}  create list  refund_description=${refund_description}  
   run every case by params  Post admin wash records By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/refund=${wash_record_id/refund}

Patch wash_record By Id Fail Without Login
   [Documentation]  接口名:回收站恢复${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  is_deleted=False  
   ${unessential_params}  create list  
   run every case by params  Patch admin wash records By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/is_deleted=${wash_record_id/is_deleted}

Patch wash_record By Id Fail Without Login
   [Documentation]  接口名:洗车订单添加备注${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  admin_remark=${admin_remark}  
   ${unessential_params}  create list  
   run every case by params  Patch admin wash record By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id=${wash_record_id}

Patch wash_record By Id Fail Without Login
   [Documentation]  接口名:订单详情修改（车牌,手机号,名字）${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  car_id=${car_id}  mobile=${mobile}  name=${name}  
   run every case by params  Patch admin wash records By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/(car_id|mobile|name)=${wash_record_id/(car_id|mobile|name)}

Delete wash_record By Id Fail Without Login
   [Documentation]  接口名:删除洗车订单${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Delete admin wash records By Id Fail 403  wash_record_id=${wash_record_id}

Post Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post refund by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch is deleted by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch Admin wash record By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch admin wash record by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch (car id|mobile|name) by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Delete Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  delete admin wash records by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Post wash_record By Id Fail Without Login
   [Documentation]  接口名:订单部分退款${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  refunds=${refunds}  
   ${unessential_params}  create list  refund_description=${refund_description}  
   run every case by params  Post admin wash records By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/refund=${wash_record_id/refund}

Patch wash_record By Id Fail Without Login
   [Documentation]  接口名:回收站恢复${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  is_deleted=False  
   ${unessential_params}  create list  
   run every case by params  Patch admin wash records By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/is_deleted=${wash_record_id/is_deleted}

Patch wash_record By Id Fail Without Login
   [Documentation]  接口名:洗车订单添加备注${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  admin_remark=${admin_remark}  
   ${unessential_params}  create list  
   run every case by params  Patch admin wash record By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id=${wash_record_id}

Patch wash_record By Id Fail Without Login
   [Documentation]  接口名:订单详情修改（车牌,手机号,名字）${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  car_id=${car_id}  mobile=${mobile}  name=${name}  
   run every case by params  Patch admin wash records By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/(car_id|mobile|name)=${wash_record_id/(car_id|mobile|name)}

Delete wash_record By Id Fail Without Login
   [Documentation]  接口名:删除洗车订单${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Delete admin wash records By Id Fail 403  wash_record_id=${wash_record_id}

Post Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post refund by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch is deleted by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch Admin wash record By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch admin wash record by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch (car id|mobile|name) by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Delete Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  delete admin wash records by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Post wash_record By Id Fail Without Login
   [Documentation]  接口名:订单部分退款${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  refunds=${refunds}  
   ${unessential_params}  create list  refund_description=${refund_description}  
   run every case by params  Post admin wash records By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/refund=${wash_record_id/refund}

Patch wash_record By Id Fail Without Login
   [Documentation]  接口名:回收站恢复${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  is_deleted=False  
   ${unessential_params}  create list  
   run every case by params  Patch admin wash records By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/is_deleted=${wash_record_id/is_deleted}

Patch wash_record By Id Fail Without Login
   [Documentation]  接口名:洗车订单添加备注${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  admin_remark=${admin_remark}  
   ${unessential_params}  create list  
   run every case by params  Patch admin wash record By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id=${wash_record_id}

Patch wash_record By Id Fail Without Login
   [Documentation]  接口名:订单详情修改（车牌,手机号,名字）${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  car_id=${car_id}  mobile=${mobile}  name=${name}  
   run every case by params  Patch admin wash records By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/(car_id|mobile|name)=${wash_record_id/(car_id|mobile|name)}

Delete wash_record By Id Fail Without Login
   [Documentation]  接口名:删除洗车订单${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Delete admin wash records By Id Fail 403  wash_record_id=${wash_record_id}

Post Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post refund by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch is deleted by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch Admin wash record By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch admin wash record by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch (car id|mobile|name) by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Delete Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  delete admin wash records by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Post wash_record By Id Fail Without Login
   [Documentation]  接口名:订单部分退款${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  refunds=${refunds}  
   ${unessential_params}  create list  refund_description=${refund_description}  
   run every case by params  Post admin wash records By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/refund=${wash_record_id/refund}

Patch wash_record By Id Fail Without Login
   [Documentation]  接口名:回收站恢复${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  is_deleted=False  
   ${unessential_params}  create list  
   run every case by params  Patch admin wash records By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/is_deleted=${wash_record_id/is_deleted}

Patch wash_record By Id Fail Without Login
   [Documentation]  接口名:洗车订单添加备注${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  admin_remark=${admin_remark}  
   ${unessential_params}  create list  
   run every case by params  Patch admin wash record By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id=${wash_record_id}

Patch wash_record By Id Fail Without Login
   [Documentation]  接口名:订单详情修改（车牌,手机号,名字）${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  car_id=${car_id}  mobile=${mobile}  name=${name}  
   run every case by params  Patch admin wash records By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/(car_id|mobile|name)=${wash_record_id/(car_id|mobile|name)}

Delete wash_record By Id Fail Without Login
   [Documentation]  接口名:删除洗车订单${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Delete admin wash records By Id Fail 403  wash_record_id=${wash_record_id}

Post Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post refund by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch is deleted by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch Admin wash record By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch admin wash record by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch (car id|mobile|name) by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Delete Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  delete admin wash records by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Post wash_record By Id Fail Without Login
   [Documentation]  接口名:订单部分退款${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  refunds=${refunds}  
   ${unessential_params}  create list  refund_description=${refund_description}  
   run every case by params  Post admin wash records By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/refund=${wash_record_id/refund}

Patch wash_record By Id Fail Without Login
   [Documentation]  接口名:回收站恢复${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  is_deleted=False  
   ${unessential_params}  create list  
   run every case by params  Patch admin wash records By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/is_deleted=${wash_record_id/is_deleted}

Patch wash_record By Id Fail Without Login
   [Documentation]  接口名:洗车订单添加备注${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  admin_remark=${admin_remark}  
   ${unessential_params}  create list  
   run every case by params  Patch admin wash record By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id=${wash_record_id}

Patch wash_record By Id Fail Without Login
   [Documentation]  接口名:订单详情修改（车牌,手机号,名字）${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  car_id=${car_id}  mobile=${mobile}  name=${name}  
   run every case by params  Patch admin wash records By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/(car_id|mobile|name)=${wash_record_id/(car_id|mobile|name)}

Delete wash_record By Id Fail Without Login
   [Documentation]  接口名:删除洗车订单${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Delete admin wash records By Id Fail 403  wash_record_id=${wash_record_id}

Post Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post refund by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch is deleted by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch Admin wash record By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch admin wash record by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch (car id|mobile|name) by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Delete Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  delete admin wash records by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Post wash record By Id Fail Without Login
   [Documentation]  接口名:订单部分退款${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  refunds=${refunds}  
   ${unessential_params}  create list  refund_description=${refund_description}  
   run every case by params  Post admin wash records By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/refund=${wash_record_id/refund}

Patch wash record By Id Fail Without Login
   [Documentation]  接口名:回收站恢复${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  is_deleted=False  
   ${unessential_params}  create list  
   run every case by params  Patch admin wash records By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/is_deleted=${wash_record_id/is_deleted}

Patch wash record By Id Fail Without Login
   [Documentation]  接口名:洗车订单添加备注${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  admin_remark=${admin_remark}  
   ${unessential_params}  create list  
   run every case by params  Patch admin wash record By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id=${wash_record_id}

Patch wash record By Id Fail Without Login
   [Documentation]  接口名:订单详情修改（车牌,手机号,名字）${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  car_id=${car_id}  mobile=${mobile}  name=${name}  
   run every case by params  Patch admin wash records By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/(car_id|mobile|name)=${wash_record_id/(car_id|mobile|name)}

Delete wash record By Id Fail Without Login
   [Documentation]  接口名:删除洗车订单${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Delete admin wash records By Id Fail 403  wash_record_id=${wash_record_id}

Post Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post refund by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch is deleted by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch Admin wash record By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch admin wash record by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch (car id|mobile|name) by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Delete Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  delete admin wash records by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Post wash record By Id Fail Without Login
   [Documentation]  接口名:订单部分退款${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  refunds=${refunds}  
   ${unessential_params}  create list  refund_description=${refund_description}  
   run every case by params  Post admin wash records By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/refund=${wash_record_id/refund}

Patch wash record By Id Fail Without Login
   [Documentation]  接口名:回收站恢复${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  is_deleted=False  
   ${unessential_params}  create list  
   run every case by params  Patch admin wash records By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/is_deleted=${wash_record_id/is_deleted}

Patch wash record By Id Fail Without Login
   [Documentation]  接口名:洗车订单添加备注${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  admin_remark=${admin_remark}  
   ${unessential_params}  create list  
   run every case by params  Patch admin wash record By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id=${wash_record_id}

Patch wash record By Id Fail Without Login
   [Documentation]  接口名:订单详情修改（车牌,手机号,名字）${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  car_id=${car_id}  mobile=${mobile}  name=${name}  
   run every case by params  Patch admin wash records By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/(car_id|mobile|name)=${wash_record_id/(car_id|mobile|name)}

Delete wash record By Id Fail Without Login
   [Documentation]  接口名:删除洗车订单${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Delete admin wash records By Id Fail 403  wash_record_id=${wash_record_id}

Post Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post refund by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch is deleted by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch Admin wash record By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch admin wash record by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch (car id|mobile|name) by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Delete Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  delete admin wash records by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Post wash record By Id Fail Without Login
   [Documentation]  接口名:订单部分退款${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  refunds=${refunds}  
   ${unessential_params}  create list  refund_description=${refund_description}  
   run every case by params  Post admin wash records By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/refund=${wash_record_id/refund}

Patch wash record By Id Fail Without Login
   [Documentation]  接口名:回收站恢复${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  is_deleted=False  
   ${unessential_params}  create list  
   run every case by params  Patch admin wash records By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/is_deleted=${wash_record_id/is_deleted}

Patch wash record By Id Fail Without Login
   [Documentation]  接口名:洗车订单添加备注${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  admin_remark=${admin_remark}  
   ${unessential_params}  create list  
   run every case by params  Patch admin wash record By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id=${wash_record_id}

Patch wash record By Id Fail Without Login
   [Documentation]  接口名:订单详情修改（车牌,手机号,名字）${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  car_id=${car_id}  mobile=${mobile}  name=${name}  
   run every case by params  Patch admin wash records By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/(car_id|mobile|name)=${wash_record_id/(car_id|mobile|name)}

Delete wash record By Id Fail Without Login
   [Documentation]  接口名:删除洗车订单${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Delete admin wash records By Id Fail 403  wash_record_id=${wash_record_id}

Post Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post refund by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch is deleted by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch Admin wash record By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch admin wash record by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch (car id|mobile|name) by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Delete Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  delete admin wash records by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Post wash record By Id Fail Without Login
   [Documentation]  接口名:订单部分退款${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  refunds=${refunds}  
   ${unessential_params}  create list  refund_description=${refund_description}  
   run every case by params  Post admin wash records By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/refund=${wash_record_id/refund}

Patch wash record By Id Fail Without Login
   [Documentation]  接口名:回收站恢复${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  is_deleted=False  
   ${unessential_params}  create list  
   run every case by params  Patch admin wash records By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/is_deleted=${wash_record_id/is_deleted}

Patch wash record By Id Fail Without Login
   [Documentation]  接口名:洗车订单添加备注${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  admin_remark=${admin_remark}  
   ${unessential_params}  create list  
   run every case by params  Patch admin wash record By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id=${wash_record_id}

Patch wash record By Id Fail Without Login
   [Documentation]  接口名:订单详情修改（车牌,手机号,名字）${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  car_id=${car_id}  mobile=${mobile}  name=${name}  
   run every case by params  Patch admin wash records By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/(car_id|mobile|name)=${wash_record_id/(car_id|mobile|name)}

Delete wash record By Id Fail Without Login
   [Documentation]  接口名:删除洗车订单${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Delete admin wash records By Id Fail 403  wash_record_id=${wash_record_id}

Post Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post refund by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch is deleted by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch Admin wash record By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch admin wash record by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch (car id|mobile|name) by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Delete Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  delete admin wash records by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Post wash record By Id Fail Without Login
   [Documentation]  接口名:订单部分退款${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  refunds=${refunds}  
   ${unessential_params}  create list  refund_description=${refund_description}  
   run every case by params  Post Admin wash records By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/refund=${wash_record_id/refund}

Patch wash record By Id Fail Without Login
   [Documentation]  接口名:回收站恢复${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  is_deleted=False  
   ${unessential_params}  create list  
   run every case by params  Patch Admin wash records By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/is_deleted=${wash_record_id/is_deleted}

Patch wash record By Id Fail Without Login
   [Documentation]  接口名:洗车订单添加备注${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  admin_remark=${admin_remark}  
   ${unessential_params}  create list  
   run every case by params  Patch Admin wash record By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id=${wash_record_id}

Patch wash record By Id Fail Without Login
   [Documentation]  接口名:订单详情修改（车牌,手机号,名字）${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  car_id=${car_id}  mobile=${mobile}  name=${name}  
   run every case by params  Patch Admin wash records By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/(car_id|mobile|name)=${wash_record_id/(car_id|mobile|name)}

Delete wash record By Id Fail Without Login
   [Documentation]  接口名:删除洗车订单${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Delete Admin wash records By Id Fail 403  wash_record_id=${wash_record_id}

Post Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post refund by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch is deleted by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch Admin wash record By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch admin wash record by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch (car id|mobile|name) by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Delete Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  delete admin wash records by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Post wash record By Id Fail Without Login
   [Documentation]  接口名:订单部分退款${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  refunds=${refunds}  
   ${unessential_params}  create list  refund_description=${refund_description}  
   run every case by params  Post Admin wash records By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/refund=${wash_record_id/refund}

Patch wash record By Id Fail Without Login
   [Documentation]  接口名:回收站恢复${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  is_deleted=False  
   ${unessential_params}  create list  
   run every case by params  Patch Admin wash records By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/is_deleted=${wash_record_id/is_deleted}

Patch wash record By Id Fail Without Login
   [Documentation]  接口名:洗车订单添加备注${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  admin_remark=${admin_remark}  
   ${unessential_params}  create list  
   run every case by params  Patch Admin wash record By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id=${wash_record_id}

Patch wash record By Id Fail Without Login
   [Documentation]  接口名:订单详情修改（车牌,手机号,名字）${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  car_id=${car_id}  mobile=${mobile}  name=${name}  
   run every case by params  Patch Admin wash records By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/(car_id|mobile|name)=${wash_record_id/(car_id|mobile|name)}

Delete wash record By Id Fail Without Login
   [Documentation]  接口名:删除洗车订单${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Delete Admin wash records By Id Fail 403  wash_record_id=${wash_record_id}

Post Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post refund by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch is deleted by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch Admin wash record By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch admin wash record by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch (car id|mobile|name) by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Delete Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  delete admin wash records by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Post wash record By Id Fail Without Login
   [Documentation]  接口名:订单部分退款${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  refunds=${refunds}  
   ${unessential_params}  create list  refund_description=${refund_description}  
   run every case by params  Post post_refund by wash_record_id By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/refund=${wash_record_id/refund}

Patch wash record By Id Fail Without Login
   [Documentation]  接口名:回收站恢复${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  is_deleted=False  
   ${unessential_params}  create list  
   run every case by params  Patch patch_is_deleted by wash_record_id By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/is_deleted=${wash_record_id/is_deleted}

Patch wash record By Id Fail Without Login
   [Documentation]  接口名:洗车订单添加备注${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  admin_remark=${admin_remark}  
   ${unessential_params}  create list  
   run every case by params  Patch patch_admin_wash_record by wash_record_id By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id=${wash_record_id}

Patch wash record By Id Fail Without Login
   [Documentation]  接口名:订单详情修改（车牌,手机号,名字）${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  car_id=${car_id}  mobile=${mobile}  name=${name}  
   run every case by params  Patch patch_(car_id|mobile|name) by wash_record_id By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/(car_id|mobile|name)=${wash_record_id/(car_id|mobile|name)}

Delete wash record By Id Fail Without Login
   [Documentation]  接口名:删除洗车订单${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Delete delete_admin_wash_records by wash_record_id By Id Fail 403  wash_record_id=${wash_record_id}

Post Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post refund by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch is deleted by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch Admin wash record By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch admin wash record by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch (car id|mobile|name) by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Delete Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  delete admin wash records by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Post wash record By Id Fail Without Login
   [Documentation]  接口名:订单部分退款${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  refunds=${refunds}  
   ${unessential_params}  create list  refund_description=${refund_description}  
   run every case by params  Post post_refund by wash_record_id By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/refund=${wash_record_id/refund}

Patch wash record By Id Fail Without Login
   [Documentation]  接口名:回收站恢复${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  is_deleted=False  
   ${unessential_params}  create list  
   run every case by params  Patch patch_is_deleted by wash_record_id By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/is_deleted=${wash_record_id/is_deleted}

Patch wash record By Id Fail Without Login
   [Documentation]  接口名:洗车订单添加备注${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  admin_remark=${admin_remark}  
   ${unessential_params}  create list  
   run every case by params  Patch patch_admin wash_record by wash_record_id By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id=${wash_record_id}

Patch wash record By Id Fail Without Login
   [Documentation]  接口名:订单详情修改（车牌,手机号,名字）${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  car_id=${car_id}  mobile=${mobile}  name=${name}  
   run every case by params  Patch patch_(car_id|mobile|name) by wash_record_id By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/(car_id|mobile|name)=${wash_record_id/(car_id|mobile|name)}

Delete wash record By Id Fail Without Login
   [Documentation]  接口名:删除洗车订单${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Delete delete_admin wash_records by wash_record_id By Id Fail 403  wash_record_id=${wash_record_id}

Post Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post refund by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch is deleted by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch Admin wash record By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch admin wash record by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch (car id|mobile|name) by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Delete Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  delete admin wash records by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Post wash record By Id Fail Without Login
   [Documentation]  接口名:订单部分退款${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  refunds=${refunds}  
   ${unessential_params}  create list  refund_description=${refund_description}  
   run every case by params  Post post refund by wash_record_id By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/refund=${wash_record_id/refund}

Patch wash record By Id Fail Without Login
   [Documentation]  接口名:回收站恢复${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  is_deleted=False  
   ${unessential_params}  create list  
   run every case by params  Patch patch is_deleted by wash_record_id By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/is_deleted=${wash_record_id/is_deleted}

Patch wash record By Id Fail Without Login
   [Documentation]  接口名:洗车订单添加备注${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  admin_remark=${admin_remark}  
   ${unessential_params}  create list  
   run every case by params  Patch patch admin wash_record by wash_record_id By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id=${wash_record_id}

Patch wash record By Id Fail Without Login
   [Documentation]  接口名:订单详情修改（车牌,手机号,名字）${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  car_id=${car_id}  mobile=${mobile}  name=${name}  
   run every case by params  Patch patch (car_id|mobile|name) by wash_record_id By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/(car_id|mobile|name)=${wash_record_id/(car_id|mobile|name)}

Delete wash record By Id Fail Without Login
   [Documentation]  接口名:删除洗车订单${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Delete delete admin wash_records by wash_record_id By Id Fail 403  wash_record_id=${wash_record_id}

Post Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post refund by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch is deleted by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch Admin wash record By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch admin wash record by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch (car id|mobile|name) by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Delete Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  delete admin wash records by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Post wash record By Id Fail Without Login
   [Documentation]  接口名:订单部分退款${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  refunds=${refunds}  
   ${unessential_params}  create list  refund_description=${refund_description}  
   run every case by params  Post post refund by wash_record_id By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/refund=${wash_record_id/refund}

Patch wash record By Id Fail Without Login
   [Documentation]  接口名:回收站恢复${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  is_deleted=False  
   ${unessential_params}  create list  
   run every case by params  Patch patch is_deleted by wash_record_id By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/is_deleted=${wash_record_id/is_deleted}

Patch wash record By Id Fail Without Login
   [Documentation]  接口名:洗车订单添加备注${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  admin_remark=${admin_remark}  
   ${unessential_params}  create list  
   run every case by params  Patch patch admin wash_record by wash_record_id By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id=${wash_record_id}

Patch wash record By Id Fail Without Login
   [Documentation]  接口名:订单详情修改（车牌,手机号,名字）${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  car_id=${car_id}  mobile=${mobile}  name=${name}  
   run every case by params  Patch patch (car_id|mobile|name) by wash_record_id By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/(car_id|mobile|name)=${wash_record_id/(car_id|mobile|name)}

Delete wash record By Id Fail Without Login
   [Documentation]  接口名:删除洗车订单${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Delete delete admin wash_records by wash_record_id By Id Fail 403  wash_record_id=${wash_record_id}

Post Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post refund by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch is deleted by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch Admin wash record By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch admin wash record by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch (car id|mobile|name) by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Delete Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  delete admin wash records by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Post wash record By Id Fail Without Login
   [Documentation]  接口名:订单部分退款${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  refunds=${refunds}  
   ${unessential_params}  create list  refund_description=${refund_description}  
   run every case by params  Post post refund by wash_record_id By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/refund=${wash_record_id/refund}

Patch wash record By Id Fail Without Login
   [Documentation]  接口名:回收站恢复${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  is_deleted=False  
   ${unessential_params}  create list  
   run every case by params  Patch patch is_deleted by wash_record_id By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/is_deleted=${wash_record_id/is_deleted}

Patch wash record By Id Fail Without Login
   [Documentation]  接口名:洗车订单添加备注${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  admin_remark=${admin_remark}  
   ${unessential_params}  create list  
   run every case by params  Patch patch admin wash_record by wash_record_id By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id=${wash_record_id}

Patch wash record By Id Fail Without Login
   [Documentation]  接口名:订单详情修改（车牌,手机号,名字）${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  car_id=${car_id}  mobile=${mobile}  name=${name}  
   run every case by params  Patch patch (car_id|mobile|name) by wash_record_id By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/(car_id|mobile|name)=${wash_record_id/(car_id|mobile|name)}

Delete wash record By Id Fail Without Login
   [Documentation]  接口名:删除洗车订单${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Delete delete admin wash_records by wash_record_id By Id Fail 403  wash_record_id=${wash_record_id}

Post Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post refund by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch is deleted by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch Admin wash record By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch admin wash record by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch (car id|mobile|name) by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Delete Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  delete admin wash records by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Post wash record By Id Fail Without Login
   [Documentation]  接口名:订单部分退款${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  refunds=${refunds}  
   ${unessential_params}  create list  refund_description=${refund_description}  
   run every case by params  Post post refund by wash_record_id By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/refund=${wash_record_id/refund}

Patch wash record By Id Fail Without Login
   [Documentation]  接口名:回收站恢复${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  is_deleted=False  
   ${unessential_params}  create list  
   run every case by params  Patch patch is_deleted by wash_record_id By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/is_deleted=${wash_record_id/is_deleted}

Patch wash record By Id Fail Without Login
   [Documentation]  接口名:洗车订单添加备注${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  admin_remark=${admin_remark}  
   ${unessential_params}  create list  
   run every case by params  Patch patch admin wash record by wash_record_id By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id=${wash_record_id}

Patch wash record By Id Fail Without Login
   [Documentation]  接口名:订单详情修改（车牌,手机号,名字）${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  car_id=${car_id}  mobile=${mobile}  name=${name}  
   run every case by params  Patch patch (car_id|mobile|name) by wash_record_id By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/(car_id|mobile|name)=${wash_record_id/(car_id|mobile|name)}

Delete wash record By Id Fail Without Login
   [Documentation]  接口名:删除洗车订单${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Delete delete admin wash records by wash_record_id By Id Fail 403  wash_record_id=${wash_record_id}

Post Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post refund by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch is deleted by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch Admin wash record By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch admin wash record by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch (car id|mobile|name) by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Delete Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  delete admin wash records by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Post wash record By Id Fail Without Login
   [Documentation]  接口名:订单部分退款${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  refunds=${refunds}  
   ${unessential_params}  create list  refund_description=${refund_description}  
   run every case by params  Post post refund by wash_record_id By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/refund=${wash_record_id/refund}

Patch wash record By Id Fail Without Login
   [Documentation]  接口名:回收站恢复${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  is_deleted=False  
   ${unessential_params}  create list  
   run every case by params  Patch patch is_deleted by wash_record_id By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/is_deleted=${wash_record_id/is_deleted}

Patch wash record By Id Fail Without Login
   [Documentation]  接口名:洗车订单添加备注${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  admin_remark=${admin_remark}  
   ${unessential_params}  create list  
   run every case by params  Patch patch admin wash record by wash_record_id By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id=${wash_record_id}

Patch wash record By Id Fail Without Login
   [Documentation]  接口名:订单详情修改（车牌,手机号,名字）${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  car_id=${car_id}  mobile=${mobile}  name=${name}  
   run every case by params  Patch patch (car_id|mobile|name) by wash_record_id By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/(car_id|mobile|name)=${wash_record_id/(car_id|mobile|name)}

Delete wash record By Id Fail Without Login
   [Documentation]  接口名:删除洗车订单${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Delete delete admin wash records by wash_record_id By Id Fail 403  wash_record_id=${wash_record_id}

Post Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post refund by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch is deleted by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch Admin wash record By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch admin wash record by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch (car id|mobile|name) by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Delete Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  delete admin wash records by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Post wash record By Id Fail Without Login
   [Documentation]  接口名:订单部分退款${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  refunds=${refunds}  
   ${unessential_params}  create list  refund_description=${refund_description}  
   run every case by params  Post post refund by wash record id By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/refund=${wash_record_id/refund}

Patch wash record By Id Fail Without Login
   [Documentation]  接口名:回收站恢复${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  is_deleted=False  
   ${unessential_params}  create list  
   run every case by params  Patch patch is_deleted by wash record id By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/is_deleted=${wash_record_id/is_deleted}

Patch wash record By Id Fail Without Login
   [Documentation]  接口名:洗车订单添加备注${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  admin_remark=${admin_remark}  
   ${unessential_params}  create list  
   run every case by params  Patch patch admin wash record by wash record id By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id=${wash_record_id}

Patch wash record By Id Fail Without Login
   [Documentation]  接口名:订单详情修改（车牌,手机号,名字）${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  car_id=${car_id}  mobile=${mobile}  name=${name}  
   run every case by params  Patch patch (car_id|mobile|name) by wash record id By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/(car_id|mobile|name)=${wash_record_id/(car_id|mobile|name)}

Delete wash record By Id Fail Without Login
   [Documentation]  接口名:删除洗车订单${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Delete delete admin wash records by wash record id By Id Fail 403  wash_record_id=${wash_record_id}

Post Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post refund by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch is deleted by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch Admin wash record By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch admin wash record by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch (car id|mobile|name) by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Delete Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  delete admin wash records by wash record id  &{kwargs}
   expect status is 403  ${resp}  

post refund by wash record id
   [Documentation]  接口名:订单部分退款${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  refunds=${refunds}  
   ${unessential_params}  create list  refund_description=${refund_description}  
   run every case by params  Post post refund by wash record id By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/refund=${wash_record_id/refund}

patch is_deleted by wash record id
   [Documentation]  接口名:回收站恢复${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  is_deleted=False  
   ${unessential_params}  create list  
   run every case by params  Patch patch is_deleted by wash record id By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/is_deleted=${wash_record_id/is_deleted}

patch admin wash record by wash record id
   [Documentation]  接口名:洗车订单添加备注${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  admin_remark=${admin_remark}  
   ${unessential_params}  create list  
   run every case by params  Patch patch admin wash record by wash record id By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id=${wash_record_id}

patch (car_id|mobile|name) by wash record id
   [Documentation]  接口名:订单详情修改（车牌,手机号,名字）${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  car_id=${car_id}  mobile=${mobile}  name=${name}  
   run every case by params  Patch patch (car_id|mobile|name) by wash record id By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/(car_id|mobile|name)=${wash_record_id/(car_id|mobile|name)}

delete admin wash records by wash record id
   [Documentation]  接口名:删除洗车订单${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Delete delete admin wash records by wash record id By Id Fail 403  wash_record_id=${wash_record_id}

Post Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post refund by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch is deleted by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch Admin wash record By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch admin wash record by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch (car id|mobile|name) by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Delete Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  delete admin wash records by wash record id  &{kwargs}
   expect status is 403  ${resp}  

post refund by wash record idFail Without Login
   [Documentation]  接口名:订单部分退款${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  refunds=${refunds}  
   ${unessential_params}  create list  refund_description=${refund_description}  
   run every case by params  Post post refund by wash record id By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/refund=${wash_record_id/refund}

patch is_deleted by wash record idFail Without Login
   [Documentation]  接口名:回收站恢复${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  is_deleted=False  
   ${unessential_params}  create list  
   run every case by params  Patch patch is_deleted by wash record id By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/is_deleted=${wash_record_id/is_deleted}

patch admin wash record by wash record idFail Without Login
   [Documentation]  接口名:洗车订单添加备注${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  admin_remark=${admin_remark}  
   ${unessential_params}  create list  
   run every case by params  Patch patch admin wash record by wash record id By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id=${wash_record_id}

patch (car_id|mobile|name) by wash record idFail Without Login
   [Documentation]  接口名:订单详情修改（车牌,手机号,名字）${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  car_id=${car_id}  mobile=${mobile}  name=${name}  
   run every case by params  Patch patch (car_id|mobile|name) by wash record id By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/(car_id|mobile|name)=${wash_record_id/(car_id|mobile|name)}

delete admin wash records by wash record idFail Without Login
   [Documentation]  接口名:删除洗车订单${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Delete delete admin wash records by wash record id By Id Fail 403  wash_record_id=${wash_record_id}

Post Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post refund by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch is deleted by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch Admin wash record By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch admin wash record by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch (car id|mobile|name) by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Delete Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  delete admin wash records by wash record id  &{kwargs}
   expect status is 403  ${resp}  

post refund by wash record id Fail Without Login
   [Documentation]  接口名:订单部分退款${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  refunds=${refunds}  
   ${unessential_params}  create list  refund_description=${refund_description}  
   run every case by params  Post post refund by wash record id By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/refund=${wash_record_id/refund}

patch is_deleted by wash record id Fail Without Login
   [Documentation]  接口名:回收站恢复${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  is_deleted=False  
   ${unessential_params}  create list  
   run every case by params  Patch patch is_deleted by wash record id By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/is_deleted=${wash_record_id/is_deleted}

patch admin wash record by wash record id Fail Without Login
   [Documentation]  接口名:洗车订单添加备注${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  admin_remark=${admin_remark}  
   ${unessential_params}  create list  
   run every case by params  Patch patch admin wash record by wash record id By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id=${wash_record_id}

patch (car_id|mobile|name) by wash record id Fail Without Login
   [Documentation]  接口名:订单详情修改（车牌,手机号,名字）${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  car_id=${car_id}  mobile=${mobile}  name=${name}  
   run every case by params  Patch patch (car_id|mobile|name) by wash record id By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/(car_id|mobile|name)=${wash_record_id/(car_id|mobile|name)}

delete admin wash records by wash record id Fail Without Login
   [Documentation]  接口名:删除洗车订单${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Delete delete admin wash records by wash record id By Id Fail 403  wash_record_id=${wash_record_id}

Post Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post refund by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch is deleted by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch Admin wash record By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch admin wash record by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch (car id|mobile|name) by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Delete Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  delete admin wash records by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Post refund by wash record id Fail Without Login
   [Documentation]  接口名:订单部分退款${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  refunds=${refunds}  
   ${unessential_params}  create list  refund_description=${refund_description}  
   run every case by params  Post Post refund by wash record id By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/refund=${wash_record_id/refund}

Patch isDeleted by wash record id Fail Without Login
   [Documentation]  接口名:回收站恢复${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  is_deleted=False  
   ${unessential_params}  create list  
   run every case by params  Patch Patch isDeleted by wash record id By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/is_deleted=${wash_record_id/is_deleted}

Patch admin wash record by wash record id Fail Without Login
   [Documentation]  接口名:洗车订单添加备注${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  admin_remark=${admin_remark}  
   ${unessential_params}  create list  
   run every case by params  Patch Patch admin wash record by wash record id By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id=${wash_record_id}

Patch (carId|mobile|name) by wash record id Fail Without Login
   [Documentation]  接口名:订单详情修改（车牌,手机号,名字）${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  car_id=${car_id}  mobile=${mobile}  name=${name}  
   run every case by params  Patch Patch (carId|mobile|name) by wash record id By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/(car_id|mobile|name)=${wash_record_id/(car_id|mobile|name)}

Delete admin wash records by wash record id Fail Without Login
   [Documentation]  接口名:删除洗车订单${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Delete Delete admin wash records by wash record id By Id Fail 403  wash_record_id=${wash_record_id}

Post Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post refund by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch is deleted by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch Admin wash record By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch admin wash record by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch (car id|mobile|name) by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Delete Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  delete admin wash records by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Post refund by wash record id Fail Without Login
   [Documentation]  接口名:订单部分退款${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  refunds=${refunds}  
   ${unessential_params}  create list  refund_description=${refund_description}  
   run every case by params  Post Post refund by wash record id By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/refund=${wash_record_id/refund}

Patch isDeleted by wash record id Fail Without Login
   [Documentation]  接口名:回收站恢复${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  is_deleted=False  
   ${unessential_params}  create list  
   run every case by params  Patch Patch isDeleted by wash record id By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/is_deleted=${wash_record_id/is_deleted}

Patch admin wash record by wash record id Fail Without Login
   [Documentation]  接口名:洗车订单添加备注${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  admin_remark=${admin_remark}  
   ${unessential_params}  create list  
   run every case by params  Patch Patch admin wash record by wash record id By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id=${wash_record_id}

Patch (carId|mobile|name) by wash record id Fail Without Login
   [Documentation]  接口名:订单详情修改（车牌,手机号,名字）${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  car_id=${car_id}  mobile=${mobile}  name=${name}  
   run every case by params  Patch Patch (carId|mobile|name) by wash record id By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/(car_id|mobile|name)=${wash_record_id/(car_id|mobile|name)}

Delete admin wash records by wash record id Fail Without Login
   [Documentation]  接口名:删除洗车订单${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Delete Delete admin wash records by wash record id By Id Fail 403  wash_record_id=${wash_record_id}

Post Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post refund by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch is deleted by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch Admin wash record By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch admin wash record by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch (car id|mobile|name) by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Delete Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  delete admin wash records by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Post refund by wash record id Fail Without Login
   [Documentation]  接口名:订单部分退款${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  refunds=${refunds}  
   ${unessential_params}  create list  refund_description=${refund_description}  
   run every case by params  Post Post refund by wash record id By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/refund=${wash_record_id/refund}

Patch isDeleted by wash record id Fail Without Login
   [Documentation]  接口名:回收站恢复${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  is_deleted=False  
   ${unessential_params}  create list  
   run every case by params  Patch Patch isDeleted by wash record id By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/is_deleted=${wash_record_id/is_deleted}

Patch admin wash record by wash record id Fail Without Login
   [Documentation]  接口名:洗车订单添加备注${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  admin_remark=${admin_remark}  
   ${unessential_params}  create list  
   run every case by params  Patch Patch admin wash record by wash record id By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id=${wash_record_id}

Patch (carId|mobile|name) by wash record id Fail Without Login
   [Documentation]  接口名:订单详情修改（车牌,手机号,名字）${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  car_id=${car_id}  mobile=${mobile}  name=${name}  
   run every case by params  Patch Patch (carId|mobile|name) by wash record id By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/(car_id|mobile|name)=${wash_record_id/(car_id|mobile|name)}

Delete admin wash records by wash record id Fail Without Login
   [Documentation]  接口名:删除洗车订单${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Delete Delete admin wash records by wash record id By Id Fail 403  wash_record_id=${wash_record_id}

Post Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post refund by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch is deleted by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch Admin wash record By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch admin wash record by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch (car id|mobile|name) by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Delete Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  delete admin wash records by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Post refund by wash record id Fail Without Login
   [Documentation]  接口名:订单部分退款${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  refunds=${refunds}  
   ${unessential_params}  create list  refund_description=${refund_description}  
   run every case by params  Post Post refund by wash record id By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/refund=${wash_record_id/refund}

Patch isDeleted by wash record id Fail Without Login
   [Documentation]  接口名:回收站恢复${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  is_deleted=False  
   ${unessential_params}  create list  
   run every case by params  Patch Patch isDeleted by wash record id By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/is_deleted=${wash_record_id/is_deleted}

Patch admin wash record by wash record id Fail Without Login
   [Documentation]  接口名:洗车订单添加备注${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  admin_remark=${admin_remark}  
   ${unessential_params}  create list  
   run every case by params  Patch Patch admin wash record by wash record id By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id=${wash_record_id}

Patch (carId|mobile|name) by wash record id Fail Without Login
   [Documentation]  接口名:订单详情修改（车牌,手机号,名字）${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  car_id=${car_id}  mobile=${mobile}  name=${name}  
   run every case by params  Patch Patch (carId|mobile|name) by wash record id By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/(car_id|mobile|name)=${wash_record_id/(car_id|mobile|name)}

Delete admin wash records by wash record id Fail Without Login
   [Documentation]  接口名:删除洗车订单${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Delete Delete admin wash records by wash record id By Id Fail 403  wash_record_id=${wash_record_id}

Post Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post refund by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch is deleted by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch Admin wash record By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch admin wash record by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch (car id|mobile|name) by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Delete Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  delete admin wash records by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Post refund by wash record id Fail Without Login
   [Documentation]  接口名:订单部分退款${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  refunds=${refunds}  
   ${unessential_params}  create list  refund_description=${refund_description}  
   run every case by params  Post Post refund by wash record id By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/refund=${wash_record_id/refund}

Patch isDeleted by wash record id Fail Without Login
   [Documentation]  接口名:回收站恢复${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  is_deleted=False  
   ${unessential_params}  create list  
   run every case by params  Patch Patch isDeleted by wash record id By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/is_deleted=${wash_record_id/is_deleted}

Patch admin wash record by wash record id Fail Without Login
   [Documentation]  接口名:洗车订单添加备注${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  admin_remark=${admin_remark}  
   ${unessential_params}  create list  
   run every case by params  Patch Patch admin wash record by wash record id By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id=${wash_record_id}

Patch (carId|mobile|name) by wash record id Fail Without Login
   [Documentation]  接口名:订单详情修改（车牌,手机号,名字）${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  car_id=${car_id}  mobile=${mobile}  name=${name}  
   run every case by params  Patch Patch (carId|mobile|name) by wash record id By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/(car_id|mobile|name)=${wash_record_id/(car_id|mobile|name)}

Delete admin wash records by wash record id Fail Without Login
   [Documentation]  接口名:删除洗车订单${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Delete Delete admin wash records by wash record id By Id Fail 403  wash_record_id=${wash_record_id}

Post Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post refund by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch is deleted by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch Admin wash record By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch admin wash record by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch (car id|mobile|name) by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Delete Admin wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  delete admin wash records by wash record id  &{kwargs}
   expect status is 403  ${resp}  

PostRefundByWashRecordId Fail Without Login
   [Documentation]  接口名:订单部分退款${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  refunds=${refunds}  
   ${unessential_params}  create list  refund_description=${refund_description}  
   run every case by params  Post PostRefundByWashRecordId By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/refund=${wash_record_id/refund}

Patch isDeleted by wash record id Fail Without Login
   [Documentation]  接口名:回收站恢复${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  is_deleted=False  
   ${unessential_params}  create list  
   run every case by params  Patch Patch isDeleted by wash record id By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/is_deleted=${wash_record_id/is_deleted}

PatchAdminWashRecordByWashRecordId Fail Without Login
   [Documentation]  接口名:洗车订单添加备注${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  admin_remark=${admin_remark}  
   ${unessential_params}  create list  
   run every case by params  Patch PatchAdminWashRecordByWashRecordId By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id=${wash_record_id}

Patch (carId|mobile|name) by wash record id Fail Without Login
   [Documentation]  接口名:订单详情修改（车牌,手机号,名字）${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  car_id=${car_id}  mobile=${mobile}  name=${name}  
   run every case by params  Patch Patch (carId|mobile|name) by wash record id By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/(car_id|mobile|name)=${wash_record_id/(car_id|mobile|name)}

DeleteAdminWashRecordsByWashRecordId Fail Without Login
   [Documentation]  接口名:删除洗车订单${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Delete DeleteAdminWashRecordsByWashRecordId By Id Fail 403  wash_record_id=${wash_record_id}

Post AdminWashRecords By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post refund by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch AdminWashRecords By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch is deleted by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch AdminWashRecord By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch adminwashrecord by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch AdminWashRecords By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch (car id|mobile|name) by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Delete AdminWashRecords By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  delete adminwashrecords by wash record id  &{kwargs}
   expect status is 403  ${resp}  

PostRefundByWashRecordId Fail Without Login
   [Documentation]  接口名:订单部分退款${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  refunds=${refunds}  
   ${unessential_params}  create list  refund_description=${refund_description}  
   run every case by params  Post PostRefundByWashRecordId By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/refund=${wash_record_id/refund}

Patch isDeleted by wash record id Fail Without Login
   [Documentation]  接口名:回收站恢复${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  is_deleted=False  
   ${unessential_params}  create list  
   run every case by params  Patch Patch isDeleted by wash record id By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/is_deleted=${wash_record_id/is_deleted}

PatchAdminWashRecordByWashRecordId Fail Without Login
   [Documentation]  接口名:洗车订单添加备注${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  admin_remark=${admin_remark}  
   ${unessential_params}  create list  
   run every case by params  Patch PatchAdminWashRecordByWashRecordId By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id=${wash_record_id}

Patch (carId|mobile|name) by wash record id Fail Without Login
   [Documentation]  接口名:订单详情修改（车牌,手机号,名字）${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  car_id=${car_id}  mobile=${mobile}  name=${name}  
   run every case by params  Patch Patch (carId|mobile|name) by wash record id By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/(car_id|mobile|name)=${wash_record_id/(car_id|mobile|name)}

DeleteAdminWashRecordsByWashRecordId Fail Without Login
   [Documentation]  接口名:删除洗车订单${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Delete DeleteAdminWashRecordsByWashRecordId By Id Fail 403  wash_record_id=${wash_record_id}

Post AdminWashRecords By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post refund by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch AdminWashRecords By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch is deleted by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch AdminWashRecord By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch adminwashrecord by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch AdminWashRecords By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch (car id|mobile|name) by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Delete AdminWashRecords By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  delete adminwashrecords by wash record id  &{kwargs}
   expect status is 403  ${resp}  

PostRefundByWashRecordId Fail Without Login
   [Documentation]  接口名:订单部分退款${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  refunds=${refunds}  
   ${unessential_params}  create list  refund_description=${refund_description}  
   run every case by params  Post PostRefundByWashRecordId By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/refund=${wash_record_id/refund}

Patch isDeleted by wash record id Fail Without Login
   [Documentation]  接口名:回收站恢复${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  is_deleted=False  
   ${unessential_params}  create list  
   run every case by params  Patch Patch isDeleted by wash record id By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/is_deleted=${wash_record_id/is_deleted}

PatchAdminWashRecordByWashRecordId Fail Without Login
   [Documentation]  接口名:洗车订单添加备注${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  admin_remark=${admin_remark}  
   ${unessential_params}  create list  
   run every case by params  Patch PatchAdminWashRecordByWashRecordId By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id=${wash_record_id}

Patch (carId|mobile|name) by wash record id Fail Without Login
   [Documentation]  接口名:订单详情修改（车牌,手机号,名字）${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  car_id=${car_id}  mobile=${mobile}  name=${name}  
   run every case by params  Patch Patch (carId|mobile|name) by wash record id By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/(car_id|mobile|name)=${wash_record_id/(car_id|mobile|name)}

DeleteAdminWashRecordsByWashRecordId Fail Without Login
   [Documentation]  接口名:删除洗车订单${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Delete DeleteAdminWashRecordsByWashRecordId By Id Fail 403  wash_record_id=${wash_record_id}

Post AdminWashRecords By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post refund by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch AdminWashRecords By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch is deleted by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch AdminWashRecord By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch adminwashrecord by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch AdminWashRecords By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch (car id|mobile|name) by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Delete AdminWashRecords By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  delete adminwashrecords by wash record id  &{kwargs}
   expect status is 403  ${resp}  

P ostR efundB yW ashR ecordI d Fail Without Login
   [Documentation]  接口名:订单部分退款${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  refunds=${refunds}  
   ${unessential_params}  create list  refund_description=${refund_description}  
   run every case by params  Post P ostR efundB yW ashR ecordI d By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/refund=${wash_record_id/refund}

P atch isD eleted by wash record id Fail Without Login
   [Documentation]  接口名:回收站恢复${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  is_deleted=False  
   ${unessential_params}  create list  
   run every case by params  Patch P atch isD eleted by wash record id By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/is_deleted=${wash_record_id/is_deleted}

P atchA dminW ashR ecordB yW ashR ecordI d Fail Without Login
   [Documentation]  接口名:洗车订单添加备注${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  admin_remark=${admin_remark}  
   ${unessential_params}  create list  
   run every case by params  Patch P atchA dminW ashR ecordB yW ashR ecordI d By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id=${wash_record_id}

P atch (carI d|mobile|name) by wash record id Fail Without Login
   [Documentation]  接口名:订单详情修改（车牌,手机号,名字）${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  car_id=${car_id}  mobile=${mobile}  name=${name}  
   run every case by params  Patch P atch (carI d|mobile|name) by wash record id By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/(car_id|mobile|name)=${wash_record_id/(car_id|mobile|name)}

D eleteA dminW ashR ecordsB yW ashR ecordI d Fail Without Login
   [Documentation]  接口名:删除洗车订单${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Delete D eleteA dminW ashR ecordsB yW ashR ecordI d By Id Fail 403  wash_record_id=${wash_record_id}

Post AdminWashRecords By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post refund by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch AdminWashRecords By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch is deleted by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch AdminWashRecord By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch adminwashrecord by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch AdminWashRecords By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch (car id|mobile|name) by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Delete AdminWashRecords By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  delete adminwashrecords by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Post Refund By Wash Record Id  Fail Without Login
   [Documentation]  接口名:订单部分退款${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  refunds=${refunds}  
   ${unessential_params}  create list  refund_description=${refund_description}  
   run every case by params  Post Post Refund By Wash Record Id  By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/refund=${wash_record_id/refund}

Patch is Deleted by wash record id  Fail Without Login
   [Documentation]  接口名:回收站恢复${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  is_deleted=False  
   ${unessential_params}  create list  
   run every case by params  Patch Patch is Deleted by wash record id  By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/is_deleted=${wash_record_id/is_deleted}

Patch Admin Wash Record By Wash Record Id  Fail Without Login
   [Documentation]  接口名:洗车订单添加备注${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  admin_remark=${admin_remark}  
   ${unessential_params}  create list  
   run every case by params  Patch Patch Admin Wash Record By Wash Record Id  By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id=${wash_record_id}

Patch (car Id|mobile|name) by wash record id  Fail Without Login
   [Documentation]  接口名:订单详情修改（车牌,手机号,名字）${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  car_id=${car_id}  mobile=${mobile}  name=${name}  
   run every case by params  Patch Patch (car Id|mobile|name) by wash record id  By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/(car_id|mobile|name)=${wash_record_id/(car_id|mobile|name)}

Delete Admin Wash Records By Wash Record Id  Fail Without Login
   [Documentation]  接口名:删除洗车订单${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Delete Delete Admin Wash Records By Wash Record Id  By Id Fail 403  wash_record_id=${wash_record_id}

Post AdminWashRecords By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post refund by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch AdminWashRecords By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch is deleted by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch AdminWashRecord By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch adminwashrecord by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch AdminWashRecords By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch (car id|mobile|name) by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Delete AdminWashRecords By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  delete adminwashrecords by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Post Refund By Wash Record Id Fail Without Login
   [Documentation]  接口名:订单部分退款${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  refunds=${refunds}  
   ${unessential_params}  create list  refund_description=${refund_description}  
   run every case by params  Post Post Refund By Wash Record Id  By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/refund=${wash_record_id/refund}

Patch is Deleted by wash record id Fail Without Login
   [Documentation]  接口名:回收站恢复${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  is_deleted=False  
   ${unessential_params}  create list  
   run every case by params  Patch Patch is Deleted by wash record id  By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/is_deleted=${wash_record_id/is_deleted}

Patch Admin Wash Record By Wash Record Id Fail Without Login
   [Documentation]  接口名:洗车订单添加备注${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  admin_remark=${admin_remark}  
   ${unessential_params}  create list  
   run every case by params  Patch Patch Admin Wash Record By Wash Record Id  By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id=${wash_record_id}

Patch (car Id|mobile|name) by wash record id Fail Without Login
   [Documentation]  接口名:订单详情修改（车牌,手机号,名字）${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  car_id=${car_id}  mobile=${mobile}  name=${name}  
   run every case by params  Patch Patch (car Id|mobile|name) by wash record id  By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/(car_id|mobile|name)=${wash_record_id/(car_id|mobile|name)}

Delete Admin Wash Records By Wash Record Id Fail Without Login
   [Documentation]  接口名:删除洗车订单${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Delete Delete Admin Wash Records By Wash Record Id  By Id Fail 403  wash_record_id=${wash_record_id}

Post AdminWashRecords By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post refund by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch AdminWashRecords By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch is deleted by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch AdminWashRecord By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch adminwashrecord by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch AdminWashRecords By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch (car id|mobile|name) by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Delete AdminWashRecords By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  delete adminwashrecords by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Post Refund By Wash Record Id Fail Without Login
   [Documentation]  接口名:订单部分退款${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  refunds=${refunds}  
   ${unessential_params}  create list  refund_description=${refund_description}  
   run every case by params  Post Refund By Wash Record Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/refund=${wash_record_id/refund}

Patch is Deleted by wash record id Fail Without Login
   [Documentation]  接口名:回收站恢复${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  is_deleted=False  
   ${unessential_params}  create list  
   run every case by params  Patch is Deleted by wash record id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/is_deleted=${wash_record_id/is_deleted}

Patch Admin Wash Record By Wash Record Id Fail Without Login
   [Documentation]  接口名:洗车订单添加备注${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  admin_remark=${admin_remark}  
   ${unessential_params}  create list  
   run every case by params  Patch Admin Wash Record By Wash Record Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id=${wash_record_id}

Patch (car Id|mobile|name) by wash record id Fail Without Login
   [Documentation]  接口名:订单详情修改（车牌,手机号,名字）${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  car_id=${car_id}  mobile=${mobile}  name=${name}  
   run every case by params  Patch (car Id|mobile|name) by wash record id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/(car_id|mobile|name)=${wash_record_id/(car_id|mobile|name)}

Delete Admin Wash Records By Wash Record Id Fail Without Login
   [Documentation]  接口名:删除洗车订单${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Delete Admin Wash Records By Wash Record Id Fail 403  wash_record_id=${wash_record_id}

Post AdminWashRecords By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post refund by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch AdminWashRecords By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch is deleted by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch AdminWashRecord By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch adminwashrecord by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch AdminWashRecords By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch (car id|mobile|name) by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Delete AdminWashRecords By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  delete adminwashrecords by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Post Refund By Wash Record Id Fail Without Login
   [Documentation]  接口名:订单部分退款${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  refunds=${refunds}  
   ${unessential_params}  create list  refund_description=${refund_description}  
   run every case by params  Post Refund By Wash Record Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/refund=${wash_record_id/refund}

Patch is Deleted by wash record id Fail Without Login
   [Documentation]  接口名:回收站恢复${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  is_deleted=False  
   ${unessential_params}  create list  
   run every case by params  Patch is Deleted by wash record id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/is_deleted=${wash_record_id/is_deleted}

Patch Admin Wash Record By Wash Record Id Fail Without Login
   [Documentation]  接口名:洗车订单添加备注${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  admin_remark=${admin_remark}  
   ${unessential_params}  create list  
   run every case by params  Patch Admin Wash Record By Wash Record Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id=${wash_record_id}

Patch (car Id|mobile|name) by wash record id Fail Without Login
   [Documentation]  接口名:订单详情修改（车牌,手机号,名字）${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  car_id=${car_id}  mobile=${mobile}  name=${name}  
   run every case by params  Patch (car Id|mobile|name) by wash record id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/(car_id|mobile|name)=${wash_record_id/(car_id|mobile|name)}

Delete Admin Wash Records By Wash Record Id Fail Without Login
   [Documentation]  接口名:删除洗车订单${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Delete Admin Wash Records By Wash Record Id Fail 403  wash_record_id=${wash_record_id}

Post Refund By Wash Record Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Post Refund By Wash Record Id   &{kwargs}
   expect status is 403  ${resp}  

Patch is Deleted by wash record id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Patch is Deleted by wash record id   &{kwargs}
   expect status is 403  ${resp}  

Patch Admin Wash Record By Wash Record Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Patch Admin Wash Record By Wash Record Id   &{kwargs}
   expect status is 403  ${resp}  

Patch (car Id|mobile|name) by wash record id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Patch (car Id|mobile|name) by wash record id   &{kwargs}
   expect status is 403  ${resp}  

Delete Admin Wash Records By Wash Record Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Delete Admin Wash Records By Wash Record Id   &{kwargs}
   expect status is 403  ${resp}  

Post Refund By Wash Record Id Fail Without Login
   [Documentation]  接口名:订单部分退款${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  refunds=${refunds}  
   ${unessential_params}  create list  refund_description=${refund_description}  
   run every case by params  Post Refund By Wash Record Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/refund=${wash_record_id/refund}

Patch is Deleted by wash record id Fail Without Login
   [Documentation]  接口名:回收站恢复${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  is_deleted=False  
   ${unessential_params}  create list  
   run every case by params  Patch is Deleted by wash record id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/is_deleted=${wash_record_id/is_deleted}

Patch Admin Wash Record By Wash Record Id Fail Without Login
   [Documentation]  接口名:洗车订单添加备注${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  admin_remark=${admin_remark}  
   ${unessential_params}  create list  
   run every case by params  Patch Admin Wash Record By Wash Record Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id=${wash_record_id}

Patch (car Id|mobile|name) by wash record id Fail Without Login
   [Documentation]  接口名:订单详情修改（车牌,手机号,名字）${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  car_id=${car_id}  mobile=${mobile}  name=${name}  
   run every case by params  Patch (car Id|mobile|name) by wash record id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/(car_id|mobile|name)=${wash_record_id/(car_id|mobile|name)}

Delete Admin Wash Records By Wash Record Id Fail Without Login
   [Documentation]  接口名:删除洗车订单${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Delete Admin Wash Records By Wash Record Id Fail 403  wash_record_id=${wash_record_id}

Post Refund By Wash Record Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Post Refund By Wash Record Id   &{kwargs}
   expect status is 403  ${resp}  

Patch is Deleted by wash record id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Patch is Deleted by wash record id   &{kwargs}
   expect status is 403  ${resp}  

Patch Admin Wash Record By Wash Record Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Patch Admin Wash Record By Wash Record Id   &{kwargs}
   expect status is 403  ${resp}  

Patch (car Id|mobile|name) by wash record id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Patch (car Id|mobile|name) by wash record id   &{kwargs}
   expect status is 403  ${resp}  

Delete Admin Wash Records By Wash Record Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Delete Admin Wash Records By Wash Record Id   &{kwargs}
   expect status is 403  ${resp}  

Post Refund By Wash Record Id Fail Without Login
   [Documentation]  接口名:订单部分退款${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  refunds=${refunds}  
   ${unessential_params}  create list  refund_description=${refund_description}  
   run every case by params  Post Refund By Wash Record Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/refund=${wash_record_id/refund}

Patch is Deleted by wash record id Fail Without Login
   [Documentation]  接口名:回收站恢复${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  is_deleted=False  
   ${unessential_params}  create list  
   run every case by params  Patch is Deleted by wash record id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/is_deleted=${wash_record_id/is_deleted}

Patch Admin Wash Record By Wash Record Id Fail Without Login
   [Documentation]  接口名:洗车订单添加备注${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  admin_remark=${admin_remark}  
   ${unessential_params}  create list  
   run every case by params  Patch Admin Wash Record By Wash Record Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id=${wash_record_id}

Patch (car Id|mobile|name) by wash record id Fail Without Login
   [Documentation]  接口名:订单详情修改（车牌,手机号,名字）${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  car_id=${car_id}  mobile=${mobile}  name=${name}  
   run every case by params  Patch (car Id|mobile|name) by wash record id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/(car_id|mobile|name)=${wash_record_id/(car_id|mobile|name)}

Delete Admin Wash Records By Wash Record Id Fail Without Login
   [Documentation]  接口名:删除洗车订单${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Delete Admin Wash Records By Wash Record Id Fail 403  wash_record_id=${wash_record_id}

Post Refund By Wash Record Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Post Refund By Wash Record Id   &{kwargs}
   expect status is 403  ${resp}  

Patch is Deleted by wash record id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Patch is Deleted by wash record id   &{kwargs}
   expect status is 403  ${resp}  

Patch Admin Wash Record By Wash Record Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Patch Admin Wash Record By Wash Record Id   &{kwargs}
   expect status is 403  ${resp}  

Patch (car Id|mobile|name) by wash record id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Patch (car Id|mobile|name) by wash record id   &{kwargs}
   expect status is 403  ${resp}  

Delete Admin Wash Records By Wash Record Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Delete Admin Wash Records By Wash Record Id   &{kwargs}
   expect status is 403  ${resp}  

