*** Settings ***
Documentation  admin_car_washer_wage
Resource  ../resources.robot
Library  robot_car_wash_server_library.car_washer_wage.CarWasherWageLibrary
Suite Setup  Login  ${username}   ${password}
Suite Teardown  Logout
Force Tags  model:admin_car_washer_wage  虾洗后台


*** Test Cases ***
get admin car washer wages Success 
   [Documentation]  接口名:工资结算${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 CarWasherWage 列表。
   [Tags]           Respcode:200
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  username=${username}  name=${name}  end_time=${end_time}  page_num=${page_num}  page_size=${page_size}  
   run every case by params   get admin car washer wages success 200   ${essential_params}  ${unessential_params}

get admin car washer wages Fail With Wrong Params
   [Documentation]  接口名:工资结算${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  username=${username_422}  name=${name_422}  end_time=${end_time_422}  page_num=${page_num_422}  page_size=${page_size_422}  
   run every case by params   get admin car washer wages fail 422   ${essential_params}  ${unessential_params}  success=False

get admin car washer wages by car washer wage id Fail With Wrong Url
   [Documentation]  接口名:工资明细${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   get admin car washer wages by car washer wage id fail 404     car_washer_wage_id=${wrong_url_id}

get admin car washer wages by car washer wage id Success 
   [Documentation]  接口名:工资明细${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 CarWasherWage 对象。
   [Tags]           Respcode:200
   get admin car washer wages by car washer wage id success 200     car_washer_wage_id=${car_washer_wage_id}

get admin car washer wages export Success 
   [Documentation]  接口名:虾克工资导出${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为  列表。
   [Tags]           Respcode:200
    get admin car washer wages export success 200


*** Variables ***
${car_washer_wage_id}  


*** Keywords ***
get admin car washer wages Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin car washer wages  &{kwargs}
   expect status is 200  ${resp}  admin_car_washer_wage/get_admin_car_washer_wages_200.json
   ${car_washer_wage_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0]['car_washer_wage_id']}
   set global variable   ${car_washer_wage_id}

get admin car washer wages Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get admin car washer wages  &{kwargs}
   expect status is 422  ${resp}  

get admin car washer wages by car washer wage id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  get admin car washer wages by car washer wage id  &{kwargs}
   expect status is 404  ${resp}  

get admin car washer wages by car washer wage id Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin car washer wages by car washer wage id  &{kwargs}
   expect status is 200  ${resp}  admin_car_washer_wage/get_admin_car_washer_wages_by_car_washer_wage_id_200.json
   ${car_washer_wage_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0]['car_washer_wage_id']}
   set global variable   ${car_washer_wage_id}

get admin car washer wages export Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin car washer wages export  &{kwargs}
   expect status is 200  ${resp}  admin_car_washer_wage/get_admin_car_washer_wages_export_200.json
   ${car_washer_wage_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0]['car_washer_wage_id']}
   set global variable   ${car_washer_wage_id}

