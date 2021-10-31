*** Settings ***
Resource    ../resources/Customkeywords.robot
Suite Setup    Open Browser to Login
Suite Teardown    Close Browser
Test Template    Login with invalid credentials


*** Test Cases ***    USER NAME    PASSWORD
Invalid Username                 invalid    ${VALID PWD}
Invalid Password                 ${VALID USER}    invalid
Invalid Username and Password    invalid    invalid
Empty Username                   ${EMPTY}    ${VALID PWD}
Empty Password                   ${VALID USER}    ${EMPTY}


*** Keywords ***
Login with invalid credentials
    [Arguments]       ${username}    ${password}
    Input Username    ${username}
    Input Password    ${password}
    Submit Credentials
    