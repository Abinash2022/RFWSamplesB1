*** Settings ***
Library    SeleniumLibrary
Variables    ../Locators/locators.py

*** Keywords ***
Browser open with login Page
    [Arguments]    ${url}    ${browser}
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Set Selenium Implicit Wait    10s
    Wait Until Element Is Visible    ${LoginUsernameInputBox}    
    
App TearDown
    Close All Browsers