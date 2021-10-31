
*** Settings ***
Library    RequestsLibrary
Library    Collections


*** Variables ***
${base_url}    http://postman-echo.com
${git_url}    https://api.github.com    
${apptoken}    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

*** Test Cases ***
BasicAuthRequest
    @{auth_list}    Create List    postman    password
    Create Session    myBasicAuth    ${base_url}    auth=${auth_list}
    ${response}    Get On Session    myBasicAuth    /basic-auth
    Log To Console    ${response.status_code}
    Log To Console    ${response.content}
    

OAuthRequest
    @{auth_list}    Create Dictionary    appToken=${apptoken}
    Create Session    myAuth2    ${git_url}    Oauth2=ApiToken ${auth_list}
    
    ${response}    GET On Session    myAuth2    /user/repos
    Log To Console    ${response.status_code}    
     
    
               