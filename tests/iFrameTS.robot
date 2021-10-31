*** Settings ***
Library    SeleniumLibrary
# Suite Teardown    Close Browser

*** Variables ***
${BROWSER}    chrome
${URL}        https://chercher.tech/practice/frames


*** Test Cases ***
Handle TabbedWindow
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    
    ${label}    Get Text    xpath://label/span
    Log To Console    ${label}    
    
    Select Frame    id:frame1
    Input Text    xpath://b[@id='topic']/following-sibling::input    Hello Welcome
    
    Select Frame    id:frame3
    Select Checkbox    id:a     


