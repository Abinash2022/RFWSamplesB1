*** Settings ***
Resource    ../PageObjects/PageDefKeywords/LoginPage.robot
Resource    ../PageObjects/PageDefKeywords/HomePage.robot
Resource    ../PageObjects/PageDefKeywords/CommonKeywords.robot
Suite Teardown    App TearDown



*** Variables ***

${url}    https://opensource-demo.orangehrmlive.com/
${browser}    chrome
    

*** Test Cases ***
Open Browser with login page
    Browser open with login Page    ${url}    ${browser} 
    Input Username
    Input Pwd
    Click Login  
    Verify welcome test is visible
    Logout
    




