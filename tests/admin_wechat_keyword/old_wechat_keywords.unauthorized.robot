*** Settings ***
Documentation  admin_wechat_keyword
Resource  ../resources.robot
Library  robot_car_wash_server_library.wechat_keyword.WechatKeywordLibrary
Force Tags  model:admin_wechat_keyword  虾洗后台


*** Test Cases ***
Post wechat Keyword import Fail Without Login
   [Documentation]  接口名:微信图片上传${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
    Post wechat Keyword import Fail 403

Get Admin Wechat Keywords By Wechat Keyword Id Fail Without Login
   [Documentation]  接口名:修改查询[1条]--公众号关键字回复${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Get Admin Wechat Keywords By Wechat Keyword Id Fail 403  wechat_keyword_id=${wechat_keyword_id}


*** Variables ***
${wechat_keyword_id}  12345678909876543


*** Keywords ***
Post wechat Keyword import Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Post wechat Keyword import   &{kwargs}
   expect status is 403  ${resp}  

Get Admin Wechat Keywords By Wechat Keyword Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Wechat Keywords By Wechat Keyword Id   &{kwargs}
   expect status is 403  ${resp}  

