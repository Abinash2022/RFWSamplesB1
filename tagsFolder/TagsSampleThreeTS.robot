*** Settings ***
Force Tags    RegTest
Default Tags    UserStory1

*** Test Cases ***
Valid Login
    [Tags]        
    Log To Console    Valid Login Test    
    
Invalid Login
    Log To Console    Invalid Login Test
    
Search Item
    [Tags]    SmokeTest
    Log To Console    Search Item Test    
    
Place Order
    [Tags]    
    Log To Console    Place Order Test    
    
Purchase Order
    Log To Console    Purchase Order Test