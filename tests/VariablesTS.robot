*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
*** Variables ***
${ENV}    test
&{url}    qa=https://demoblaze.com/    test=http://the-internet.herokuapp.com/login

*** Test Cases ***
Using list
    @{userDetails} =     Create List    John    Peter    Rosy    aaaa@gmail.com    23456
    
    Log Many    @{userDetails}
    Log    "First Item : ",${userDetails}[1]
    open browser    https://demoblaze.com/    chrome
    sleep    3s
    @{elements_list}    Get WebElements    css:h4.card-title a
    FOR    ${i}    IN    @{elements_list}
        ${elementText}    Get Text    ${i} 
        # ${elementName}    Get Element Attribute    ${i}    name 
        Log To Console    ${elementText} 
        Run Keyword If    '${elementText}' == 'Samsung galaxy s6'   Click Element    ${i}    
        Exit For Loop If    '${elementText}' == 'Samsung galaxy s6'       
    END        
    Close Browser
    
Using Dictionary
    @{insts} =    Create List    30    40    50
    &{dictItems} =    Create Dictionary    a=10    b=20    c=${30,40,50}
    Log    "Value of a",${dictItems.a}
    Log Many    'Value of c",${dictItems}[c]
    Log Many    'Value of c",${dictItems}[c][1]

    Close Browser
    

# Using EnvVariable
    # Log To Console    ${url.qa}
     # Log To Console    Current User: %{USERNAME}
     # Log To Console   %{JAVA_HOME}${/}javac
    # Log To Console    ${url.%{ENV}}
    # open Browser    ${url.%{ENV}}    chrome      
      