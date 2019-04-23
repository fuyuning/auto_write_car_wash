*** Settings ***
Documentation  app_wash_record
Resource  ../resources.robot
Library  robot_car_wash_app_library.wash_record.WashRecordLibrary
Suite Setup  Login  ${app_username}  ${app_password}

Force Tags  model:app_wash_record  虾客APP


*** Test Cases ***
Post wash_record By Id Fail Without Login
   [Documentation]  接口名:智能更新订单${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  status=${status}  
   ${unessential_params}  create list  before_wash_images=${before_wash_images}  after_wash_images=${after_wash_images}  wash_tags=${wash_tags}  description=${description}  start_time=${start_time}  end_time=${end_time}  dirty_percent=${dirty_percent}  washer_remark=${washer_remark}  mark=${mark}  
   run every case by params  Post car wash wash records By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/update=${wash_record_id/update}



Post wash_record By Id Fail With Wrong Url
   [Documentation]  接口名:智能更新订单${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  status=${status}  
   ${unessential_params}  create list  before_wash_images=${before_wash_images}  after_wash_images=${after_wash_images}  wash_tags=${wash_tags}  description=${description}  start_time=${start_time}  end_time=${end_time}  dirty_percent=${dirty_percent}  washer_remark=${washer_remark}  mark=${mark}  
   run every case by params  Post car wash wash records By Id Fail 404  ${essential_params}  ${unessential_params}  wash_record_id/update=${wrong_url_id}



Post wash_record By Id Success 
   [Documentation]  接口名:智能更新订单${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 201,返回的Json数据符合验证。
   [Tags]           Respcode:201
   ${essential_params}  create list  status=${status}  
   ${unessential_params}  create list  before_wash_images=${before_wash_images}  after_wash_images=${after_wash_images}  wash_tags=${wash_tags}  description=${description}  start_time=${start_time}  end_time=${end_time}  dirty_percent=${dirty_percent}  washer_remark=${washer_remark}  mark=${mark}  
   run every case by params  Post car wash wash records By Id Success 201  ${essential_params}  ${unessential_params}  wash_record_id/update=${wash_record_id/update}



Post wash_record By Id Fail With Wrong Params
   [Documentation]  接口名:智能更新订单${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  status=${status}  
   ${unessential_params}  create list  before_wash_images=${before_wash_images}  after_wash_images=${after_wash_images}  wash_tags=${wash_tags}  description=${description}  start_time=${start_time}  end_time=${end_time}  dirty_percent=${dirty_percent}  washer_remark=${washer_remark}  mark=${mark}  
   run every case by params  Post car wash wash records By Id Fail 422  ${essential_params}  ${unessential_params}  wash_record_id/update=${wash_record_id/update}



Post wash_record By Id Fail Without Login
   [Documentation]  接口名:上传洗车备注及标记${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  washer_remark=${washer_remark}  mark=${mark}  
   run every case by params  Post car wash wash records By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/upload_mark=${wash_record_id/upload_mark}



Post wash_record By Id Fail With Wrong Url
   [Documentation]  接口名:上传洗车备注及标记${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  
   ${unessential_params}  create list  washer_remark=${washer_remark}  mark=${mark}  
   run every case by params  Post car wash wash records By Id Fail 404  ${essential_params}  ${unessential_params}  wash_record_id/upload_mark=${wrong_url_id}



Post wash_record By Id Success 
   [Documentation]  接口名:上传洗车备注及标记${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 201,返回的Json数据符合验证。
   [Tags]           Respcode:201
   ${essential_params}  create list  
   ${unessential_params}  create list  washer_remark=${washer_remark}  mark=${mark}  
   run every case by params  Post car wash wash records By Id Success 201  ${essential_params}  ${unessential_params}  wash_record_id/upload_mark=${wash_record_id/upload_mark}



Post wash_record By Id Fail With Wrong Params
   [Documentation]  接口名:上传洗车备注及标记${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  washer_remark=${washer_remark}  mark=${mark}  
   run every case by params  Post car wash wash records By Id Fail 422  ${essential_params}  ${unessential_params}  wash_record_id/upload_mark=${wash_record_id/upload_mark}



Post wash_record By Id Fail Without Login
   [Documentation]  接口名:上传洗车记录${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  before_wash_images=${before_wash_images}  status=${status}  after_wash_images=${after_wash_images}  start_time=${start_time}  end_time=${end_time}  dirty_percent=${dirty_percent}  
   ${unessential_params}  create list  tags=${Please_input}  description=${description}  
   run every case by params  Post car wash wash records By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/upload=${wash_record_id/upload}



Post wash_record By Id Fail With Wrong Url
   [Documentation]  接口名:上传洗车记录${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  before_wash_images=${before_wash_images}  status=${status}  after_wash_images=${after_wash_images}  start_time=${start_time}  end_time=${end_time}  dirty_percent=${dirty_percent}  
   ${unessential_params}  create list  tags=${Please_input}  description=${description}  
   run every case by params  Post car wash wash records By Id Fail 404  ${essential_params}  ${unessential_params}  wash_record_id/upload=${wrong_url_id}



Post wash_record By Id Success 
   [Documentation]  接口名:上传洗车记录${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 201,返回的Json数据符合验证。
   [Tags]           Respcode:201
   ${essential_params}  create list  before_wash_images=${before_wash_images}  status=${status}  after_wash_images=${after_wash_images}  start_time=${start_time}  end_time=${end_time}  dirty_percent=${dirty_percent}  
   ${unessential_params}  create list  tags=${Please_input}  description=${description}  
   run every case by params  Post car wash wash records By Id Success 201  ${essential_params}  ${unessential_params}  wash_record_id/upload=${wash_record_id/upload}



Post wash_record By Id Fail With Wrong Params
   [Documentation]  接口名:上传洗车记录${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  before_wash_images=${before_wash_images}  status=${status}  after_wash_images=${after_wash_images}  start_time=${start_time}  end_time=${end_time}  dirty_percent=${dirty_percent}  
   ${unessential_params}  create list  tags=${Please_input}  description=${description}  
   run every case by params  Post car wash wash records By Id Fail 422  ${essential_params}  ${unessential_params}  wash_record_id/upload=${wash_record_id/upload}



Post wash_record By Id Fail Without Login
   [Documentation]  接口名:洗车${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  before_wash_images=${before_wash_images}  
   ${unessential_params}  create list  tags=${Please_input}  description=${description}  
   run every case by params  Post car wash wash records By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/wash=${wash_record_id/wash}



Post wash_record By Id Fail With Wrong Url
   [Documentation]  接口名:洗车${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  before_wash_images=${before_wash_images}  
   ${unessential_params}  create list  tags=${Please_input}  description=${description}  
   run every case by params  Post car wash wash records By Id Fail 404  ${essential_params}  ${unessential_params}  wash_record_id/wash=${wrong_url_id}



Post wash_record By Id Success 
   [Documentation]  接口名:洗车${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 201,返回的Json数据符合验证。
   [Tags]           Respcode:201
   ${essential_params}  create list  before_wash_images=${before_wash_images}  
   ${unessential_params}  create list  tags=${Please_input}  description=${description}  
   run every case by params  Post car wash wash records By Id Success 201  ${essential_params}  ${unessential_params}  wash_record_id/wash=${wash_record_id/wash}



Post wash_record By Id Fail With Wrong Params
   [Documentation]  接口名:洗车${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  before_wash_images=${before_wash_images}  
   ${unessential_params}  create list  tags=${Please_input}  description=${description}  
   run every case by params  Post car wash wash records By Id Fail 422  ${essential_params}  ${unessential_params}  wash_record_id/wash=${wash_record_id/wash}



Post wash_record By Id Fail Without Login
   [Documentation]  接口名:完成洗车${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  after_wash_images=${after_wash_images}  
   ${unessential_params}  create list  
   run every case by params  Post car wash wash records By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/finish=${wash_record_id/finish}



Post wash_record By Id Fail With Wrong Url
   [Documentation]  接口名:完成洗车${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  after_wash_images=${after_wash_images}  
   ${unessential_params}  create list  
   run every case by params  Post car wash wash records By Id Fail 404  ${essential_params}  ${unessential_params}  wash_record_id/finish=${wrong_url_id}



Post wash_record By Id Success 
   [Documentation]  接口名:完成洗车${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create list  after_wash_images=${after_wash_images}  
   ${unessential_params}  create list  
   run every case by params  Post car wash wash records By Id Success 204  ${essential_params}  ${unessential_params}  wash_record_id/finish=${wash_record_id/finish}



Post wash_record By Id Fail With Wrong Params
   [Documentation]  接口名:完成洗车${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  after_wash_images=${after_wash_images}  
   ${unessential_params}  create list  
   run every case by params  Post car wash wash records By Id Fail 422  ${essential_params}  ${unessential_params}  wash_record_id/finish=${wash_record_id/finish}



Get wash_record Fail Without Login
   [Documentation]  接口名:获取虾克历史订单列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  section=${section}  page_limit=${page_limit}  
   run every case by params  Get user wash records Fail 403  ${essential_params}  ${unessential_params}



Get wash_record Success 
   [Documentation]  接口名:获取虾克历史订单列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 WashRecord 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  
   ${unessential_params}  create list  section=${section}  page_limit=${page_limit}  
   run every case by params  Get user wash records Success 200  ${essential_params}  ${unessential_params}



Get wash_record Fail With Wrong Params
   [Documentation]  接口名:获取虾克历史订单列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  section=${section}  page_limit=${page_limit}  
   run every case by params  Get user wash records Fail 422  ${essential_params}  ${unessential_params}



Get wash_record Fail Without Login
   [Documentation]  接口名:车牌号批量获取在场状态${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  car_ids=${car_ids}  
   ${unessential_params}  create list  parking_id=${parking_id}  
   run every case by params  Get cars in parking Fail 403  ${essential_params}  ${unessential_params}



Get wash_record Success 
   [Documentation]  接口名:车牌号批量获取在场状态${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为  列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  car_ids=${car_ids}  
   ${unessential_params}  create list  parking_id=${parking_id}  
   run every case by params  Get cars in parking Success 200  ${essential_params}  ${unessential_params}



Get wash_record Fail With Wrong Params
   [Documentation]  接口名:车牌号批量获取在场状态${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  car_ids=${car_ids}  
   ${unessential_params}  create list  parking_id=${parking_id}  
   run every case by params  Get cars in parking Fail 422  ${essential_params}  ${unessential_params}



Get wash_record Fail Without Login
   [Documentation]  接口名:洗车记录按停车场区进行分组${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  status=${status}  wash_area_id=${wash_area_id}  
   ${unessential_params}  create list  parking_id=${parking_id}  
   run every case by params  Get wash records group by zone Fail 403  ${essential_params}  ${unessential_params}



Get wash_record Success 
   [Documentation]  接口名:洗车记录按停车场区进行分组${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为  列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  status=${status}  wash_area_id=${wash_area_id}  
   ${unessential_params}  create list  parking_id=${parking_id}  
   run every case by params  Get wash records group by zone Success 200  ${essential_params}  ${unessential_params}



Get wash_record Fail With Wrong Params
   [Documentation]  接口名:洗车记录按停车场区进行分组${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  status=${status}  wash_area_id=${wash_area_id}  
   ${unessential_params}  create list  parking_id=${parking_id}  
   run every case by params  Get wash records group by zone Fail 422  ${essential_params}  ${unessential_params}



Get wash_record Fail Without Login
   [Documentation]  接口名:洗车记录根据距离排序${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  radius=${radius}  center=${center}  status=${status}  limit=${limit}  wash_area_id=${wash_area_id}  
   ${unessential_params}  create list  
   run every case by params  Get wash records nearby Fail 403  ${essential_params}  ${unessential_params}



Get wash_record Success 
   [Documentation]  接口名:洗车记录根据距离排序${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 WashRecord 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  radius=${radius}  center=${center}  status=${status}  limit=${limit}  wash_area_id=${wash_area_id}  
   ${unessential_params}  create list  
   run every case by params  Get wash records nearby Success 200  ${essential_params}  ${unessential_params}



Get wash_record Fail With Wrong Params
   [Documentation]  接口名:洗车记录根据距离排序${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  radius=${radius}  center=${center}  status=${status}  limit=${limit}  wash_area_id=${wash_area_id}  
   ${unessential_params}  create list  
   run every case by params  Get wash records nearby Fail 422  ${essential_params}  ${unessential_params}



Get wash_record Fail Without Login
   [Documentation]  接口名:获取洗车记录列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  status=${status}  car_id=${car_id}  wash_group_id=${wash_group_id}  section=${section}  page_limit=${page_limit}  wash_area_id=${wash_area_id}  order_by=${order_by}  floor=${floor}  zone=${zone}  
   run every case by params  Get car wash wash records Fail 403  ${essential_params}  ${unessential_params}



Get wash_record Success 
   [Documentation]  接口名:获取洗车记录列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 WashRecord 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  
   ${unessential_params}  create list  status=${status}  car_id=${car_id}  wash_group_id=${wash_group_id}  section=${section}  page_limit=${page_limit}  wash_area_id=${wash_area_id}  order_by=${order_by}  floor=${floor}  zone=${zone}  
   run every case by params  Get car wash wash records Success 200  ${essential_params}  ${unessential_params}



Get wash_record Fail With Wrong Params
   [Documentation]  接口名:获取洗车记录列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  status=${status}  car_id=${car_id}  wash_group_id=${wash_group_id}  section=${section}  page_limit=${page_limit}  wash_area_id=${wash_area_id}  order_by=${order_by}  floor=${floor}  zone=${zone}  
   run every case by params  Get car wash wash records Fail 422  ${essential_params}  ${unessential_params}



Get wash_record By Id Fail Without Login
   [Documentation]  接口名:获取单个洗车记录${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Get car wash wash records By Id Fail 403  wash_record_id=${wash_record_id}



Get wash_record By Id Fail With Wrong Url
   [Documentation]  接口名:获取单个洗车记录${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   Get car wash wash records By Id Fail 404  wash_record_id=${wrong_url_id}



Get wash_record By Id Success 
   [Documentation]  接口名:获取单个洗车记录${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 WashRecord 对象。
   [Tags]           Respcode:200
   Get car wash wash records By Id Success 200  wash_record_id=${wash_record_id}



Get wash_record By Id Fail With Wrong Params
   [Documentation]  接口名:获取单个洗车记录${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   Get car wash wash records By Id Fail 422  wash_record_id=${wash_record_id}



Get wash_record Fail Without Login
   [Documentation]  接口名:查询车辆是否在场内${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  car_id=${car_id}  
   ${unessential_params}  create list  parking_id=${parking_id}  
   run every case by params  Get car in parking Fail 403  ${essential_params}  ${unessential_params}



Get wash_record Fail With Wrong Url
   [Documentation]  接口名:查询车辆是否在场内${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  car_id=${car_id}  
   ${unessential_params}  create list  parking_id=${parking_id}  
   run every case by params  Get car in parking Fail 404  ${essential_params}  ${unessential_params}



Get wash_record Success 
   [Documentation]  接口名:查询车辆是否在场内${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为  列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  car_id=${car_id}  
   ${unessential_params}  create list  parking_id=${parking_id}  
   run every case by params  Get car in parking Success 200  ${essential_params}  ${unessential_params}



Get wash_record Fail With Wrong Params
   [Documentation]  接口名:查询车辆是否在场内${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  car_id=${car_id}  
   ${unessential_params}  create list  parking_id=${parking_id}  
   run every case by params  Get car in parking Fail 422  ${essential_params}  ${unessential_params}



Patch wash_record By Id Success 
   [Documentation]  接口名:备注${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create list  
   ${unessential_params}  create list  washer_remark=${washer_remark}  
   run every case by params  Patch car wash wash records By Id Success 204  ${essential_params}  ${unessential_params}  wash_record_id/washer_remark=${wash_record_id/washer_remark}



Patch wash_record By Id Fail Without Login
   [Documentation]  接口名:备注${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  washer_remark=${washer_remark}  
   run every case by params  Patch car wash wash records By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/washer_remark=${wash_record_id/washer_remark}



Patch wash_record By Id Fail With Wrong Url
   [Documentation]  接口名:备注${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  
   ${unessential_params}  create list  washer_remark=${washer_remark}  
   run every case by params  Patch car wash wash records By Id Fail 404  ${essential_params}  ${unessential_params}  wash_record_id/washer_remark=${wrong_url_id}



Patch wash_record By Id Fail With Wrong Params
   [Documentation]  接口名:备注${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  washer_remark=${washer_remark}  
   run every case by params  Patch car wash wash records By Id Fail 422  ${essential_params}  ${unessential_params}  wash_record_id/washer_remark=${wash_record_id/washer_remark}



Patch wash_record By Id Success 
   [Documentation]  接口名:标记${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create list  
   ${unessential_params}  create list  mark=${mark}  
   run every case by params  Patch car wash wash records By Id Success 204  ${essential_params}  ${unessential_params}  wash_record_id/mark=${wash_record_id/mark}



Patch wash_record By Id Fail Without Login
   [Documentation]  接口名:标记${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  mark=${mark}  
   run every case by params  Patch car wash wash records By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/mark=${wash_record_id/mark}



Patch wash_record By Id Fail With Wrong Url
   [Documentation]  接口名:标记${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  
   ${unessential_params}  create list  mark=${mark}  
   run every case by params  Patch car wash wash records By Id Fail 404  ${essential_params}  ${unessential_params}  wash_record_id/mark=${wrong_url_id}



Patch wash_record By Id Fail With Wrong Params
   [Documentation]  接口名:标记${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  mark=${mark}  
   run every case by params  Patch car wash wash records By Id Fail 422  ${essential_params}  ${unessential_params}  wash_record_id/mark=${wash_record_id/mark}



Patch wash_record By Id Fail Without Login
   [Documentation]  接口名:修改单个洗车记录状态${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  status=${status}  
   ${unessential_params}  create list  
   run every case by params  Patch car wash wash records By Id Fail 403  ${essential_params}  ${unessential_params}  wash_record_id/status=${wash_record_id/status}



Patch wash_record By Id Fail With Wrong Url
   [Documentation]  接口名:修改单个洗车记录状态${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  status=${status}  
   ${unessential_params}  create list  
   run every case by params  Patch car wash wash records By Id Fail 404  ${essential_params}  ${unessential_params}  wash_record_id/status=${wrong_url_id}



Patch wash_record By Id Success 
   [Documentation]  接口名:修改单个洗车记录状态${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 WashRecord 对象。
   [Tags]           Respcode:200
   ${essential_params}  create list  status=${status}  
   ${unessential_params}  create list  
   run every case by params  Patch car wash wash records By Id Success 200  ${essential_params}  ${unessential_params}  wash_record_id/status=${wash_record_id/status}



Patch wash_record By Id Fail With Wrong Params
   [Documentation]  接口名:修改单个洗车记录状态${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  status=${status}  
   ${unessential_params}  create list  
   run every case by params  Patch car wash wash records By Id Fail 422  ${essential_params}  ${unessential_params}  wash_record_id/status=${wash_record_id/status}



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
Post Car wash wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post update by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Post Car wash wash records By Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  post update by wash record id  &{kwargs}
   expect status is 404  ${resp}  

Post Car wash wash records By Id Success 201
   [Arguments]  &{kwargs}
   ${resp}=  post update by wash record id  &{kwargs}
   expect status is 201  ${resp}  app_wash_record/Post_Car_wash_wash_records_By_Id_201.json
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

Post Car wash wash records By Id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post update by wash record id  &{kwargs}
   expect status is 422  ${resp}  

Post Car wash wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post upload mark by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Post Car wash wash records By Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  post upload mark by wash record id  &{kwargs}
   expect status is 404  ${resp}  

Post Car wash wash records By Id Success 201
   [Arguments]  &{kwargs}
   ${resp}=  post upload mark by wash record id  &{kwargs}
   expect status is 201  ${resp}  app_wash_record/Post_Car_wash_wash_records_By_Id_201.json
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

Post Car wash wash records By Id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post upload mark by wash record id  &{kwargs}
   expect status is 422  ${resp}  

Post Car wash wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post upload by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Post Car wash wash records By Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  post upload by wash record id  &{kwargs}
   expect status is 404  ${resp}  

Post Car wash wash records By Id Success 201
   [Arguments]  &{kwargs}
   ${resp}=  post upload by wash record id  &{kwargs}
   expect status is 201  ${resp}  app_wash_record/Post_Car_wash_wash_records_By_Id_201.json
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

Post Car wash wash records By Id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post upload by wash record id  &{kwargs}
   expect status is 422  ${resp}  

Post Car wash wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post wash by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Post Car wash wash records By Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  post wash by wash record id  &{kwargs}
   expect status is 404  ${resp}  

Post Car wash wash records By Id Success 201
   [Arguments]  &{kwargs}
   ${resp}=  post wash by wash record id  &{kwargs}
   expect status is 201  ${resp}  app_wash_record/Post_Car_wash_wash_records_By_Id_201.json
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

Post Car wash wash records By Id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post wash by wash record id  &{kwargs}
   expect status is 422  ${resp}  

Post Car wash wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post finish by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Post Car wash wash records By Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  post finish by wash record id  &{kwargs}
   expect status is 404  ${resp}  

Post Car wash wash records By Id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  post finish by wash record id  &{kwargs}
   expect status is 204  ${resp}  

Post Car wash wash records By Id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post finish by wash record id  &{kwargs}
   expect status is 422  ${resp}  

Get User wash records Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get user wash records   &{kwargs}
   expect status is 403  ${resp}  

Get User wash records Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get user wash records   &{kwargs}
   expect status is 200  ${resp}  app_wash_record/Get_User_wash_records_200.json
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

Get User wash records Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get user wash records   &{kwargs}
   expect status is 422  ${resp}  

Get Cars in parking Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get cars in parking   &{kwargs}
   expect status is 403  ${resp}  

Get Cars in parking Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get cars in parking   &{kwargs}
   expect status is 200  ${resp}  app_wash_record/Get_Cars_in_parking_200.json
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

Get Cars in parking Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get cars in parking   &{kwargs}
   expect status is 422  ${resp}  

Get Wash records group by zone Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get wash records group by zone   &{kwargs}
   expect status is 403  ${resp}  

Get Wash records group by zone Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get wash records group by zone   &{kwargs}
   expect status is 200  ${resp}  app_wash_record/Get_Wash_records_group_by_zone_200.json
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

Get Wash records group by zone Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get wash records group by zone   &{kwargs}
   expect status is 422  ${resp}  

Get Wash records nearby Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get wash records nearby   &{kwargs}
   expect status is 403  ${resp}  

Get Wash records nearby Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get wash records nearby   &{kwargs}
   expect status is 200  ${resp}  app_wash_record/Get_Wash_records_nearby_200.json
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

Get Wash records nearby Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get wash records nearby   &{kwargs}
   expect status is 422  ${resp}  

Get Car wash wash records Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get car wash wash records   &{kwargs}
   expect status is 403  ${resp}  

Get Car wash wash records Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get car wash wash records   &{kwargs}
   expect status is 200  ${resp}  app_wash_record/Get_Car_wash_wash_records_200.json
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

Get Car wash wash records Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get car wash wash records   &{kwargs}
   expect status is 422  ${resp}  

Get Car wash wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get car wash wash records by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Get Car wash wash records By Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  get car wash wash records by wash record id  &{kwargs}
   expect status is 404  ${resp}  

Get Car wash wash records By Id Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get car wash wash records by wash record id  &{kwargs}
   expect status is 200  ${resp}  app_wash_record/Get_Car_wash_wash_records_By_Id_200.json
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

Get Car wash wash records By Id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get car wash wash records by wash record id  &{kwargs}
   expect status is 422  ${resp}  

Get Car in parking Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get car in parking   &{kwargs}
   expect status is 403  ${resp}  

Get Car in parking Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  get car in parking   &{kwargs}
   expect status is 404  ${resp}  

Get Car in parking Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get car in parking   &{kwargs}
   expect status is 200  ${resp}  app_wash_record/Get_Car_in_parking_200.json
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

Get Car in parking Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get car in parking   &{kwargs}
   expect status is 422  ${resp}  

Patch Car wash wash records By Id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  patch washer remark by wash record id  &{kwargs}
   expect status is 204  ${resp}  

Patch Car wash wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch washer remark by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch Car wash wash records By Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  patch washer remark by wash record id  &{kwargs}
   expect status is 404  ${resp}  

Patch Car wash wash records By Id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  patch washer remark by wash record id  &{kwargs}
   expect status is 422  ${resp}  

Patch Car wash wash records By Id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  patch mark by wash record id  &{kwargs}
   expect status is 204  ${resp}  

Patch Car wash wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch mark by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch Car wash wash records By Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  patch mark by wash record id  &{kwargs}
   expect status is 404  ${resp}  

Patch Car wash wash records By Id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  patch mark by wash record id  &{kwargs}
   expect status is 422  ${resp}  

Patch Car wash wash records By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch status by wash record id  &{kwargs}
   expect status is 403  ${resp}  

Patch Car wash wash records By Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  patch status by wash record id  &{kwargs}
   expect status is 404  ${resp}  

Patch Car wash wash records By Id Success 200
   [Arguments]  &{kwargs}
   ${resp}=  patch status by wash record id  &{kwargs}
   expect status is 200  ${resp}  app_wash_record/Patch_Car_wash_wash_records_By_Id_200.json

Patch Car wash wash records By Id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  patch status by wash record id  &{kwargs}
   expect status is 422  ${resp}  

