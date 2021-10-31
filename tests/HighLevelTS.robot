*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}        http://the-internet.herokuapp.com/login
${BROWSER}    chrome
${DELAY}    10S

*** Test Cases ***
Valid LoginTest
    Given Browser is opened with login page
    When User "tomsmith" login with password "SuperSecretPassword!"
    Then Should display success message
    
    
Invalid LoginTest
    Given Browser is opened with login page
    When User "toms" login with password "SuperSecretPassword!"
    Then Should display error message

*** Keywords ***
Browser is opened with login page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Implicit Wait    ${DELAY}
    Location Should Be    login    
    

User ${userName} login with password ${password}
    Input Text    id:username    ${userName} 
    Input Text    id:password    ${password}  
    Click Button    css:button.radius    
    
Should display success message
    Element Should Contain    id:flash    You logged into a secure area!    

Should display error message
    Element Should Contain    id:flash    Your username is invalid!       

