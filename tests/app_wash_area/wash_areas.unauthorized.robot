*** Settings ***
Documentation  app_wash_area
Resource  ../resources.robot
Library  robot_washing_expert_library.wash_area.WashAreaLibrary
Force Tags  model:app_wash_area  虾客APP


*** Test Cases ***
get car wash wash areas Fail Without Login
   [Documentation]  接口名:获取全部洗车区域列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get car wash wash areas fail 403     section=${section}  condition=${condition}  


*** Keywords ***
get car wash wash areas Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get car wash wash areas  &{kwargs}
   expect status is 403  ${resp}  

