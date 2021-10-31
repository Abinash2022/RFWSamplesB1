*** Settings ***
Library    SeleniumLibrary
# Suite Teardown    Close Browser

*** Variables ***
${BROWSER}    chrome
${URL}        https://demo.opencart.com/


*** Test Cases ***
Handle TabbedWindow
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Input Text    name:search    Phone
    
    Scroll Element Into View    xpath://img[@title='MacBook']
    # Execute Javascript    window.scrollTo(10, 900)
    # document.getElementsByName('firstName')[0]
    Execute Javascript    window.scrollTo(10, document.body.scrollHeight)
    Click Button    xpath://span//button[@type='button'] 
    ${pageTitle}=    Execute Javascript    return document.title 
    Log To Console    ${pageTitle}
    
    ${pageLoc}=    Get Location 
    Sleep    2s 
    # Wait Until Element Is Visible    xpath://img[@title='iPhone']
    # Sleep    2s           
    
    # Capture Element Screenshot    xpath://img[@title='iPhone']    ./element.png
    Go Back
    Sleep    2s    
    Execute Javascript    history.go(1)
    
    # Log To Console    ${pageLoc}    

        
    # Go Back
    
    # Sleep    2s
    # Go To    ${pageLoc}
    
    # Title Should Be    Search - Phone    
    
    # Capture Page Screenshot    ./page.png
    



     
       