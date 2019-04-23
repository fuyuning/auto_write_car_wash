*** Settings ***
Resource        resources/resources-${VERSION}.robot
Resource        resources/params.robot
Library         JSONSchemaLibrary  tests
Library         UtilsLibrary.BaseUtilsLibrary
*** Variables ***
@{422list}   ImRobotTest1  ImRobotTest2  ImRobotTest3
${admin_username}  admin
${admin_password}  admin123
${app_username}  987654321
${app_password}  fuyuning123
${wrong_url_id}  000000000000000000ZZZZZZZZZZZZZZZZ0000000000000000000000
*** Keywords ***
Status Should be
    [Documentation]     检测响应状态是否符合预期值。
    ...                 {resp}: 响应实体。
    ...                 {status_code}: 预期的响应状态。
    [Arguments]         ${resp}  ${status_code}
    # 跑全局需注释掉log
    log                 ${resp.content}
    log                 ${resp.url}
    Should Be Equal As Integers    ${resp.status_code}  ${status_code}
    [Teardown]          run keyword if  '${KEYWORD_STATUS}'=='FAIL'  log  ${SUITE_NAME}模块中的接口：${resp.url[36:]} 错误。test_case：${TEST_NAME}:应返回${status_code}，但返回${resp.status_code}。  WARN
    [Return]            ${KEYWORD_STATUS}

To Validate Json
    [Documentation]     检测响应状态是否符合预期值。
    ...                 {schema}:JsonSchema验证。
    ...                 {resp}:响应实体。
    [Arguments]         ${schema}  ${resp}
    pass execution if  '${schema}'=='NoSchema'  无需验证Json，通过。
    validate json       ${schema}  ${resp.json()}
    [Teardown]          run keyword if  '${KEYWORD_STATUS}'=='FAIL'  Log  ${SUITE_NAME}模块中的接口：${resp.url[36:]}错误。test_case：${TEST_NAME}:Json验证错误。  ERROR
    [Return]            ${KEYWORD_STATUS}

Expect Status is 200
    [Documentation]     期待响应状态是否为200 OK，返回的json格式是否符合验证。
    ...                 {resp}: 响应实体。
    ...                 {schema}: 对应的jsonschema校验文件。
    [Arguments]         ${resp}  ${schema}
    ${bug_level}=       auto create bug level tag  ${resp.status_code}  200
    set tags            ${bug_level}
    ${status_tag}=      auto create status tag  ${resp.status_code}  200
    set tags            ${status_tag}
    ${re}               set variable   FAIL
    ${js}               set variable   FAIL
    ${re}=              status should be    ${resp}  200
    ${js}=              to validate json    ${schema}  ${resp}
    [Teardown]          auto creat jsonerror tag  ${re}  ${js}

Expect Status is 201
    [Documentation]     检测响应状态是否为201 Created，返回的json格式是否符合验证。
    ...                 {resp}: 响应实体。
    ...                 {schema}: 对应的jsonschema校验文件。
    [Arguments]         ${resp}  ${schema}
    ${bug_level}=       auto create bug level tag  ${resp.status_code}  201
    set tags            ${bug_level}
    ${status_tag}=      auto create status tag  ${resp.status_code}  201
    set tags            ${status_tag}
    ${re}               set variable   FAIL
    ${js}               set variable   FAIL
    ${re}=              status should be    ${resp}  201
    ${js}=              to validate json    ${schema}  ${resp}
    [Teardown]          auto creat jsonerror tag  ${re}  ${js}

Expect Status is 204
    [Documentation]     检测响应状态是否为204 No Content。
    ...                 {resp}: 响应实体。
    [Arguments]         ${resp}
    ${bug_level}=       auto create bug level tag  ${resp.status_code}  204
    set tags            ${bug_level}
    ${status_tag}=      auto create status tag  ${resp.status_code}  204
    set tags            ${status_tag}
    Status Should be    ${resp}  204

Expect Status is 403
    [Documentation]     检测响应状态是否为403 Forbidden。
    ...                 {resp}: 响应实体。
    [Arguments]         ${resp}
    ${bug_level}=       auto create bug level tag  ${resp.status_code}  403
    set tags            ${bug_level}
    ${status_tag}=      auto create status tag  ${resp.status_code}  403
    set tags            ${status_tag}
    Status Should be    ${resp}  403

Expect Status is 404
    [Documentation]     检测响应状态是否为404 Not Found。
    ...                 {resp}: 响应实体。
    [Arguments]         ${resp}
    ${bug_level}=       auto create bug level tag  ${resp.status_code}  404
    set tags            ${bug_level}
    ${status_tag}=      auto create status tag  ${resp.status_code}  404
    set tags            ${status_tag}
    Status Should be    ${resp}  404

Expect Status is 422
    [Documentation]     检测响应状态是否为422 Unprocessable Entity，返回的json格式是否符合验证。
    ...                 {resp}: 响应实体。
    [Arguments]         ${resp}
    ${bug_level}=       auto create bug level tag  ${resp.status_code}  422
    set tags            ${bug_level}
    ${status_tag}=      auto create status tag  ${resp.status_code}  422
    set tags            ${status_tag}
    ${re}               set variable   FAIL
    ${js}               set variable   FAIL
    ${re}=              Status Should be    ${resp}  422
    ${js}=              to validate json    common/error_422.schema.json  ${resp}
    [Teardown]          auto creat jsonerror tag  ${re}  ${js}

Auto Creat JsonError Tag
    [Documentation]     根据状态自动生成’Json返回错误‘类提示Tag。
    ...                 {re}:状态码判断keyword状态。
    ...                 {js}:json判断keyword状态。
    [Arguments]         ${re}  ${js}
    run keyword if  '${re}'=='PASS' and '${js}'=='FAIL'  set tags  JsonReturnError

Run Every Case By Params
    [Documentation]     解析传入的参数并以规定方式运行各种情况。
    ...                 {case_name}:测试用例名字。
    ...                 {essential_params}:必传参数。
    ...                 {unessential_params}:非必传参数。
    ...                 {success}:默认为True，当需要运行422情况时填入success=False。
    ...                 {url_parttern}:当需要向方法中传入url时填写
    [Arguments]  ${case_name}  ${essential_params}  ${unessential_params}  ${success}=True  &{url_parttern}
    ${results}  auto params  ${essential_params}  ${unessential_params}  ${success}
    :FOR  ${kwargs}  IN  @{results}
    \  run keyword and continue on failure  ${case_name}  &{url_parttern}  &{kwargs}
