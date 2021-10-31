
*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${base_url}    https://reqres.in/api/users

*** Test Cases ***
Delete Session
    Create Session    myDelSess    ${base_url}
    ${response}    Delete On Session    myDelSess    /1
    Log To Console    ${response.status_code}
    Status Should Be    204