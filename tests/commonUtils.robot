*** Settings ***
Library    SeleniumLibrary
*** Variables ***
${BROWSER}    chrome
${URL}        http://demo.seleniumeasy.com/basic-select-dropdown-demo.html

*** Keywords ***
Handle SimpleAlert
    Open Browser    ${BROWSER}    ${URL}
    Maximize Browser Window
    

Close Application
    Close Browser