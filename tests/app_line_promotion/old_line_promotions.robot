*** Settings ***
Documentation  app_line_promotion
Resource  ../resources.robot
Library  robot_washing_expert_library.line_promotion.LinePromotionLibrary
Suite Setup  Login  ${username}   ${password}
Force Tags  model:app_line_promotion  虾客APP


