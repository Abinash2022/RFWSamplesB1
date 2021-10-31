*** Settings ***
Library    SeleniumLibrary
# Suite Teardown    Close Browser

*** Variables ***
${BROWSER}    chrome
${URL}        https://stqatools.com/demo/Windows.php


*** Test Cases ***
# Handle TabbedWindow
    # Open Browser    ${URL}    ${BROWSER}
    # Maximize Browser Window
    # ${parentWin}=    Get Window Handles    
    # Log To Console    ${parentWin}[0]    
    # Click Button    xpath://button[contains(text(), 'new Tab')] 
    # @{winHandles} =    Get Window Handles    
    # ${openedWins} =    Get Length    ${winHandles}
    # Log To Console    "Number of Opened Windows :",${openedWins}    
    # Switch Window     ${winHandles}[1]
    # Sleep    3s    
    # Click Element    xpath://span[@class='menu-text' and contains(text(), 'Java')][1]
    
    # Title Should Be    JAVA for Selenium WebDriver from Basic to Advance with Example
    # Close Window
    # Close Browser
    
Handle BrowserWindow
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window   
    Click Button    xpath://button[contains(text(), 'new Window')]
    @{browserIDs} =    Get Browser Ids 
    Log Many    ${browserIDs}    
    Switch Browser    ${browserIDs}[0]
    Sleep    3s    
    Click Button    //button[contains(text(), 'Message Window')]
    Close All Browsers    
    







         