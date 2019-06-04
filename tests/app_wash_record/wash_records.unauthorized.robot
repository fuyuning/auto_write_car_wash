*** Settings ***
Documentation  app_wash_record
Resource  ../resources.robot
Library  robot_washing_expert_library.wash_record.WashRecordLibrary
Force Tags  model:app_wash_record  虾客APP


*** Test Cases ***
post car wash wash records update by wash record id Fail Without Login
   [Documentation]  接口名:智能更新订单${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   post car wash wash records update by wash record id fail 403     wash_record_id=${wash_record_id}  status=${status}    before_wash_images=${before_wash_images}  after_wash_images=${after_wash_images}  wash_tags=${wash_tags}  description=${description}  start_time=${start_time}  end_time=${end_time}  dirty_percent=${dirty_percent}  washer_remark=${washer_remark}  mark=${mark}  

post car wash wash records upload mark by wash record id Fail Without Login
   [Documentation]  接口名:上传洗车备注及标记${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   post car wash wash records upload mark by wash record id fail 403     wash_record_id=${wash_record_id}    washer_remark=${washer_remark}  mark=${mark}  

post car wash wash records upload by wash record id Fail Without Login
   [Documentation]  接口名:上传洗车记录${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   post car wash wash records upload by wash record id fail 403     wash_record_id=${wash_record_id}  before_wash_images=${before_wash_images}  status=${status}  after_wash_images=${after_wash_images}  start_time=${start_time}  end_time=${end_time}  dirty_percent=${dirty_percent}    tags=${Please_input}  description=${description}  

post car wash wash records wash by wash record id Fail Without Login
   [Documentation]  接口名:洗车${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   post car wash wash records wash by wash record id fail 403     wash_record_id=${wash_record_id}  before_wash_images=${before_wash_images}    tags=${Please_input}  description=${description}  dirty_percent=${dirty_percent}  

post car wash wash records finish by wash record id Fail Without Login
   [Documentation]  接口名:完成洗车${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   post car wash wash records finish by wash record id fail 403     wash_record_id=${wash_record_id}  after_wash_images=${after_wash_images}    

get car wash wash records today Fail Without Login
   [Documentation]  接口名:获取洗车记录列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get car wash wash records today fail 403     status=${status}  car_id=${car_id}  wash_group_id=${wash_group_id}  section=${section}  page_limit=${page_limit}  wash_area_id=${wash_area_id}  parking_id=${parking_id}  order_by=${order_by}  phase=${phase}  floor=${floor}  zone=${zone}  

get car wash user wash records Fail Without Login
   [Documentation]  接口名:获取虾克历史订单列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get car wash user wash records fail 403     time_point=${time_point}  section=${section}  page_limit=${page_limit}  

get car wash cars in parking Fail Without Login
   [Documentation]  接口名:车牌号批量获取在场状态${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get car wash cars in parking fail 403   car_ids=${car_ids}    parking_id=${parking_id}  

get car wash wash records group by zone Fail Without Login
   [Documentation]  接口名:洗车记录按停车场区进行分组${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get car wash wash records group by zone fail 403   status=${status}  wash_area_id=${wash_area_id}    parking_id=${parking_id}  

get car wash wash records nearby Fail Without Login
   [Documentation]  接口名:洗车记录根据距离排序${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get car wash wash records nearby fail 403   radius=${radius}  center=${center}  status=${status}  limit=${limit}  wash_area_id=${wash_area_id}    

get car wash wash records Fail Without Login
   [Documentation]  接口名:获取洗车记录列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get car wash wash records fail 403     status=${status}  car_id=${car_id}  wash_group_id=${wash_group_id}  section=${section}  page_limit=${page_limit}  wash_area_id=${wash_area_id}  order_by=${order_by}  floor=${floor}  zone=${zone}  

get car wash wash record by wash record id Fail Without Login
   [Documentation]  接口名:获取单个洗车记录${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get car wash wash record by wash record id fail 403     wash_record_id=${wash_record_id}

get car wash car in parking Fail Without Login
   [Documentation]  接口名:查询车辆是否在场内${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get car wash car in parking fail 403   car_id=${car_id}    parking_id=${parking_id}  

patch car wash wash records washer remark by wash record id Fail Without Login
   [Documentation]  接口名:备注${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   patch car wash wash records washer remark by wash record id fail 403     wash_record_id=${wash_record_id}    washer_remark=${washer_remark}  

patch car wash wash records mark by wash record id Fail Without Login
   [Documentation]  接口名:标记${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   patch car wash wash records mark by wash record id fail 403     wash_record_id=${wash_record_id}    mark=${mark}  

patch car wash wash records status by wash record id Fail Without Login
   [Documentation]  接口名:修改单个洗车记录状态${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   patch car wash wash records status by wash record id fail 403     wash_record_id=${wash_record_id}  status=${status}    


*** Variables ***
${wash_record_id}  1a2b3c4d5e6f7zz


*** Keywords ***
post car wash wash records update by wash record id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post car wash wash records update by wash record id  &{kwargs}
   expect status is 403  ${resp}  

post car wash wash records upload mark by wash record id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post car wash wash records upload mark by wash record id  &{kwargs}
   expect status is 403  ${resp}  

post car wash wash records upload by wash record id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post car wash wash records upload by wash record id  &{kwargs}
   expect status is 403  ${resp}  

post car wash wash records wash by wash record id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post car wash wash records wash by wash record id  &{kwargs}
   expect status is 403  ${resp}  

post car wash wash records finish by wash record id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post car wash wash records finish by wash record id  &{kwargs}
   expect status is 403  ${resp}  

get car wash wash records today Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get car wash wash records today  &{kwargs}
   expect status is 403  ${resp}  

get car wash user wash records Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get car wash user wash records  &{kwargs}
   expect status is 403  ${resp}  

get car wash cars in parking Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get car wash cars in parking  &{kwargs}
   expect status is 403  ${resp}  

get car wash wash records group by zone Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get car wash wash records group by zone  &{kwargs}
   expect status is 403  ${resp}  

get car wash wash records nearby Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get car wash wash records nearby  &{kwargs}
   expect status is 403  ${resp}  

get car wash wash records Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get car wash wash records  &{kwargs}
   expect status is 403  ${resp}  

get car wash wash record by wash record id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get car wash wash record by wash record id  &{kwargs}
   expect status is 403  ${resp}  

get car wash car in parking Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get car wash car in parking  &{kwargs}
   expect status is 403  ${resp}  

patch car wash wash records washer remark by wash record id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch car wash wash records washer remark by wash record id  &{kwargs}
   expect status is 403  ${resp}  

patch car wash wash records mark by wash record id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch car wash wash records mark by wash record id  &{kwargs}
   expect status is 403  ${resp}  

patch car wash wash records status by wash record id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch car wash wash records status by wash record id  &{kwargs}
   expect status is 403  ${resp}  

