
*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    JSONLibrary

*** Variables ***
${base_url}    https://postman-echo.com
${put_url}    http://api.github.com
${bearer_Url}    https://gorest.co.in/public-api/users        


*** Test Cases ***
BasicAuthWithUserID
    @{auth_list}    Create List    postman    password
    