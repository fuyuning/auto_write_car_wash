*** Settings ***
Documentation  admin_wechat_keyword
Resource  ../resources.robot
Library  robot_car_wash_server_library.wechat_keyword.WechatKeywordLibrary
Suite Setup  Login  ${admin_username}   ${admin_password}
Suite Teardown  Logout
Force Tags  model:admin_wechat_keyword  虾洗后台


*** Test Cases ***
Post wechat Keyword import Success 
   [Documentation]  接口名:微信图片上传${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为  列表。
   [Tags]           Respcode:200
    Post wechat Keyword import Success 200

Get Admin Wechat Keywords By Wechat Keyword Id Success 
   [Documentation]  接口名:修改查询[1条]--公众号关键字回复${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 WechatKeyword 对象。
   [Tags]           Respcode:200
   Get Admin Wechat Keywords By Wechat Keyword Id Success 200  wechat_keyword_id=${wechat_keyword_id}

Get Admin Wechat Keywords By Wechat Keyword Id Fail With Wrong Url
   [Documentation]  接口名:修改查询[1条]--公众号关键字回复${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   Get Admin Wechat Keywords By Wechat Keyword Id Fail 404  wechat_keyword_id=${wrong_url_id}


*** Variables ***
${wechat_keyword_id}  


*** Keywords ***
Post wechat Keyword import Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Post wechat Keyword import   &{kwargs}
   expect status is 200  ${resp}  admin_wechat_keyword/Post_wechat_Keyword_import_200.json
   ${wechat_keyword_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wechat_keyword_id]}
   set global variable   ${wechat_keyword_id}

Get Admin Wechat Keywords By Wechat Keyword Id Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Wechat Keywords By Wechat Keyword Id   &{kwargs}
   expect status is 200  ${resp}  admin_wechat_keyword/Get_Admin_Wechat_Keywords_By_Wechat_Keyword_Id_200.json
   ${wechat_keyword_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wechat_keyword_id]}
   set global variable   ${wechat_keyword_id}

Get Admin Wechat Keywords By Wechat Keyword Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Wechat Keywords By Wechat Keyword Id   &{kwargs}
   expect status is 404  ${resp}  

