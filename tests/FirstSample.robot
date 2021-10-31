*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    chrome
${URL}    http://the-internet.herokuapp.com/login   
${HL_BROWSER}    headlesschrome    

*** Test Cases ***
First Testcase
    Log  Welcome

Valid LoginTest
    open browser    ${URL}    ${HL_BROWSER}
    Maximize Browser Window
    # Input Text    id:username    tomsmith   
    # Input Password    name:password    SuperSecretPassword! 
    # Input Text    xpath://input[@id='username' and @type='text']    tomsmith 
    # Input Password    xpath://input[@name='password']    SuperSecretPassword! 
    # Click Button    xpath://button[@class='radius']    
    # Click Button    tag:button
    # Click Button    class:radius
    # Click Button    CSS:.radius
    Input Text    username    tomsmith    
    Input Text    css:input[name=password]    SuperSecretPassword!
    # Click Button    //button[@class='radius']
    Click Button    class:radius
    Element Should Be Visible    css:.flash.success  
    ${successMsg}    Get Text    css:.flash.success
    Log To Console    ${successMsg}                
    Close Browser
    

Invalid Username LoginTest
    open browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Input Text    username    tomsmi  
    Input Text    css:input[name=password]    SuperSecretPassword!
    Click Button    css:.radius
    Element Should Contain    id:flash    Your username is invalid!    
    Close Browser
    


    
        
    
    

    
    
    
                   