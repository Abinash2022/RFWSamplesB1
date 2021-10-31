*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${base_url}    https://demoqa.com/utilities/weather/city
${city}    chennai

*** Test Cases ***
Get WeatherInfo
    Create Session    myGetSess    ${base_url}
    ${response}    Get On Session    myGetSess    /${city}
    
    Log To Console    ${response.content}   
     
    Log To Console    Status Code ,${response.status_code}   
    Status Should Be    200    
    Should Be Equal As Strings    ${response.reason}    OK
    

    Log To Console    ${response.headers}    
    Log To Console    ${response.headers}[Content-Type]    
    
    Dictionary Should Contain Key    ${response.headers}    Content-Type
    Dictionary Should Contain Value    ${response.headers}    application/json; charset
    ${resBody}    Convert To String    ${response.content}
    Should Contain    ${resBody}    chennai
            
        

