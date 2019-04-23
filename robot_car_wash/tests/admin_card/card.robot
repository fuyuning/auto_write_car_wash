*** Settings ***Documentation  admin_cardResource  ../resources.robotLibrary  robot_car_wash_server_library.card.CardLibrarySuite Setup  Login  ${admin_username}   ${admin_password}Suite Teardown  LogoutForce Tags  model:admin_card  虾洗后台*** Test Cases ***Post Card Success    [Documentation]  接口名:创建会员卡${\n}   ...              请求方式:Post${\n}   ...              预期结果:   [Tags]           Respcode:201   ${essential_params}  create list     ${unessential_params}  create list     run every case by params  Post Success 201  ${essential_params}  ${unessential_params}Post Card Fail With Wrong Params   [Documentation]  接口名:创建会员卡${\n}   ...              请求方式:Post${\n}   ...              预期结果:   [Tags]           Respcode:422   ${essential_params}  create list     ${unessential_params}  create list     run every case by params  Post Fail 422  ${essential_params}  ${unessential_params}Post Card Fail Without Login   [Documentation]  接口名:创建会员卡${\n}   ...              请求方式:Post${\n}   ...              预期结果:   [Tags]           Respcode:403   ${essential_params}  create list     ${unessential_params}  create list     run every case by params  Post Fail 403  ${essential_params}  ${unessential_params}Put Card By Id Success    [Documentation]  接口名:修改会员卡${\n}   ...              请求方式:Put${\n}   ...              预期结果:   [Tags]           Respcode:204   ${essential_params}  create list     ${unessential_params}  create list     run every case by params  Put By Id Success 204  ${essential_params}  ${unessential_params}  card_id=Put Card By Id Fail Without Login   [Documentation]  接口名:修改会员卡${\n}   ...              请求方式:Put${\n}   ...              预期结果:   [Tags]           Respcode:403   ${essential_params}  create list     ${unessential_params}  create list     run every case by params  Put By Id Fail 403  ${essential_params}  ${unessential_params}  card_id=Put Card By Id Fail With Wrong Params   [Documentation]  接口名:修改会员卡${\n}   ...              请求方式:Put${\n}   ...              预期结果:   [Tags]           Respcode:422   ${essential_params}  create list     ${unessential_params}  create list     run every case by params  Put By Id Fail 422  ${essential_params}  ${unessential_params}  card_id=Put Card By Id Fail With Wrong Url   [Documentation]  接口名:修改会员卡${\n}   ...              请求方式:Put${\n}   ...              预期结果:   [Tags]           Respcode:404   ${essential_params}  create list     ${unessential_params}  create list     run every case by params  Put By Id Fail 404  ${essential_params}  ${unessential_params}  card_id=Get Card Success    [Documentation]  接口名:查询会员卡${\n}   ...              请求方式:Get${\n}   ...              预期结果:   [Tags]           Respcode:200   ${essential_params}  create list     ${unessential_params}  create list     run every case by params  Get Success 200  ${essential_params}  ${unessential_params}Get Card Fail Without Login   [Documentation]  接口名:查询会员卡${\n}   ...              请求方式:Get${\n}   ...              预期结果:   [Tags]           Respcode:403   ${essential_params}  create list     ${unessential_params}  create list     run every case by params  Get Fail 403  ${essential_params}  ${unessential_params}Get Card Fail With Wrong Params   [Documentation]  接口名:查询会员卡${\n}   ...              请求方式:Get${\n}   ...              预期结果:   [Tags]           Respcode:422   ${essential_params}  create list     ${unessential_params}  create list     run every case by params  Get Fail 422  ${essential_params}  ${unessential_params}Delete Card By Id Success    [Documentation]  接口名:删除会员卡${\n}   ...              请求方式:Delete${\n}   ...              预期结果:   [Tags]           Respcode:204   ${essential_params}  create list     ${unessential_params}  create list     run every case by params  Delete By Id Success 204  ${essential_params}  ${unessential_params}  card_id=Delete Card By Id Fail With Wrong Url   [Documentation]  接口名:删除会员卡${\n}   ...              请求方式:Delete${\n}   ...              预期结果:   [Tags]           Respcode:404   ${essential_params}  create list     ${unessential_params}  create list     run every case by params  Delete By Id Fail 404  ${essential_params}  ${unessential_params}  card_id=Delete Card By Id Fail Without Login   [Documentation]  接口名:删除会员卡${\n}   ...              请求方式:Delete${\n}   ...              预期结果:   [Tags]           Respcode:403   ${essential_params}  create list     ${unessential_params}  create list     run every case by params  Delete By Id Fail 403  ${essential_params}  ${unessential_params}  card_id=*** Keywords ***Post Success 201   [Arguments]  &{kwargs}   ${resp}=  post card by   &{kwargs}   expect status is 201  ${resp}  admin_card/Post_201.jsonPost Fail 422   [Arguments]  &{kwargs}   ${resp}=  post card by   &{kwargs}   expect status is 422  ${resp}  admin_card/Post_422.jsonPost Fail 403   [Arguments]  &{kwargs}   ${resp}=  post card by   &{kwargs}   expect status is 403  ${resp}  Put By Id Success 204   [Arguments]  &{kwargs}   ${resp}=  put card by card id  &{kwargs}   expect status is 204  ${resp}  Put By Id Fail 403   [Arguments]  &{kwargs}   ${resp}=  put card by card id  &{kwargs}   expect status is 403  ${resp}  Put By Id Fail 422   [Arguments]  &{kwargs}   ${resp}=  put card by card id  &{kwargs}   expect status is 422  ${resp}  admin_card/Put_By_Id_422.jsonPut By Id Fail 404   [Arguments]  &{kwargs}   ${resp}=  put card by card id  &{kwargs}   expect status is 404  ${resp}  Get Success 200   [Arguments]  &{kwargs}   ${resp}=  get card by   &{kwargs}   expect status is 200  ${resp}  admin_card/Get_200.jsonGet Fail 403   [Arguments]  &{kwargs}   ${resp}=  get card by   &{kwargs}   expect status is 403  ${resp}  Get Fail 422   [Arguments]  &{kwargs}   ${resp}=  get card by   &{kwargs}   expect status is 422  ${resp}  admin_card/Get_422.jsonDelete By Id Success 204   [Arguments]  &{kwargs}   ${resp}=  delete card by card id  &{kwargs}   expect status is 204  ${resp}  Delete By Id Fail 404   [Arguments]  &{kwargs}   ${resp}=  delete card by card id  &{kwargs}   expect status is 404  ${resp}  Delete By Id Fail 403   [Arguments]  &{kwargs}   ${resp}=  delete card by card id  &{kwargs}   expect status is 403  ${resp}  