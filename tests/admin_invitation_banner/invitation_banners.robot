*** Settings ***
Documentation  admin_invitation_banner
Resource  ../resources.robot
Library  robot_car_wash_server_library.invitation_banner.InvitationBannerLibrary
Suite Setup  Login  ${username}   ${password}
Suite Teardown  Logout
Force Tags  model:admin_invitation_banner  虾洗后台


*** Test Cases ***
get admin invitation banner Success 
   [Documentation]  接口名:获取邀请好友界面设置${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 InvitationBanner 列表。
   [Tags]           Respcode:200
    get admin invitation banner success 200

put admin invitation banner by invitation banner id Fail With Wrong Url
   [Documentation]  接口名:邀请好友界面设置修改${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   put admin invitation banner by invitation banner id fail 404     invitation_banner_id=${wrong_url_id}    entrance_banner=${entrance_banner}  interface_poster=${interface_poster}  

put admin invitation banner by invitation banner id Success 
   [Documentation]  接口名:邀请好友界面设置修改${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  entrance_banner=${entrance_banner}  interface_poster=${interface_poster}  
   run every case by params   put admin invitation banner by invitation banner id success 204   ${essential_params}  ${unessential_params}    invitation_banner_id=${invitation_banner_id}

put admin invitation banner by invitation banner id Fail With Wrong Params
   [Documentation]  接口名:邀请好友界面设置修改${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  entrance_banner=${entrance_banner_422}  interface_poster=${interface_poster_422}  
   run every case by params   put admin invitation banner by invitation banner id fail 422   ${essential_params}  ${unessential_params}    invitation_banner_id=${invitation_banner_id}  success=False


*** Variables ***
${invitation_banner_id}  


*** Keywords ***
get admin invitation banner Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin invitation banner  &{kwargs}
   expect status is 200  ${resp}  admin_invitation_banner/get_admin_invitation_banner_200.json
   ${invitation_banner_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0]['invitation_banner_id']}
   set global variable   ${invitation_banner_id}

put admin invitation banner by invitation banner id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  put admin invitation banner by invitation banner id  &{kwargs}
   expect status is 404  ${resp}  

put admin invitation banner by invitation banner id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  put admin invitation banner by invitation banner id  &{kwargs}
   expect status is 204  ${resp}  

put admin invitation banner by invitation banner id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  put admin invitation banner by invitation banner id  &{kwargs}
   expect status is 422  ${resp}  

