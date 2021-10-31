*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}        http://the-internet.herokuapp.com/login
${BROWSER}    chrome
${DELAY}    10s
${LOGIN_BTN}    css:button.radius
${VALID USER}    tomsmith
${VALID PWD}    SuperSecretPassword!


*** Keywords ***
Open Browser to Login
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Implicit Wait    ${DELAY}
    Location Should Contain    login    
    
Input Username
    [Arguments]    ${userName}
    Input Text    id:username    ${userName}
    
Input Password
    [Arguments]    ${password}
    Input Text    id:password    ${password}

Submit Credentials
    Click Button    ${LOGIN_BTN}
    
Login should have failed
    [Arguments]    ${errormsg}
    Element Should Contain    id:flash    ${errormsg}    
    

    

    

