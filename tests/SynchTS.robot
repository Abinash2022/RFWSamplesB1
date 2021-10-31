*** Settings ***
Library    SeleniumLibrary
# Suite Teardown    Close Browser

*** Variables ***
${BROWSER}    chrome
${URL}        http://the-internet.herokuapp.com/dynamic_loading/2
${delay}    10s
*** Keywords ***
Initialize
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    
Teardown
    Close Browser
    
SynchPageElements
    Initialize
    Click Button    //button[text()='Start']   
    # Sleep    10s     
    ${impWait}=    Get Selenium Implicit Wait
    Log To Console    "Impl Wait : ",${impWait}    
    

    ${speed}=    Get Selenium Speed
    Log To Console    "Selenium Speed : ",${speed} 
    Set Selenium Speed    3s
    
   
    ${defImp}=    Get Selenium Timeout
    Log To Console    "Default Wait : ",${defImp} 
    # Set Selenium Implicit Wait    ${delay}   
    # Set Selenium Timeout    10s
    Wait Until Element Is Visible    //h4[text()='Hello World!']    


    ${afterTimeout}=    Get Selenium Implicit Wait
    Log To Console    "After Wait : ",${afterTimeout} 


    ${dynText}    Get Text    //h4[text()='Hello World!']
    Log To Console    ${dynText}    
    Teardown


*** Test Cases ***
DynamicElementTest
    
    SynchPageElements
    















