*** Settings ***
Library    SeleniumLibrary
Variables    ../Locators/locators.py
Variables    ../TestData/TestData.py

*** Keywords ***
Verify welcome test is visible
    Element Should Be Visible    ${WelcomeText}    
    
Logout
    Click Element    ${WelcomeText}    
    Wait Until Element Is Visible    ${LogoutButton}    
    Click Element    ${LogoutButton}    
    Wait Until Element Is Visible    ${LoginUsernameInputBox}    
        
