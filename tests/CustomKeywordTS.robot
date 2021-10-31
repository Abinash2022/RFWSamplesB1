

*** Test Cases ***
Add Test
    ${sumValue}=    Add Two numbers    10    20
    Log To Console    "Sum is : ",${sumValue}   
    Should Be Equal As Integers    30    ${sumValue}    
    ${changedName}    Change Nickname    Testuser    Robottestuser
    Print Console    ${changedName}   False


*** Keywords ***
    
Add Two numbers
    [Arguments]    ${value1}    ${value2}
    ${sum}    Evaluate    ${value1}+${value2}
    [Return]    ${sum}  
    
Change Nickname
    [Arguments]    ${oldName}    ${newName}
    [Return]    ${newName}
    
Print Console
    [Arguments]    ${anyText}=Hello       ${flag}=True
    # [Arguments]    ${anyText}       ${flag}
    # Run Keyword If    true    Log    Print in Log
    Run Keyword If    ${flag}    Log    ${anyText}   
    ...    ELSE    Log To Console    ${anyText}     


    # Log To Console    The Text is :    ${anyText}    




