*** Settings ***
Documentation  app_wash_record
Resource  ../resources.robot
Library  robot_car_wash_app_library.wash_record.WashRecordLibrary
Force Tags  model:app_wash_record  虾客APP


*** Test Cases ***
Post Update By Wash Record Id Fail Without Login
   [Documentation]  接口名:智能更新订单${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  status=${status}  
   ${unessential_params}  create list  before_wash_images=${before_wash_images}  after_wash_images=${after_wash_images}  wash_tags=${wash_tags}  description=${description}  start_time=${start_time}  end_time=${end_time}  dirty_percent=${dirty_percent}  washer_remark=${washer_remark}  mark=${mark}  
   run every case by params  Post Update By Wash Record Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/update=${wash_record_id/update}

Post upload Mark by wash record id Fail Without Login
   [Documentation]  接口名:上传洗车备注及标记${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  washer_remark=${washer_remark}  mark=${mark}  
   run every case by params  Post upload Mark by wash record id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/upload_mark=${wash_record_id/upload_mark}

Post Upload By Wash Record Id Fail Without Login
   [Documentation]  接口名:上传洗车记录${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  before_wash_images=${before_wash_images}  status=${status}  after_wash_images=${after_wash_images}  start_time=${start_time}  end_time=${end_time}  dirty_percent=${dirty_percent}  
   ${unessential_params}  create list  tags=${Please_input}  description=${description}  
   run every case by params  Post Upload By Wash Record Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/upload=${wash_record_id/upload}

Post Wash By Wash Record Id Fail Without Login
   [Documentation]  接口名:洗车${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  before_wash_images=${before_wash_images}  
   ${unessential_params}  create list  tags=${Please_input}  description=${description}  
   run every case by params  Post Wash By Wash Record Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/wash=${wash_record_id/wash}

Post Finish By Wash Record Id Fail Without Login
   [Documentation]  接口名:完成洗车${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  after_wash_images=${after_wash_images}  
   ${unessential_params}  create list  
   run every case by params  Post Finish By Wash Record Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/finish=${wash_record_id/finish}

Get User Wash Records Fail Without Login
   [Documentation]  接口名:获取虾克历史订单列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  section=${section}  page_limit=${page_limit}  
   run every case by params  Get User Wash Records Fail 403  ${essential_params}  ${unessential_params}

Get Cars In Parking Fail Without Login
   [Documentation]  接口名:车牌号批量获取在场状态${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  car_ids=${car_ids}  
   ${unessential_params}  create list  parking_id=${parking_id}  
   run every case by params  Get Cars In Parking Fail 403  ${essential_params}  ${unessential_params}

Get wash Records group by zone Fail Without Login
   [Documentation]  接口名:洗车记录按停车场区进行分组${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  status=${status}  wash_area_id=${wash_area_id}  
   ${unessential_params}  create list  parking_id=${parking_id}  
   run every case by params  Get wash Records group by zone Fail 403  ${essential_params}  ${unessential_params}

Get wash Records nearby Fail Without Login
   [Documentation]  接口名:洗车记录根据距离排序${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  radius=${radius}  center=${center}  status=${status}  limit=${limit}  wash_area_id=${wash_area_id}  
   ${unessential_params}  create list  
   run every case by params  Get wash Records nearby Fail 403  ${essential_params}  ${unessential_params}

Get car Wash wash records Fail Without Login
   [Documentation]  接口名:获取洗车记录列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  status=${status}  car_id=${car_id}  wash_group_id=${wash_group_id}  section=${section}  page_limit=${page_limit}  wash_area_id=${wash_area_id}  order_by=${order_by}  floor=${floor}  zone=${zone}  
   run every case by params  Get car Wash wash records Fail 403  ${essential_params}  ${unessential_params}

Get car Wash wash records by wash record id Fail Without Login
   [Documentation]  接口名:获取单个洗车记录${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Get car Wash wash records by wash record id Fail 403  wash_record_id=${wash_record_id}

Get Car In Parking Fail Without Login
   [Documentation]  接口名:查询车辆是否在场内${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  car_id=${car_id}  
   ${unessential_params}  create list  parking_id=${parking_id}  
   run every case by params  Get Car In Parking Fail 403  ${essential_params}  ${unessential_params}

Patch washer Remark by wash record id Fail Without Login
   [Documentation]  接口名:备注${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  washer_remark=${washer_remark}  
   run every case by params  Patch washer Remark by wash record id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/washer_remark=${wash_record_id/washer_remark}

Patch Mark By Wash Record Id Fail Without Login
   [Documentation]  接口名:标记${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  mark=${mark}  
   run every case by params  Patch Mark By Wash Record Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/mark=${wash_record_id/mark}

Patch Status By Wash Record Id Fail Without Login
   [Documentation]  接口名:修改单个洗车记录状态${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  status=${status}  
   ${unessential_params}  create list  
   run every case by params  Patch Status By Wash Record Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/status=${wash_record_id/status}


*** Variables ***
${wash_record_id/update}
${wash_record_id/upload_mark}
${wash_record_id/upload}
${wash_record_id/wash}
${wash_record_id/finish}
${wash_record_id}
${wash_record_id/washer_remark}
${wash_record_id/mark}
${wash_record_id/status}


*** Keywords ***
Post Update By Wash Record Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Post Update By Wash Record Id   &{kwargs}
   expect status is 403  ${resp}  

Post upload Mark by wash record id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Post upload Mark by wash record id   &{kwargs}
   expect status is 403  ${resp}  

Post Upload By Wash Record Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Post Upload By Wash Record Id   &{kwargs}
   expect status is 403  ${resp}  

Post Wash By Wash Record Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Post Wash By Wash Record Id   &{kwargs}
   expect status is 403  ${resp}  

Post Finish By Wash Record Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Post Finish By Wash Record Id   &{kwargs}
   expect status is 403  ${resp}  

Get User Wash Records Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get User Wash Records   &{kwargs}
   expect status is 403  ${resp}  

Get Cars In Parking Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get Cars In Parking   &{kwargs}
   expect status is 403  ${resp}  

Get wash Records group by zone Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get wash Records group by zone   &{kwargs}
   expect status is 403  ${resp}  

Get wash Records nearby Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get wash Records nearby   &{kwargs}
   expect status is 403  ${resp}  

Get car Wash wash records Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get car Wash wash records   &{kwargs}
   expect status is 403  ${resp}  

Get car Wash wash records by wash record id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get car Wash wash records by wash record id   &{kwargs}
   expect status is 403  ${resp}  

Get Car In Parking Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get Car In Parking   &{kwargs}
   expect status is 403  ${resp}  

Patch washer Remark by wash record id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Patch washer Remark by wash record id   &{kwargs}
   expect status is 403  ${resp}  

Patch Mark By Wash Record Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Patch Mark By Wash Record Id   &{kwargs}
   expect status is 403  ${resp}  

Patch Status By Wash Record Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Patch Status By Wash Record Id   &{kwargs}
   expect status is 403  ${resp}  

