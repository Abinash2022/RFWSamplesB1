*** Settings ***
Library    SeleniumLibrary
Resource    ../tests/commonUtils.robot
Suite Setup    open browser    http://demo.seleniumeasy.com/basic-select-dropdown-demo.html    chrome
Suite Teardown    Close All Browsers  
# Test Setup       commonUtils.Open Application
# Test Teardown    Close Application
  
*** Test Cases ***
Access single dropdown
    # open browser    http://demo.seleniumeasy.com/basic-select-dropdown-demo.html    chrome
    Select From List By Value    select-demo    Tuesday
        
Access MultiDropdown
    Select From List By Index    multi-select    5
    Select From List By Label    multi-select    Ohio
    Select From List By Value    multi-select    New Jersey
    Sleep    2s    
    
    @{selectedValues} =    Get Selected List Values    multi-select
    ${numOfSelected}=    Get Length    ${selectedValues}
    Log To Console    "Total Selected Items : ",${numOfSelected}        
    
    Log Many    @{selectedValues}