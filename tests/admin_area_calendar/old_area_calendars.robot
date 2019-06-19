*** Settings ***
Documentation  admin_area_calendar
Resource  ../resources.robot
Library  robot_car_wash_server_library.area_calendar.AreaCalendarLibrary
Suite Setup  Login  ${username}   ${password}
Suite Teardown  Logout
Force Tags  model:admin_area_calendar  虾洗后台


