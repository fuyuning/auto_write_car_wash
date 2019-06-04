*** Settings ***
Documentation  admin_area_calendar
Resource  ../resources.robot
Library  robot_car_wash_server_library.area_calendar.AreaCalendarLibrary
Suite Setup  Login  ${username}   ${password}
Suite Teardown  Logout
Force Tags  model:admin_area_calendar  虾洗后台


*** Test Cases ***
post admin area calendars Success 
   [Documentation]  接口名:添加区域日历${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 201,返回的Json数据符合验证。
   [Tags]           Respcode:201
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  wash_area_id=${wash_area_id}  calendar=${calendar}  
   run every case by params   post admin area calendars success 201   ${essential_params}  ${unessential_params}

post admin area calendars Fail With Wrong Params
   [Documentation]  接口名:添加区域日历${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  wash_area_id=${wash_area_id_422}  calendar=${calendar_422}  
   run every case by params   post admin area calendars fail 422   ${essential_params}  ${unessential_params}  success=False

get admin area calendars Success 
   [Documentation]  接口名:查询区域日历${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 AreaCalendar 列表。
   [Tags]           Respcode:200
   ${essential_params}  create dictionary  wash_area_id=${wash_area_id}  year=${year}  
   ${unessential_params}  create dictionary  month=${month}  
   run every case by params   get admin area calendars success 200   ${essential_params}  ${unessential_params}

get admin area calendars Fail With Wrong Params
   [Documentation]  接口名:查询区域日历${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  wash_area_id=${wash_area_id_422}  year=${year_422}  
   ${unessential_params}  create dictionary  month=${month_422}  
   run every case by params   get admin area calendars fail 422   ${essential_params}  ${unessential_params}  success=False

delete admin area calendars by area calendar id Success 
   [Documentation]  接口名:删除区域日历${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   delete admin area calendars by area calendar id success 204     area_calendar_id=${area_calendar_id}

delete admin area calendars by area calendar id Fail With Wrong Url
   [Documentation]  接口名:删除区域日历${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   delete admin area calendars by area calendar id fail 404     area_calendar_id=${wrong_url_id}


*** Variables ***
${area_calendar_id}  


*** Keywords ***
post admin area calendars Success 201
   [Arguments]  &{kwargs}
   ${resp}=  post admin area calendars  &{kwargs}
   expect status is 201  ${resp}  admin_area_calendar/post_admin_area_calendars_201.json
   ${area_calendar_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0]['area_calendar_id']}
   set global variable   ${area_calendar_id}

post admin area calendars Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post admin area calendars  &{kwargs}
   expect status is 422  ${resp}  

get admin area calendars Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin area calendars  &{kwargs}
   expect status is 200  ${resp}  admin_area_calendar/get_admin_area_calendars_200.json
   ${area_calendar_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0]['area_calendar_id']}
   set global variable   ${area_calendar_id}

get admin area calendars Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get admin area calendars  &{kwargs}
   expect status is 422  ${resp}  

delete admin area calendars by area calendar id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  delete admin area calendars by area calendar id  &{kwargs}
   expect status is 204  ${resp}  

delete admin area calendars by area calendar id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  delete admin area calendars by area calendar id  &{kwargs}
   expect status is 404  ${resp}  

