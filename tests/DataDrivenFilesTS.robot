*** Settings ***
# Reading from csv files
# Library    DataDriver
# Reading from excel with the name loginData
Library    DataDriver    file=loginData.xlsx    sheet_name=loginPage
Resource    ../resources/Customkeywords.robot
Suite Setup    Open Browser to Login
# Suite Teardown    Close Browser
Test Template    Login with invalid credentials

*** Variables ***
${username}
${password}
${USER}



*** Test Cases ***   
Login with user ${username} and password ${password}    Default    UserData
    
    

*** Keywords ***
Login with invalid credentials
    [Arguments]    ${username}    ${password}
    Input Username    ${username}
    Input Password    ${password}
    Submit Credentials
    