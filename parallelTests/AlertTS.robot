*** Settings ***
Library    SeleniumLibrary
Suite Teardown    Close Browser

*** Variables ***
${BROWSER}    chrome
${URL}        http://demo.seleniumeasy.com/javascript-alert-box-demo.html


*** Test Cases ***
Handle SimpleAlert
    Open Browser    ${URL}    ${BROWSER}
    Click Button    xpath:(//button[contains(text(), 'Click me!')])[1] 
    
    Handle Alert    ACCEPT   
    
    Click Button    xpath:(//button[contains(text(), 'Click me!')])[2]
    Sleep    3s
    ${alertText} =     Handle Alert    
    Log To Console    ${alertText}
    
    Click Button    xpath:(//button[contains(text(), 'Prompt')])
    Sleep    2s    
    Input Text Into Alert    Hello Welcome    
    # Handle Alert    dismiss
        