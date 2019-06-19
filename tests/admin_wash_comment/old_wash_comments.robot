*** Settings ***
Documentation  admin_wash_comment
Resource  ../resources.robot
Library  robot_car_wash_server_library.wash_comment.WashCommentLibrary
Suite Setup  Login  ${username}   ${password}
Suite Teardown  Logout
Force Tags  model:admin_wash_comment  虾洗后台


