*** Settings ***
Documentation  wxmp_wash_record
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.wash_record.WashRecordLibrary
Suite Setup  login by unionid   ${unionid}
Force Tags  model:wxmp_wash_record  车主微信端


*** Test Cases ***
get user wash records total number Success 
   [Documentation]  接口名:洗车记录总数${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为  列表。
   [Tags]           Respcode:200
    get user wash records total number success 200

get user after sales Success 
   [Documentation]  接口名:售后与退款${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 WashRecord 列表。
   [Tags]           Respcode:200
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  status=${status}  order_status=${order_status}  after_sale=${after_sale}  section=${section}  page_limit=${page_limit}  
   run every case by params   get user after sales success 200   ${essential_params}  ${unessential_params}

get user after sales Fail With Wrong Params
   [Documentation]  接口名:售后与退款${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  status=${status_422}  order_status=${order_status_422}  after_sale=${after_sale_422}  section=${section_422}  page_limit=${page_limit_422}  
   run every case by params   get user after sales fail 422   ${essential_params}  ${unessential_params}  success=False

get user wash record by order Success 
   [Documentation]  接口名:用订单id获取一洗车记录${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 WashRecord 列表。
   [Tags]           Respcode:200
   ${essential_params}  create dictionary  order_id=${order_id}  
   ${unessential_params}  create dictionary  refresh=False  
   run every case by params   get user wash record by order success 200   ${essential_params}  ${unessential_params}

get user wash record by order Fail With Wrong Params
   [Documentation]  接口名:用订单id获取一洗车记录${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  order_id=${order_id_422}  
   ${unessential_params}  create dictionary  refresh=ThisIsRobot!  
   run every case by params   get user wash record by order fail 422   ${essential_params}  ${unessential_params}  success=False

get user wash records Success 
   [Documentation]  接口名:获取洗车记录列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 WashRecord 列表。
   [Tags]           Respcode:200
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  status=${status}  order_status=${order_status}  section=${section}  page_limit=${page_limit}  comment_status=${comment_status}  
   run every case by params   get user wash records success 200   ${essential_params}  ${unessential_params}

get user wash records Fail With Wrong Params
   [Documentation]  接口名:获取洗车记录列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  status=${status_422}  order_status=${order_status_422}  section=${section_422}  page_limit=${page_limit_422}  comment_status=${comment_status_422}  
   run every case by params   get user wash records fail 422   ${essential_params}  ${unessential_params}  success=False

get wash records Success 
   [Documentation]  接口名:获取记录列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 WashRecord 列表。
   [Tags]           Respcode:200
   ${essential_params}  create dictionary  wash_group_id=${wash_group_id}  
   ${unessential_params}  create dictionary  section=${section}  page_limit=${page_limit}  
   run every case by params   get wash records success 200   ${essential_params}  ${unessential_params}

get wash records Fail With Wrong Params
   [Documentation]  接口名:获取记录列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  wash_group_id=${wash_group_id_422}  
   ${unessential_params}  create dictionary  section=${section_422}  page_limit=${page_limit_422}  
   run every case by params   get wash records fail 422   ${essential_params}  ${unessential_params}  success=False


*** Keywords ***
get user wash records total number Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get user wash records total number  &{kwargs}
   expect status is 200  ${resp}  wxmp_wash_record/get_user_wash_records_total_number_200.json

get user after sales Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get user after sales  &{kwargs}
   expect status is 200  ${resp}  wxmp_wash_record/get_user_after_sales_200.json

get user after sales Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get user after sales  &{kwargs}
   expect status is 422  ${resp}  

get user wash record by order Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get user wash record by order  &{kwargs}
   expect status is 200  ${resp}  wxmp_wash_record/get_user_wash_record_by_order_200.json

get user wash record by order Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get user wash record by order  &{kwargs}
   expect status is 422  ${resp}  

get user wash records Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get user wash records  &{kwargs}
   expect status is 200  ${resp}  wxmp_wash_record/get_user_wash_records_200.json

get user wash records Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get user wash records  &{kwargs}
   expect status is 422  ${resp}  

get wash records Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get wash records  &{kwargs}
   expect status is 200  ${resp}  wxmp_wash_record/get_wash_records_200.json

get wash records Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get wash records  &{kwargs}
   expect status is 422  ${resp}  

