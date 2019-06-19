*** Settings ***
Documentation  app_wash_record
Resource  ../resources.robot
Library  robot_washing_expert_library.wash_record.WashRecordLibrary
Suite Setup  Login  ${username}   ${password}
Force Tags  model:app_wash_record  虾客APP


*** Test Cases ***
post car wash wash records update by wash record id Fail With Wrong Url
   [Documentation]  接口名:智能更新订单${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   post car wash wash records update by wash record id fail 404     wash_record_id=${wrong_url_id}  status=${status}    before_wash_images=${before_wash_images}  after_wash_images=${after_wash_images}  wash_tags=${wash_tags}  description=${description}  start_time=${start_time}  end_time=${end_time}  dirty_percent=${dirty_percent}  washer_remark=${washer_remark}  mark=${mark}  

post car wash wash records update by wash record id Success 
   [Documentation]  接口名:智能更新订单${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create dictionary  status=${status}  
   ${unessential_params}  create dictionary  before_wash_images=${before_wash_images}  after_wash_images=${after_wash_images}  wash_tags=${wash_tags}  description=${description}  start_time=${start_time}  end_time=${end_time}  dirty_percent=${dirty_percent}  washer_remark=${washer_remark}  mark=${mark}  
   run every case by params   post car wash wash records update by wash record id success 204   ${essential_params}  ${unessential_params}    wash_record_id=${wash_record_id}

post car wash wash records update by wash record id Fail With Wrong Params
   [Documentation]  接口名:智能更新订单${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  status=${status_422}  
   ${unessential_params}  create dictionary  before_wash_images=${before_wash_images_422}  after_wash_images=${after_wash_images_422}  wash_tags=${wash_tags_422}  description=${description_422}  start_time=${start_time_422}  end_time=${end_time_422}  dirty_percent=${dirty_percent_422}  washer_remark=${washer_remark_422}  mark=${mark_422}  
   run every case by params   post car wash wash records update by wash record id fail 422   ${essential_params}  ${unessential_params}    wash_record_id=${wash_record_id}  success=False

post car wash wash records upload mark by wash record id Fail With Wrong Url
   [Documentation]  接口名:上传洗车备注及标记${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   post car wash wash records upload mark by wash record id fail 404     wash_record_id=${wrong_url_id}    washer_remark=${washer_remark}  mark=${mark}  

post car wash wash records upload mark by wash record id Success 
   [Documentation]  接口名:上传洗车备注及标记${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 201,返回的Json数据符合验证。
   [Tags]           Respcode:201
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  washer_remark=${washer_remark}  mark=${mark}  
   run every case by params   post car wash wash records upload mark by wash record id success 201   ${essential_params}  ${unessential_params}    wash_record_id=${wash_record_id}

post car wash wash records upload mark by wash record id Fail With Wrong Params
   [Documentation]  接口名:上传洗车备注及标记${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  washer_remark=${washer_remark_422}  mark=${mark_422}  
   run every case by params   post car wash wash records upload mark by wash record id fail 422   ${essential_params}  ${unessential_params}    wash_record_id=${wash_record_id}  success=False

post car wash wash records upload by wash record id Fail With Wrong Url
   [Documentation]  接口名:上传洗车记录${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   post car wash wash records upload by wash record id fail 404     wash_record_id=${wrong_url_id}  before_wash_images=${before_wash_images}  status=${status}  after_wash_images=${after_wash_images}  start_time=${start_time}  end_time=${end_time}  dirty_percent=${dirty_percent}    tags=${Please_input}  description=${description}  

post car wash wash records upload by wash record id Success 
   [Documentation]  接口名:上传洗车记录${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create dictionary  before_wash_images=${before_wash_images}  status=${status}  after_wash_images=${after_wash_images}  start_time=${start_time}  end_time=${end_time}  dirty_percent=${dirty_percent}  
   ${unessential_params}  create dictionary  tags=${Please_input}  description=${description}  
   run every case by params   post car wash wash records upload by wash record id success 204   ${essential_params}  ${unessential_params}    wash_record_id=${wash_record_id}

post car wash wash records upload by wash record id Fail With Wrong Params
   [Documentation]  接口名:上传洗车记录${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  before_wash_images=${before_wash_images_422}  status=${status_422}  after_wash_images=${after_wash_images_422}  start_time=${start_time_422}  end_time=${end_time_422}  dirty_percent=${dirty_percent_422}  
   ${unessential_params}  create dictionary  tags=${Please_input}  description=${description_422}  
   run every case by params   post car wash wash records upload by wash record id fail 422   ${essential_params}  ${unessential_params}    wash_record_id=${wash_record_id}  success=False

post car wash wash records wash by wash record id Fail With Wrong Url
   [Documentation]  接口名:洗车${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   post car wash wash records wash by wash record id fail 404     wash_record_id=${wrong_url_id}  before_wash_images=${before_wash_images}    tags=${Please_input}  description=${description}  dirty_percent=${dirty_percent}  

post car wash wash records wash by wash record id Success 
   [Documentation]  接口名:洗车${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create dictionary  before_wash_images=${before_wash_images}  
   ${unessential_params}  create dictionary  tags=${Please_input}  description=${description}  dirty_percent=${dirty_percent}  
   run every case by params   post car wash wash records wash by wash record id success 204   ${essential_params}  ${unessential_params}    wash_record_id=${wash_record_id}

post car wash wash records wash by wash record id Fail With Wrong Params
   [Documentation]  接口名:洗车${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  before_wash_images=${before_wash_images_422}  
   ${unessential_params}  create dictionary  tags=${Please_input}  description=${description_422}  dirty_percent=${dirty_percent_422}  
   run every case by params   post car wash wash records wash by wash record id fail 422   ${essential_params}  ${unessential_params}    wash_record_id=${wash_record_id}  success=False

post car wash wash records finish by wash record id Fail With Wrong Url
   [Documentation]  接口名:完成洗车${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   post car wash wash records finish by wash record id fail 404     wash_record_id=${wrong_url_id}  after_wash_images=${after_wash_images}    

post car wash wash records finish by wash record id Success 
   [Documentation]  接口名:完成洗车${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create dictionary  after_wash_images=${after_wash_images}  
   ${unessential_params}  create dictionary  
   run every case by params   post car wash wash records finish by wash record id success 204   ${essential_params}  ${unessential_params}    wash_record_id=${wash_record_id}

post car wash wash records finish by wash record id Fail With Wrong Params
   [Documentation]  接口名:完成洗车${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  after_wash_images=${after_wash_images_422}  
   ${unessential_params}  create dictionary  
   run every case by params   post car wash wash records finish by wash record id fail 422   ${essential_params}  ${unessential_params}    wash_record_id=${wash_record_id}  success=False

get car wash wash records today Success 
   [Documentation]  接口名:获取洗车记录列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 WashRecord 列表。
   [Tags]           Respcode:200
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  status=${status}  car_id=${car_id}  wash_group_id=${wash_group_id}  section=${section}  page_limit=${page_limit}  wash_area_id=${wash_area_id}  parking_id=${parking_id}  order_by=${order_by}  phase=${phase}  floor=${floor}  zone=${zone}  
   run every case by params   get car wash wash records today success 200   ${essential_params}  ${unessential_params}

get car wash wash records today Fail With Wrong Params
   [Documentation]  接口名:获取洗车记录列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  status=${status_422}  car_id=${car_id_422}  wash_group_id=${wash_group_id_422}  section=${section_422}  page_limit=${page_limit_422}  wash_area_id=${wash_area_id_422}  parking_id=${parking_id_422}  order_by=${order_by_422}  phase=${phase_422}  floor=${floor_422}  zone=${zone_422}  
   run every case by params   get car wash wash records today fail 422   ${essential_params}  ${unessential_params}  success=False

get car wash user wash records Success 
   [Documentation]  接口名:获取虾克历史订单列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 WashRecord 列表。
   [Tags]           Respcode:200
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  time_point=${time_point}  section=${section}  page_limit=${page_limit}  
   run every case by params   get car wash user wash records success 200   ${essential_params}  ${unessential_params}

get car wash user wash records Fail With Wrong Params
   [Documentation]  接口名:获取虾克历史订单列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  time_point=${time_point_422}  section=${section_422}  page_limit=${page_limit_422}  
   run every case by params   get car wash user wash records fail 422   ${essential_params}  ${unessential_params}  success=False

get car wash cars in parking Success 
   [Documentation]  接口名:车牌号批量获取在场状态${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为  列表。
   [Tags]           Respcode:200
   ${essential_params}  create dictionary  car_ids=${car_ids}  
   ${unessential_params}  create dictionary  parking_id=${parking_id}  
   run every case by params   get car wash cars in parking success 200   ${essential_params}  ${unessential_params}

get car wash cars in parking Fail With Wrong Params
   [Documentation]  接口名:车牌号批量获取在场状态${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  car_ids=${car_ids_422}  
   ${unessential_params}  create dictionary  parking_id=${parking_id_422}  
   run every case by params   get car wash cars in parking fail 422   ${essential_params}  ${unessential_params}  success=False

get car wash wash records group by zone Success 
   [Documentation]  接口名:洗车记录按停车场区进行分组${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为  列表。
   [Tags]           Respcode:200
   ${essential_params}  create dictionary  status=${status}  wash_area_id=${wash_area_id}  
   ${unessential_params}  create dictionary  parking_id=${parking_id}  
   run every case by params   get car wash wash records group by zone success 200   ${essential_params}  ${unessential_params}

get car wash wash records group by zone Fail With Wrong Params
   [Documentation]  接口名:洗车记录按停车场区进行分组${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  status=${status_422}  wash_area_id=${wash_area_id_422}  
   ${unessential_params}  create dictionary  parking_id=${parking_id_422}  
   run every case by params   get car wash wash records group by zone fail 422   ${essential_params}  ${unessential_params}  success=False

get car wash wash records nearby Success 
   [Documentation]  接口名:洗车记录根据距离排序${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 WashRecord 列表。
   [Tags]           Respcode:200
   ${essential_params}  create dictionary  radius=${radius}  center=${center}  status=${status}  limit=${limit}  wash_area_id=${wash_area_id}  
   ${unessential_params}  create dictionary  
   run every case by params   get car wash wash records nearby success 200   ${essential_params}  ${unessential_params}

get car wash wash records nearby Fail With Wrong Params
   [Documentation]  接口名:洗车记录根据距离排序${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  radius=${radius_422}  center=${center_422}  status=${status_422}  limit=${limit_422}  wash_area_id=${wash_area_id_422}  
   ${unessential_params}  create dictionary  
   run every case by params   get car wash wash records nearby fail 422   ${essential_params}  ${unessential_params}  success=False

get car wash wash records Success 
   [Documentation]  接口名:获取洗车记录列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 WashRecord 列表。
   [Tags]           Respcode:200
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  status=${status}  car_id=${car_id}  wash_group_id=${wash_group_id}  section=${section}  page_limit=${page_limit}  wash_area_id=${wash_area_id}  order_by=${order_by}  floor=${floor}  zone=${zone}  
   run every case by params   get car wash wash records success 200   ${essential_params}  ${unessential_params}

get car wash wash records Fail With Wrong Params
   [Documentation]  接口名:获取洗车记录列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  status=${status_422}  car_id=${car_id_422}  wash_group_id=${wash_group_id_422}  section=${section_422}  page_limit=${page_limit_422}  wash_area_id=${wash_area_id_422}  order_by=${order_by_422}  floor=${floor_422}  zone=${zone_422}  
   run every case by params   get car wash wash records fail 422   ${essential_params}  ${unessential_params}  success=False

get car wash wash record by wash record id Fail With Wrong Url
   [Documentation]  接口名:获取单个洗车记录${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   get car wash wash record by wash record id fail 404     wash_record_id=${wrong_url_id}

get car wash wash record by wash record id Success 
   [Documentation]  接口名:获取单个洗车记录${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 WashRecord 对象。
   [Tags]           Respcode:200
   get car wash wash record by wash record id success 200     wash_record_id=${wash_record_id}

get car wash car in parking Success 
   [Documentation]  接口名:查询车辆是否在场内${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为  列表。
   [Tags]           Respcode:200
   ${essential_params}  create dictionary  car_id=${car_id}  
   ${unessential_params}  create dictionary  parking_id=${parking_id}  
   run every case by params   get car wash car in parking success 200   ${essential_params}  ${unessential_params}

get car wash car in parking Fail With Wrong Params
   [Documentation]  接口名:查询车辆是否在场内${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  car_id=${car_id_422}  
   ${unessential_params}  create dictionary  parking_id=${parking_id_422}  
   run every case by params   get car wash car in parking fail 422   ${essential_params}  ${unessential_params}  success=False

get car wash alone wash records Success 
   [Documentation]  接口名:查询车牌号是否有洗车记录${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 WashRecord 列表。
   [Tags]           Respcode:200
   ${essential_params}  create dictionary  car_id=${car_id}  
   ${unessential_params}  create dictionary  
   run every case by params   get car wash alone wash records success 200   ${essential_params}  ${unessential_params}

get car wash alone wash records Fail With Wrong Params
   [Documentation]  接口名:查询车牌号是否有洗车记录${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  car_id=${car_id_422}  
   ${unessential_params}  create dictionary  
   run every case by params   get car wash alone wash records fail 422   ${essential_params}  ${unessential_params}  success=False

patch car wash wash records washer remark by wash record id Success 
   [Documentation]  接口名:备注${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  washer_remark=${washer_remark}  
   run every case by params   patch car wash wash records washer remark by wash record id success 204   ${essential_params}  ${unessential_params}    wash_record_id=${wash_record_id}

patch car wash wash records washer remark by wash record id Fail With Wrong Url
   [Documentation]  接口名:备注${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   patch car wash wash records washer remark by wash record id fail 404     wash_record_id=${wrong_url_id}    washer_remark=${washer_remark}  

patch car wash wash records washer remark by wash record id Fail With Wrong Params
   [Documentation]  接口名:备注${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  washer_remark=${washer_remark_422}  
   run every case by params   patch car wash wash records washer remark by wash record id fail 422   ${essential_params}  ${unessential_params}    wash_record_id=${wash_record_id}  success=False

patch car wash wash records mark by wash record id Success 
   [Documentation]  接口名:标记${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  mark=${mark}  
   run every case by params   patch car wash wash records mark by wash record id success 204   ${essential_params}  ${unessential_params}    wash_record_id=${wash_record_id}

patch car wash wash records mark by wash record id Fail With Wrong Url
   [Documentation]  接口名:标记${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   patch car wash wash records mark by wash record id fail 404     wash_record_id=${wrong_url_id}    mark=${mark}  

patch car wash wash records mark by wash record id Fail With Wrong Params
   [Documentation]  接口名:标记${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  mark=${mark_422}  
   run every case by params   patch car wash wash records mark by wash record id fail 422   ${essential_params}  ${unessential_params}    wash_record_id=${wash_record_id}  success=False

patch car wash wash records status by wash record id Fail With Wrong Url
   [Documentation]  接口名:修改单个洗车记录状态${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   patch car wash wash records status by wash record id fail 404     wash_record_id=${wrong_url_id}  status=${status}    

patch car wash wash records status by wash record id Success 
   [Documentation]  接口名:修改单个洗车记录状态${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为  对象。
   [Tags]           Respcode:200
   ${essential_params}  create dictionary  status=${status}  
   ${unessential_params}  create dictionary  
   run every case by params   patch car wash wash records status by wash record id success 200   ${essential_params}  ${unessential_params}    wash_record_id=${wash_record_id}

patch car wash wash records status by wash record id Fail With Wrong Params
   [Documentation]  接口名:修改单个洗车记录状态${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  status=${status_422}  
   ${unessential_params}  create dictionary  
   run every case by params   patch car wash wash records status by wash record id fail 422   ${essential_params}  ${unessential_params}    wash_record_id=${wash_record_id}  success=False


*** Variables ***
${wash_record_id}  


*** Keywords ***
post car wash wash records update by wash record id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  post car wash wash records update by wash record id  &{kwargs}
   expect status is 404  ${resp}  

post car wash wash records update by wash record id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  post car wash wash records update by wash record id  &{kwargs}
   expect status is 204  ${resp}  

post car wash wash records update by wash record id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post car wash wash records update by wash record id  &{kwargs}
   expect status is 422  ${resp}  

post car wash wash records upload mark by wash record id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  post car wash wash records upload mark by wash record id  &{kwargs}
   expect status is 404  ${resp}  

post car wash wash records upload mark by wash record id Success 201
   [Arguments]  &{kwargs}
   ${resp}=  post car wash wash records upload mark by wash record id  &{kwargs}
   expect status is 201  ${resp}  app_wash_record/post_car_wash_wash_records_upload_mark_by_wash_record_id_201.json
   ${wash_record_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0]['wash_record_id']}
   set global variable   ${wash_record_id}

post car wash wash records upload mark by wash record id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post car wash wash records upload mark by wash record id  &{kwargs}
   expect status is 422  ${resp}  

post car wash wash records upload by wash record id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  post car wash wash records upload by wash record id  &{kwargs}
   expect status is 404  ${resp}  

post car wash wash records upload by wash record id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  post car wash wash records upload by wash record id  &{kwargs}
   expect status is 204  ${resp}  

post car wash wash records upload by wash record id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post car wash wash records upload by wash record id  &{kwargs}
   expect status is 422  ${resp}  

post car wash wash records wash by wash record id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  post car wash wash records wash by wash record id  &{kwargs}
   expect status is 404  ${resp}  

post car wash wash records wash by wash record id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  post car wash wash records wash by wash record id  &{kwargs}
   expect status is 204  ${resp}  

post car wash wash records wash by wash record id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post car wash wash records wash by wash record id  &{kwargs}
   expect status is 422  ${resp}  

post car wash wash records finish by wash record id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  post car wash wash records finish by wash record id  &{kwargs}
   expect status is 404  ${resp}  

post car wash wash records finish by wash record id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  post car wash wash records finish by wash record id  &{kwargs}
   expect status is 204  ${resp}  

post car wash wash records finish by wash record id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post car wash wash records finish by wash record id  &{kwargs}
   expect status is 422  ${resp}  

get car wash wash records today Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get car wash wash records today  &{kwargs}
   expect status is 200  ${resp}  app_wash_record/get_car_wash_wash_records_today_200.json
   ${wash_record_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0]['wash_record_id']}
   set global variable   ${wash_record_id}

get car wash wash records today Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get car wash wash records today  &{kwargs}
   expect status is 422  ${resp}  

get car wash user wash records Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get car wash user wash records  &{kwargs}
   expect status is 200  ${resp}  app_wash_record/get_car_wash_user_wash_records_200.json
   ${wash_record_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0]['wash_record_id']}
   set global variable   ${wash_record_id}

get car wash user wash records Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get car wash user wash records  &{kwargs}
   expect status is 422  ${resp}  

get car wash cars in parking Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get car wash cars in parking  &{kwargs}
   expect status is 200  ${resp}  app_wash_record/get_car_wash_cars_in_parking_200.json
   ${wash_record_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0]['wash_record_id']}
   set global variable   ${wash_record_id}

get car wash cars in parking Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get car wash cars in parking  &{kwargs}
   expect status is 422  ${resp}  

get car wash wash records group by zone Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get car wash wash records group by zone  &{kwargs}
   expect status is 200  ${resp}  app_wash_record/get_car_wash_wash_records_group_by_zone_200.json
   ${wash_record_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0]['wash_record_id']}
   set global variable   ${wash_record_id}

get car wash wash records group by zone Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get car wash wash records group by zone  &{kwargs}
   expect status is 422  ${resp}  

get car wash wash records nearby Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get car wash wash records nearby  &{kwargs}
   expect status is 200  ${resp}  app_wash_record/get_car_wash_wash_records_nearby_200.json
   ${wash_record_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0]['wash_record_id']}
   set global variable   ${wash_record_id}

get car wash wash records nearby Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get car wash wash records nearby  &{kwargs}
   expect status is 422  ${resp}  

get car wash wash records Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get car wash wash records  &{kwargs}
   expect status is 200  ${resp}  app_wash_record/get_car_wash_wash_records_200.json
   ${wash_record_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0]['wash_record_id']}
   set global variable   ${wash_record_id}

get car wash wash records Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get car wash wash records  &{kwargs}
   expect status is 422  ${resp}  

get car wash wash record by wash record id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  get car wash wash record by wash record id  &{kwargs}
   expect status is 404  ${resp}  

get car wash wash record by wash record id Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get car wash wash record by wash record id  &{kwargs}
   expect status is 200  ${resp}  app_wash_record/get_car_wash_wash_record_by_wash_record_id_200.json
   ${wash_record_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0]['wash_record_id']}
   set global variable   ${wash_record_id}

get car wash car in parking Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get car wash car in parking  &{kwargs}
   expect status is 200  ${resp}  app_wash_record/get_car_wash_car_in_parking_200.json
   ${wash_record_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0]['wash_record_id']}
   set global variable   ${wash_record_id}

get car wash car in parking Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get car wash car in parking  &{kwargs}
   expect status is 422  ${resp}  

get car wash alone wash records Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get car wash alone wash records  &{kwargs}
   expect status is 200  ${resp}  app_wash_record/get_car_wash_alone_wash_records_200.json
   ${wash_record_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0]['wash_record_id']}
   set global variable   ${wash_record_id}

get car wash alone wash records Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get car wash alone wash records  &{kwargs}
   expect status is 422  ${resp}  

patch car wash wash records washer remark by wash record id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  patch car wash wash records washer remark by wash record id  &{kwargs}
   expect status is 204  ${resp}  

patch car wash wash records washer remark by wash record id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  patch car wash wash records washer remark by wash record id  &{kwargs}
   expect status is 404  ${resp}  

patch car wash wash records washer remark by wash record id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  patch car wash wash records washer remark by wash record id  &{kwargs}
   expect status is 422  ${resp}  

patch car wash wash records mark by wash record id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  patch car wash wash records mark by wash record id  &{kwargs}
   expect status is 204  ${resp}  

patch car wash wash records mark by wash record id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  patch car wash wash records mark by wash record id  &{kwargs}
   expect status is 404  ${resp}  

patch car wash wash records mark by wash record id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  patch car wash wash records mark by wash record id  &{kwargs}
   expect status is 422  ${resp}  

patch car wash wash records status by wash record id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  patch car wash wash records status by wash record id  &{kwargs}
   expect status is 404  ${resp}  

patch car wash wash records status by wash record id Success 200
   [Arguments]  &{kwargs}
   ${resp}=  patch car wash wash records status by wash record id  &{kwargs}
   expect status is 200  ${resp}  app_wash_record/patch_car_wash_wash_records_status_by_wash_record_id_200.json

patch car wash wash records status by wash record id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  patch car wash wash records status by wash record id  &{kwargs}
   expect status is 422  ${resp}  

