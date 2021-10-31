*** Settings ***
Library    SeleniumLibrary
Resource    ../tests/commonUtils.robot
Test Teardown    Close All Browsers

*** Test Cases ***
# SeleniumFromRadioBtn
    # open browser    http://demo.seleniumeasy.com/basic-radiobutton-demo.html    chrome
    # Maximize Browser Window
    # Select Radio Button    optradio    Male
    
    # ${gender}=    Get Element Attribute    optradio    value
    # Log To Console    ${gender}    
   
    # # Radio Button Should Not Be Selected    optradio
    
SelectCheckBox
    open browser    http://demo.seleniumeasy.com/basic-checkbox-demo.html    chrome
    Maximize Browser Window
    Sleep    2s    
    Select Checkbox    id:isAgeSelected
    Select Checkbox    class:cb1-element
    Checkbox Should Be Selected    class:cb1-element
    Select Checkbox    xpath:(//input[@class='cb1-element'])[3] 
     Unselect Checkbox    class:cb1-element    
    Checkbox Should Not Be Selected    class:cb1-element
    