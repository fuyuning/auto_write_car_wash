*** Settings ***
Documentation  admin_area_calendar
Resource  ../resources.robot
Library  robot_car_wash_server_library.area_calendar.AreaCalendarLibrary
Force Tags  model:admin_area_calendar  虾洗后台


*** Test Cases ***
post admin area calendars Fail Without Login
   [Documentation]  接口名:添加区域日历${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   post admin area calendars fail 403     wash_area_id=${wash_area_id}  calendar=${calendar}  

get admin area calendars Fail Without Login
   [Documentation]  接口名:查询区域日历${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get admin area calendars fail 403   wash_area_id=${wash_area_id}  year=${year}    month=${month}  

delete admin area calendars by area calendar id Fail Without Login
   [Documentation]  接口名:删除区域日历${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   delete admin area calendars by area calendar id fail 403     area_calendar_id=${area_calendar_id}


*** Variables ***
${area_calendar_id}  1a2b3c4d5e6f7zz


*** Keywords ***
post admin area calendars Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post admin area calendars  &{kwargs}
   expect status is 403  ${resp}  

get admin area calendars Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin area calendars  &{kwargs}
   expect status is 403  ${resp}  

delete admin area calendars by area calendar id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  delete admin area calendars by area calendar id  &{kwargs}
   expect status is 403  ${resp}  

