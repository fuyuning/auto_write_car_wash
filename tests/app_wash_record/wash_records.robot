*** Settings ***
Documentation  app_wash_record
Resource  ../resources.robot
Library  robot_car_wash_app_library.wash_record.WashRecordLibrary
Suite Setup  Login  ${app_username}  ${app_password}
Force Tags  model:app_wash_record  虾客APP


*** Test Cases ***
Post Update By Wash Record Id Fail With Wrong Url
   [Documentation]  接口名:智能更新订单${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  status=${status}  
   ${unessential_params}  create list  before_wash_images=${before_wash_images}  after_wash_images=${after_wash_images}  wash_tags=${wash_tags}  description=${description}  start_time=${start_time}  end_time=${end_time}  dirty_percent=${dirty_percent}  washer_remark=${washer_remark}  mark=${mark}  
   run every case by params  Post Update By Wash Record Id Fail 404  ${essential_params}  ${unessential_params}  wash_record_id/update=${wrong_url_id}

Post Update By Wash Record Id Success 
   [Documentation]  接口名:智能更新订单${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 201,返回的Json数据符合验证。
   [Tags]           Respcode:201
   ${essential_params}  create list  status=${status}  
   ${unessential_params}  create list  before_wash_images=${before_wash_images}  after_wash_images=${after_wash_images}  wash_tags=${wash_tags}  description=${description}  start_time=${start_time}  end_time=${end_time}  dirty_percent=${dirty_percent}  washer_remark=${washer_remark}  mark=${mark}  
   run every case by params  Post Update By Wash Record Id Success 201  ${essential_params}  ${unessential_params}  wash_record_id/update=${wash_record_id/update}

Post Update By Wash Record Id Fail With Wrong Params
   [Documentation]  接口名:智能更新订单${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  status=${status_422}  
   ${unessential_params}  create list  before_wash_images=${before_wash_images_422}  after_wash_images=${after_wash_images_422}  wash_tags=${wash_tags_422}  description=${description_422}  start_time=${start_time_422}  end_time=${end_time_422}  dirty_percent=${dirty_percent_422}  washer_remark=${washer_remark_422}  mark=${mark_422}  
   run every case by params  Post Update By Wash Record Id Fail 422  ${essential_params}  ${unessential_params}  wash_record_id/update=${wash_record_id/update}

Post upload Mark by wash record id Fail With Wrong Url
   [Documentation]  接口名:上传洗车备注及标记${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  
   ${unessential_params}  create list  washer_remark=${washer_remark}  mark=${mark}  
   run every case by params  Post upload Mark by wash record id Fail 404  ${essential_params}  ${unessential_params}  wash_record_id/upload_mark=${wrong_url_id}

Post upload Mark by wash record id Success 
   [Documentation]  接口名:上传洗车备注及标记${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 201,返回的Json数据符合验证。
   [Tags]           Respcode:201
   ${essential_params}  create list  
   ${unessential_params}  create list  washer_remark=${washer_remark}  mark=${mark}  
   run every case by params  Post upload Mark by wash record id Success 201  ${essential_params}  ${unessential_params}  wash_record_id/upload_mark=${wash_record_id/upload_mark}

Post upload Mark by wash record id Fail With Wrong Params
   [Documentation]  接口名:上传洗车备注及标记${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  washer_remark=${washer_remark_422}  mark=${mark_422}  
   run every case by params  Post upload Mark by wash record id Fail 422  ${essential_params}  ${unessential_params}  wash_record_id/upload_mark=${wash_record_id/upload_mark}

Post Upload By Wash Record Id Fail With Wrong Url
   [Documentation]  接口名:上传洗车记录${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  before_wash_images=${before_wash_images}  status=${status}  after_wash_images=${after_wash_images}  start_time=${start_time}  end_time=${end_time}  dirty_percent=${dirty_percent}  
   ${unessential_params}  create list  tags=${Please_input}  description=${description}  
   run every case by params  Post Upload By Wash Record Id Fail 404  ${essential_params}  ${unessential_params}  wash_record_id/upload=${wrong_url_id}

Post Upload By Wash Record Id Success 
   [Documentation]  接口名:上传洗车记录${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 201,返回的Json数据符合验证。
   [Tags]           Respcode:201
   ${essential_params}  create list  before_wash_images=${before_wash_images}  status=${status}  after_wash_images=${after_wash_images}  start_time=${start_time}  end_time=${end_time}  dirty_percent=${dirty_percent}  
   ${unessential_params}  create list  tags=${Please_input}  description=${description}  
   run every case by params  Post Upload By Wash Record Id Success 201  ${essential_params}  ${unessential_params}  wash_record_id/upload=${wash_record_id/upload}

Post Upload By Wash Record Id Fail With Wrong Params
   [Documentation]  接口名:上传洗车记录${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  before_wash_images=${before_wash_images_422}  status=${status_422}  after_wash_images=${after_wash_images_422}  start_time=${start_time_422}  end_time=${end_time_422}  dirty_percent=${dirty_percent_422}  
   ${unessential_params}  create list  tags=${Please_input}  description=${description_422}  
   run every case by params  Post Upload By Wash Record Id Fail 422  ${essential_params}  ${unessential_params}  wash_record_id/upload=${wash_record_id/upload}

Post Wash By Wash Record Id Fail With Wrong Url
   [Documentation]  接口名:洗车${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  before_wash_images=${before_wash_images}  
   ${unessential_params}  create list  tags=${Please_input}  description=${description}  
   run every case by params  Post Wash By Wash Record Id Fail 404  ${essential_params}  ${unessential_params}  wash_record_id/wash=${wrong_url_id}

Post Wash By Wash Record Id Success 
   [Documentation]  接口名:洗车${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 201,返回的Json数据符合验证。
   [Tags]           Respcode:201
   ${essential_params}  create list  before_wash_images=${before_wash_images}  
   ${unessential_params}  create list  tags=${Please_input}  description=${description}  
   run every case by params  Post Wash By Wash Record Id Success 201  ${essential_params}  ${unessential_params}  wash_record_id/wash=${wash_record_id/wash}

Post Wash By Wash Record Id Fail With Wrong Params
   [Documentation]  接口名:洗车${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  before_wash_images=${before_wash_images_422}  
   ${unessential_params}  create list  tags=${Please_input}  description=${description_422}  
   run every case by params  Post Wash By Wash Record Id Fail 422  ${essential_params}  ${unessential_params}  wash_record_id/wash=${wash_record_id/wash}

Post Finish By Wash Record Id Fail With Wrong Url
   [Documentation]  接口名:完成洗车${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  after_wash_images=${after_wash_images}  
   ${unessential_params}  create list  
   run every case by params  Post Finish By Wash Record Id Fail 404  ${essential_params}  ${unessential_params}  wash_record_id/finish=${wrong_url_id}

Post Finish By Wash Record Id Success 
   [Documentation]  接口名:完成洗车${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create list  after_wash_images=${after_wash_images}  
   ${unessential_params}  create list  
   run every case by params  Post Finish By Wash Record Id Success 204  ${essential_params}  ${unessential_params}  wash_record_id/finish=${wash_record_id/finish}

Post Finish By Wash Record Id Fail With Wrong Params
   [Documentation]  接口名:完成洗车${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  after_wash_images=${after_wash_images_422}  
   ${unessential_params}  create list  
   run every case by params  Post Finish By Wash Record Id Fail 422  ${essential_params}  ${unessential_params}  wash_record_id/finish=${wash_record_id/finish}

Get User Wash Records Success 
   [Documentation]  接口名:获取虾克历史订单列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 WashRecord 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  
   ${unessential_params}  create list  section=${section}  page_limit=${page_limit}  
   run every case by params  Get User Wash Records Success 200  ${essential_params}  ${unessential_params}

Get User Wash Records Fail With Wrong Params
   [Documentation]  接口名:获取虾克历史订单列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  section=${section_422}  page_limit=${page_limit_422}  
   run every case by params  Get User Wash Records Fail 422  ${essential_params}  ${unessential_params}

Get Cars In Parking Success 
   [Documentation]  接口名:车牌号批量获取在场状态${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为  列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  car_ids=${car_ids}  
   ${unessential_params}  create list  parking_id=${parking_id}  
   run every case by params  Get Cars In Parking Success 200  ${essential_params}  ${unessential_params}

Get Cars In Parking Fail With Wrong Params
   [Documentation]  接口名:车牌号批量获取在场状态${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  car_ids=${car_ids_422}  
   ${unessential_params}  create list  parking_id=${parking_id_422}  
   run every case by params  Get Cars In Parking Fail 422  ${essential_params}  ${unessential_params}

Get wash Records group by zone Success 
   [Documentation]  接口名:洗车记录按停车场区进行分组${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为  列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  status=${status}  wash_area_id=${wash_area_id}  
   ${unessential_params}  create list  parking_id=${parking_id}  
   run every case by params  Get wash Records group by zone Success 200  ${essential_params}  ${unessential_params}

Get wash Records group by zone Fail With Wrong Params
   [Documentation]  接口名:洗车记录按停车场区进行分组${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  status=${status_422}  wash_area_id=${wash_area_id_422}  
   ${unessential_params}  create list  parking_id=${parking_id_422}  
   run every case by params  Get wash Records group by zone Fail 422  ${essential_params}  ${unessential_params}

Get wash Records nearby Success 
   [Documentation]  接口名:洗车记录根据距离排序${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 WashRecord 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  radius=${radius}  center=${center}  status=${status}  limit=${limit}  wash_area_id=${wash_area_id}  
   ${unessential_params}  create list  
   run every case by params  Get wash Records nearby Success 200  ${essential_params}  ${unessential_params}

Get wash Records nearby Fail With Wrong Params
   [Documentation]  接口名:洗车记录根据距离排序${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  radius=${radius_422}  center=${center_422}  status=${status_422}  limit=${limit_422}  wash_area_id=${wash_area_id_422}  
   ${unessential_params}  create list  
   run every case by params  Get wash Records nearby Fail 422  ${essential_params}  ${unessential_params}

Get car Wash wash records Success 
   [Documentation]  接口名:获取洗车记录列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 WashRecord 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  
   ${unessential_params}  create list  status=${status}  car_id=${car_id}  wash_group_id=${wash_group_id}  section=${section}  page_limit=${page_limit}  wash_area_id=${wash_area_id}  order_by=${order_by}  floor=${floor}  zone=${zone}  
   run every case by params  Get car Wash wash records Success 200  ${essential_params}  ${unessential_params}

Get car Wash wash records Fail With Wrong Params
   [Documentation]  接口名:获取洗车记录列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  status=${status_422}  car_id=${car_id_422}  wash_group_id=${wash_group_id_422}  section=${section_422}  page_limit=${page_limit_422}  wash_area_id=${wash_area_id_422}  order_by=${order_by_422}  floor=${floor_422}  zone=${zone_422}  
   run every case by params  Get car Wash wash records Fail 422  ${essential_params}  ${unessential_params}

Get car Wash wash records by wash record id Fail With Wrong Url
   [Documentation]  接口名:获取单个洗车记录${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   Get car Wash wash records by wash record id Fail 404  wash_record_id=${wrong_url_id}

Get car Wash wash records by wash record id Success 
   [Documentation]  接口名:获取单个洗车记录${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 WashRecord 对象。
   [Tags]           Respcode:200
   Get car Wash wash records by wash record id Success 200  wash_record_id=${wash_record_id}

Get Car In Parking Success 
   [Documentation]  接口名:查询车辆是否在场内${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为  列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  car_id=${car_id}  
   ${unessential_params}  create list  parking_id=${parking_id}  
   run every case by params  Get Car In Parking Success 200  ${essential_params}  ${unessential_params}

Get Car In Parking Fail With Wrong Params
   [Documentation]  接口名:查询车辆是否在场内${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  car_id=${car_id_422}  
   ${unessential_params}  create list  parking_id=${parking_id_422}  
   run every case by params  Get Car In Parking Fail 422  ${essential_params}  ${unessential_params}

Patch washer Remark by wash record id Success 
   [Documentation]  接口名:备注${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create list  
   ${unessential_params}  create list  washer_remark=${washer_remark}  
   run every case by params  Patch washer Remark by wash record id Success 204  ${essential_params}  ${unessential_params}  wash_record_id/washer_remark=${wash_record_id/washer_remark}

Patch washer Remark by wash record id Fail With Wrong Url
   [Documentation]  接口名:备注${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  
   ${unessential_params}  create list  washer_remark=${washer_remark}  
   run every case by params  Patch washer Remark by wash record id Fail 404  ${essential_params}  ${unessential_params}  wash_record_id/washer_remark=${wrong_url_id}

Patch washer Remark by wash record id Fail With Wrong Params
   [Documentation]  接口名:备注${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  washer_remark=${washer_remark_422}  
   run every case by params  Patch washer Remark by wash record id Fail 422  ${essential_params}  ${unessential_params}  wash_record_id/washer_remark=${wash_record_id/washer_remark}

Patch Mark By Wash Record Id Success 
   [Documentation]  接口名:标记${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create list  
   ${unessential_params}  create list  mark=${mark}  
   run every case by params  Patch Mark By Wash Record Id Success 204  ${essential_params}  ${unessential_params}  wash_record_id/mark=${wash_record_id/mark}

Patch Mark By Wash Record Id Fail With Wrong Url
   [Documentation]  接口名:标记${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  
   ${unessential_params}  create list  mark=${mark}  
   run every case by params  Patch Mark By Wash Record Id Fail 404  ${essential_params}  ${unessential_params}  wash_record_id/mark=${wrong_url_id}

Patch Mark By Wash Record Id Fail With Wrong Params
   [Documentation]  接口名:标记${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  mark=${mark_422}  
   run every case by params  Patch Mark By Wash Record Id Fail 422  ${essential_params}  ${unessential_params}  wash_record_id/mark=${wash_record_id/mark}

Patch Status By Wash Record Id Fail With Wrong Url
   [Documentation]  接口名:修改单个洗车记录状态${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  status=${status}  
   ${unessential_params}  create list  
   run every case by params  Patch Status By Wash Record Id Fail 404  ${essential_params}  ${unessential_params}  wash_record_id/status=${wrong_url_id}

Patch Status By Wash Record Id Success 
   [Documentation]  接口名:修改单个洗车记录状态${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 WashRecord 对象。
   [Tags]           Respcode:200
   ${essential_params}  create list  status=${status}  
   ${unessential_params}  create list  
   run every case by params  Patch Status By Wash Record Id Success 200  ${essential_params}  ${unessential_params}  wash_record_id/status=${wash_record_id/status}

Patch Status By Wash Record Id Fail With Wrong Params
   [Documentation]  接口名:修改单个洗车记录状态${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  status=${status_422}  
   ${unessential_params}  create list  
   run every case by params  Patch Status By Wash Record Id Fail 422  ${essential_params}  ${unessential_params}  wash_record_id/status=${wash_record_id/status}


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
Post Update By Wash Record Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  Post Update By Wash Record Id   &{kwargs}
   expect status is 404  ${resp}  

Post Update By Wash Record Id Success 201
   [Arguments]  &{kwargs}
   ${resp}=  Post Update By Wash Record Id   &{kwargs}
   expect status is 201  ${resp}  app_wash_record/Post_Update_By_Wash_Record_Id_201.json
   ${wash_record_id/update}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id/update]}
   set global variable   ${wash_record_id/update}
   ${wash_record_id/upload_mark}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id/upload_mark]}
   set global variable   ${wash_record_id/upload_mark}
   ${wash_record_id/upload}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id/upload]}
   set global variable   ${wash_record_id/upload}
   ${wash_record_id/wash}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id/wash]}
   set global variable   ${wash_record_id/wash}
   ${wash_record_id/finish}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id/finish]}
   set global variable   ${wash_record_id/finish}
   ${wash_record_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id]}
   set global variable   ${wash_record_id}
   ${wash_record_id/washer_remark}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id/washer_remark]}
   set global variable   ${wash_record_id/washer_remark}
   ${wash_record_id/mark}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id/mark]}
   set global variable   ${wash_record_id/mark}
   ${wash_record_id/status}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id/status]}
   set global variable   ${wash_record_id/status}

Post Update By Wash Record Id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Post Update By Wash Record Id   &{kwargs}
   expect status is 422  ${resp}  

Post upload Mark by wash record id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  Post upload Mark by wash record id   &{kwargs}
   expect status is 404  ${resp}  

Post upload Mark by wash record id Success 201
   [Arguments]  &{kwargs}
   ${resp}=  Post upload Mark by wash record id   &{kwargs}
   expect status is 201  ${resp}  app_wash_record/Post_upload_Mark_by_wash_record_id_201.json
   ${wash_record_id/update}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id/update]}
   set global variable   ${wash_record_id/update}
   ${wash_record_id/upload_mark}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id/upload_mark]}
   set global variable   ${wash_record_id/upload_mark}
   ${wash_record_id/upload}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id/upload]}
   set global variable   ${wash_record_id/upload}
   ${wash_record_id/wash}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id/wash]}
   set global variable   ${wash_record_id/wash}
   ${wash_record_id/finish}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id/finish]}
   set global variable   ${wash_record_id/finish}
   ${wash_record_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id]}
   set global variable   ${wash_record_id}
   ${wash_record_id/washer_remark}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id/washer_remark]}
   set global variable   ${wash_record_id/washer_remark}
   ${wash_record_id/mark}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id/mark]}
   set global variable   ${wash_record_id/mark}
   ${wash_record_id/status}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id/status]}
   set global variable   ${wash_record_id/status}

Post upload Mark by wash record id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Post upload Mark by wash record id   &{kwargs}
   expect status is 422  ${resp}  

Post Upload By Wash Record Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  Post Upload By Wash Record Id   &{kwargs}
   expect status is 404  ${resp}  

Post Upload By Wash Record Id Success 201
   [Arguments]  &{kwargs}
   ${resp}=  Post Upload By Wash Record Id   &{kwargs}
   expect status is 201  ${resp}  app_wash_record/Post_Upload_By_Wash_Record_Id_201.json
   ${wash_record_id/update}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id/update]}
   set global variable   ${wash_record_id/update}
   ${wash_record_id/upload_mark}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id/upload_mark]}
   set global variable   ${wash_record_id/upload_mark}
   ${wash_record_id/upload}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id/upload]}
   set global variable   ${wash_record_id/upload}
   ${wash_record_id/wash}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id/wash]}
   set global variable   ${wash_record_id/wash}
   ${wash_record_id/finish}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id/finish]}
   set global variable   ${wash_record_id/finish}
   ${wash_record_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id]}
   set global variable   ${wash_record_id}
   ${wash_record_id/washer_remark}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id/washer_remark]}
   set global variable   ${wash_record_id/washer_remark}
   ${wash_record_id/mark}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id/mark]}
   set global variable   ${wash_record_id/mark}
   ${wash_record_id/status}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id/status]}
   set global variable   ${wash_record_id/status}

Post Upload By Wash Record Id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Post Upload By Wash Record Id   &{kwargs}
   expect status is 422  ${resp}  

Post Wash By Wash Record Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  Post Wash By Wash Record Id   &{kwargs}
   expect status is 404  ${resp}  

Post Wash By Wash Record Id Success 201
   [Arguments]  &{kwargs}
   ${resp}=  Post Wash By Wash Record Id   &{kwargs}
   expect status is 201  ${resp}  app_wash_record/Post_Wash_By_Wash_Record_Id_201.json
   ${wash_record_id/update}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id/update]}
   set global variable   ${wash_record_id/update}
   ${wash_record_id/upload_mark}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id/upload_mark]}
   set global variable   ${wash_record_id/upload_mark}
   ${wash_record_id/upload}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id/upload]}
   set global variable   ${wash_record_id/upload}
   ${wash_record_id/wash}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id/wash]}
   set global variable   ${wash_record_id/wash}
   ${wash_record_id/finish}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id/finish]}
   set global variable   ${wash_record_id/finish}
   ${wash_record_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id]}
   set global variable   ${wash_record_id}
   ${wash_record_id/washer_remark}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id/washer_remark]}
   set global variable   ${wash_record_id/washer_remark}
   ${wash_record_id/mark}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id/mark]}
   set global variable   ${wash_record_id/mark}
   ${wash_record_id/status}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id/status]}
   set global variable   ${wash_record_id/status}

Post Wash By Wash Record Id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Post Wash By Wash Record Id   &{kwargs}
   expect status is 422  ${resp}  

Post Finish By Wash Record Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  Post Finish By Wash Record Id   &{kwargs}
   expect status is 404  ${resp}  

Post Finish By Wash Record Id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  Post Finish By Wash Record Id   &{kwargs}
   expect status is 204  ${resp}  

Post Finish By Wash Record Id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Post Finish By Wash Record Id   &{kwargs}
   expect status is 422  ${resp}  

Get User Wash Records Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Get User Wash Records   &{kwargs}
   expect status is 200  ${resp}  app_wash_record/Get_User_Wash_Records_200.json
   ${wash_record_id/update}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id/update]}
   set global variable   ${wash_record_id/update}
   ${wash_record_id/upload_mark}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id/upload_mark]}
   set global variable   ${wash_record_id/upload_mark}
   ${wash_record_id/upload}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id/upload]}
   set global variable   ${wash_record_id/upload}
   ${wash_record_id/wash}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id/wash]}
   set global variable   ${wash_record_id/wash}
   ${wash_record_id/finish}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id/finish]}
   set global variable   ${wash_record_id/finish}
   ${wash_record_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id]}
   set global variable   ${wash_record_id}
   ${wash_record_id/washer_remark}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id/washer_remark]}
   set global variable   ${wash_record_id/washer_remark}
   ${wash_record_id/mark}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id/mark]}
   set global variable   ${wash_record_id/mark}
   ${wash_record_id/status}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id/status]}
   set global variable   ${wash_record_id/status}

Get User Wash Records Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Get User Wash Records   &{kwargs}
   expect status is 422  ${resp}  

Get Cars In Parking Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Get Cars In Parking   &{kwargs}
   expect status is 200  ${resp}  app_wash_record/Get_Cars_In_Parking_200.json
   ${wash_record_id/update}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id/update]}
   set global variable   ${wash_record_id/update}
   ${wash_record_id/upload_mark}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id/upload_mark]}
   set global variable   ${wash_record_id/upload_mark}
   ${wash_record_id/upload}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id/upload]}
   set global variable   ${wash_record_id/upload}
   ${wash_record_id/wash}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id/wash]}
   set global variable   ${wash_record_id/wash}
   ${wash_record_id/finish}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id/finish]}
   set global variable   ${wash_record_id/finish}
   ${wash_record_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id]}
   set global variable   ${wash_record_id}
   ${wash_record_id/washer_remark}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id/washer_remark]}
   set global variable   ${wash_record_id/washer_remark}
   ${wash_record_id/mark}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id/mark]}
   set global variable   ${wash_record_id/mark}
   ${wash_record_id/status}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id/status]}
   set global variable   ${wash_record_id/status}

Get Cars In Parking Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Get Cars In Parking   &{kwargs}
   expect status is 422  ${resp}  

Get wash Records group by zone Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Get wash Records group by zone   &{kwargs}
   expect status is 200  ${resp}  app_wash_record/Get_wash_Records_group_by_zone_200.json
   ${wash_record_id/update}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id/update]}
   set global variable   ${wash_record_id/update}
   ${wash_record_id/upload_mark}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id/upload_mark]}
   set global variable   ${wash_record_id/upload_mark}
   ${wash_record_id/upload}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id/upload]}
   set global variable   ${wash_record_id/upload}
   ${wash_record_id/wash}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id/wash]}
   set global variable   ${wash_record_id/wash}
   ${wash_record_id/finish}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id/finish]}
   set global variable   ${wash_record_id/finish}
   ${wash_record_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id]}
   set global variable   ${wash_record_id}
   ${wash_record_id/washer_remark}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id/washer_remark]}
   set global variable   ${wash_record_id/washer_remark}
   ${wash_record_id/mark}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id/mark]}
   set global variable   ${wash_record_id/mark}
   ${wash_record_id/status}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id/status]}
   set global variable   ${wash_record_id/status}

Get wash Records group by zone Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Get wash Records group by zone   &{kwargs}
   expect status is 422  ${resp}  

Get wash Records nearby Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Get wash Records nearby   &{kwargs}
   expect status is 200  ${resp}  app_wash_record/Get_wash_Records_nearby_200.json
   ${wash_record_id/update}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id/update]}
   set global variable   ${wash_record_id/update}
   ${wash_record_id/upload_mark}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id/upload_mark]}
   set global variable   ${wash_record_id/upload_mark}
   ${wash_record_id/upload}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id/upload]}
   set global variable   ${wash_record_id/upload}
   ${wash_record_id/wash}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id/wash]}
   set global variable   ${wash_record_id/wash}
   ${wash_record_id/finish}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id/finish]}
   set global variable   ${wash_record_id/finish}
   ${wash_record_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id]}
   set global variable   ${wash_record_id}
   ${wash_record_id/washer_remark}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id/washer_remark]}
   set global variable   ${wash_record_id/washer_remark}
   ${wash_record_id/mark}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id/mark]}
   set global variable   ${wash_record_id/mark}
   ${wash_record_id/status}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id/status]}
   set global variable   ${wash_record_id/status}

Get wash Records nearby Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Get wash Records nearby   &{kwargs}
   expect status is 422  ${resp}  

Get car Wash wash records Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Get car Wash wash records   &{kwargs}
   expect status is 200  ${resp}  app_wash_record/Get_car_Wash_wash_records_200.json
   ${wash_record_id/update}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id/update]}
   set global variable   ${wash_record_id/update}
   ${wash_record_id/upload_mark}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id/upload_mark]}
   set global variable   ${wash_record_id/upload_mark}
   ${wash_record_id/upload}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id/upload]}
   set global variable   ${wash_record_id/upload}
   ${wash_record_id/wash}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id/wash]}
   set global variable   ${wash_record_id/wash}
   ${wash_record_id/finish}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id/finish]}
   set global variable   ${wash_record_id/finish}
   ${wash_record_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id]}
   set global variable   ${wash_record_id}
   ${wash_record_id/washer_remark}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id/washer_remark]}
   set global variable   ${wash_record_id/washer_remark}
   ${wash_record_id/mark}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id/mark]}
   set global variable   ${wash_record_id/mark}
   ${wash_record_id/status}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id/status]}
   set global variable   ${wash_record_id/status}

Get car Wash wash records Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Get car Wash wash records   &{kwargs}
   expect status is 422  ${resp}  

Get car Wash wash records by wash record id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  Get car Wash wash records by wash record id   &{kwargs}
   expect status is 404  ${resp}  

Get car Wash wash records by wash record id Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Get car Wash wash records by wash record id   &{kwargs}
   expect status is 200  ${resp}  app_wash_record/Get_car_Wash_wash_records_by_wash_record_id_200.json
   ${wash_record_id/update}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id/update]}
   set global variable   ${wash_record_id/update}
   ${wash_record_id/upload_mark}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id/upload_mark]}
   set global variable   ${wash_record_id/upload_mark}
   ${wash_record_id/upload}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id/upload]}
   set global variable   ${wash_record_id/upload}
   ${wash_record_id/wash}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id/wash]}
   set global variable   ${wash_record_id/wash}
   ${wash_record_id/finish}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id/finish]}
   set global variable   ${wash_record_id/finish}
   ${wash_record_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id]}
   set global variable   ${wash_record_id}
   ${wash_record_id/washer_remark}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id/washer_remark]}
   set global variable   ${wash_record_id/washer_remark}
   ${wash_record_id/mark}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id/mark]}
   set global variable   ${wash_record_id/mark}
   ${wash_record_id/status}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id/status]}
   set global variable   ${wash_record_id/status}

Get Car In Parking Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Get Car In Parking   &{kwargs}
   expect status is 200  ${resp}  app_wash_record/Get_Car_In_Parking_200.json
   ${wash_record_id/update}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id/update]}
   set global variable   ${wash_record_id/update}
   ${wash_record_id/upload_mark}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id/upload_mark]}
   set global variable   ${wash_record_id/upload_mark}
   ${wash_record_id/upload}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id/upload]}
   set global variable   ${wash_record_id/upload}
   ${wash_record_id/wash}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id/wash]}
   set global variable   ${wash_record_id/wash}
   ${wash_record_id/finish}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id/finish]}
   set global variable   ${wash_record_id/finish}
   ${wash_record_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id]}
   set global variable   ${wash_record_id}
   ${wash_record_id/washer_remark}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id/washer_remark]}
   set global variable   ${wash_record_id/washer_remark}
   ${wash_record_id/mark}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id/mark]}
   set global variable   ${wash_record_id/mark}
   ${wash_record_id/status}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_record_id/status]}
   set global variable   ${wash_record_id/status}

Get Car In Parking Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Get Car In Parking   &{kwargs}
   expect status is 422  ${resp}  

Patch washer Remark by wash record id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  Patch washer Remark by wash record id   &{kwargs}
   expect status is 204  ${resp}  

Patch washer Remark by wash record id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  Patch washer Remark by wash record id   &{kwargs}
   expect status is 404  ${resp}  

Patch washer Remark by wash record id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Patch washer Remark by wash record id   &{kwargs}
   expect status is 422  ${resp}  

Patch Mark By Wash Record Id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  Patch Mark By Wash Record Id   &{kwargs}
   expect status is 204  ${resp}  

Patch Mark By Wash Record Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  Patch Mark By Wash Record Id   &{kwargs}
   expect status is 404  ${resp}  

Patch Mark By Wash Record Id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Patch Mark By Wash Record Id   &{kwargs}
   expect status is 422  ${resp}  

Patch Status By Wash Record Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  Patch Status By Wash Record Id   &{kwargs}
   expect status is 404  ${resp}  

Patch Status By Wash Record Id Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Patch Status By Wash Record Id   &{kwargs}
   expect status is 200  ${resp}  app_wash_record/Patch_Status_By_Wash_Record_Id_200.json

Patch Status By Wash Record Id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Patch Status By Wash Record Id   &{kwargs}
   expect status is 422  ${resp}  

