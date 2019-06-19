*** Settings ***
Documentation  wxmp_lucky_flop
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.lucky_flop.LuckyFlopLibrary
Suite Setup  login by unionid   ${unionid}
Force Tags  model:wxmp_lucky_flop  车主微信端


*** Test Cases ***
post user lucky flop Success 
   [Documentation]  接口名:去翻牌${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 LuckyFlopAward 列表。
   [Tags]           Respcode:200
   ${essential_params}  create dictionary  wash_normal_id=${wash_normal_id}  parking_id=${parking_id}  service_group_id=${service_group_id}  car_series_id=${car_series_id}  
   ${unessential_params}  create dictionary  
   run every case by params   post user lucky flop success 200   ${essential_params}  ${unessential_params}

post user lucky flop Fail With Wrong Params
   [Documentation]  接口名:去翻牌${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  wash_normal_id=${wash_normal_id_422}  parking_id=${parking_id_422}  service_group_id=${service_group_id_422}  car_series_id=${car_series_id_422}  
   ${unessential_params}  create dictionary  
   run every case by params   post user lucky flop fail 422   ${essential_params}  ${unessential_params}  success=False

post user lucky flop award Success 
   [Documentation]  接口名:上传翻牌金额${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为  列表。
   [Tags]           Respcode:200
   ${essential_params}  create dictionary  lucky_flop_award_id=${lucky_flop_award_id}  wash_normal_id=${wash_normal_id}  lucky_flop_id=${lucky_flop_id}  custom_price=${custom_price}  
   ${unessential_params}  create dictionary  
   run every case by params   post user lucky flop award success 200   ${essential_params}  ${unessential_params}

post user lucky flop award Fail With Wrong Params
   [Documentation]  接口名:上传翻牌金额${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  lucky_flop_award_id=${lucky_flop_award_id_422}  wash_normal_id=${wash_normal_id_422}  lucky_flop_id=${lucky_flop_id_422}  custom_price=${custom_price_422}  
   ${unessential_params}  create dictionary  
   run every case by params   post user lucky flop award fail 422   ${essential_params}  ${unessential_params}  success=False

post user lucky flop Success 
   [Documentation]  接口名:去翻牌${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 LuckyFlopAward 列表。
   [Tags]           Respcode:200
   ${essential_params}  create dictionary  wash_normal_id=${wash_normal_id}  parking_id=${parking_id}  service_group_id=${service_group_id}  car_series_id=${car_series_id}  
   ${unessential_params}  create dictionary  
   run every case by params   post user lucky flop success 200   ${essential_params}  ${unessential_params}

post user lucky flop Fail With Wrong Params
   [Documentation]  接口名:去翻牌${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  wash_normal_id=${wash_normal_id_422}  parking_id=${parking_id_422}  service_group_id=${service_group_id_422}  car_series_id=${car_series_id_422}  
   ${unessential_params}  create dictionary  
   run every case by params   post user lucky flop fail 422   ${essential_params}  ${unessential_params}  success=False

post user lucky flop award Success 
   [Documentation]  接口名:上传翻牌金额${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为  列表。
   [Tags]           Respcode:200
   ${essential_params}  create dictionary  lucky_flop_award_id=${lucky_flop_award_id}  wash_normal_id=${wash_normal_id}  lucky_flop_id=${lucky_flop_id}  custom_price=${custom_price}  
   ${unessential_params}  create dictionary  
   run every case by params   post user lucky flop award success 200   ${essential_params}  ${unessential_params}

post user lucky flop award Fail With Wrong Params
   [Documentation]  接口名:上传翻牌金额${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  lucky_flop_award_id=${lucky_flop_award_id_422}  wash_normal_id=${wash_normal_id_422}  lucky_flop_id=${lucky_flop_id_422}  custom_price=${custom_price_422}  
   ${unessential_params}  create dictionary  
   run every case by params   post user lucky flop award fail 422   ${essential_params}  ${unessential_params}  success=False

get user can lucky flop Success 
   [Documentation]  接口名:我的翻牌资格${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为  列表。
   [Tags]           Respcode:200
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  wash_normal_id=${wash_normal_id}  
   run every case by params   get user can lucky flop success 200   ${essential_params}  ${unessential_params}

get user can lucky flop Fail With Wrong Params
   [Documentation]  接口名:我的翻牌资格${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  wash_normal_id=${wash_normal_id_422}  
   run every case by params   get user can lucky flop fail 422   ${essential_params}  ${unessential_params}  success=False

get user lucky flop Success 
   [Documentation]  接口名:获取我的翻牌内容${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为  列表。
   [Tags]           Respcode:200
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  wash_normal_id=${wash_normal_id}  
   run every case by params   get user lucky flop success 200   ${essential_params}  ${unessential_params}

get user lucky flop Fail With Wrong Params
   [Documentation]  接口名:获取我的翻牌内容${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  wash_normal_id=${wash_normal_id_422}  
   run every case by params   get user lucky flop fail 422   ${essential_params}  ${unessential_params}  success=False

get user can lucky flop Success 
   [Documentation]  接口名:我的翻牌资格${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为  列表。
   [Tags]           Respcode:200
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  wash_normal_id=${wash_normal_id}  
   run every case by params   get user can lucky flop success 200   ${essential_params}  ${unessential_params}

get user can lucky flop Fail With Wrong Params
   [Documentation]  接口名:我的翻牌资格${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  wash_normal_id=${wash_normal_id_422}  
   run every case by params   get user can lucky flop fail 422   ${essential_params}  ${unessential_params}  success=False

get user lucky flop Success 
   [Documentation]  接口名:获取我的翻牌内容${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为  列表。
   [Tags]           Respcode:200
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  wash_normal_id=${wash_normal_id}  
   run every case by params   get user lucky flop success 200   ${essential_params}  ${unessential_params}

get user lucky flop Fail With Wrong Params
   [Documentation]  接口名:获取我的翻牌内容${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  wash_normal_id=${wash_normal_id_422}  
   run every case by params   get user lucky flop fail 422   ${essential_params}  ${unessential_params}  success=False


*** Keywords ***
post user lucky flop Success 200
   [Arguments]  &{kwargs}
   ${resp}=  post user lucky flop  &{kwargs}
   expect status is 200  ${resp}  wxmp_lucky_flop/post_user_lucky_flop_200.json

post user lucky flop Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post user lucky flop  &{kwargs}
   expect status is 422  ${resp}  

post user lucky flop award Success 200
   [Arguments]  &{kwargs}
   ${resp}=  post user lucky flop award  &{kwargs}
   expect status is 200  ${resp}  wxmp_lucky_flop/post_user_lucky_flop_award_200.json

post user lucky flop award Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post user lucky flop award  &{kwargs}
   expect status is 422  ${resp}  

post user lucky flop Success 200
   [Arguments]  &{kwargs}
   ${resp}=  post user lucky flop  &{kwargs}
   expect status is 200  ${resp}  wxmp_lucky_flop/post_user_lucky_flop_200.json

post user lucky flop Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post user lucky flop  &{kwargs}
   expect status is 422  ${resp}  

post user lucky flop award Success 200
   [Arguments]  &{kwargs}
   ${resp}=  post user lucky flop award  &{kwargs}
   expect status is 200  ${resp}  wxmp_lucky_flop/post_user_lucky_flop_award_200.json

post user lucky flop award Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post user lucky flop award  &{kwargs}
   expect status is 422  ${resp}  

get user can lucky flop Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get user can lucky flop  &{kwargs}
   expect status is 200  ${resp}  wxmp_lucky_flop/get_user_can_lucky_flop_200.json

get user can lucky flop Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get user can lucky flop  &{kwargs}
   expect status is 422  ${resp}  

get user lucky flop Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get user lucky flop  &{kwargs}
   expect status is 200  ${resp}  wxmp_lucky_flop/get_user_lucky_flop_200.json

get user lucky flop Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get user lucky flop  &{kwargs}
   expect status is 422  ${resp}  

get user can lucky flop Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get user can lucky flop  &{kwargs}
   expect status is 200  ${resp}  wxmp_lucky_flop/get_user_can_lucky_flop_200.json

get user can lucky flop Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get user can lucky flop  &{kwargs}
   expect status is 422  ${resp}  

get user lucky flop Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get user lucky flop  &{kwargs}
   expect status is 200  ${resp}  wxmp_lucky_flop/get_user_lucky_flop_200.json

get user lucky flop Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get user lucky flop  &{kwargs}
   expect status is 422  ${resp}  

