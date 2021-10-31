
*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    JSONLibrary

*** Variables ***
${base_url}    https://jsonplaceholder.typicode.com
${put_url}    http://jsonplaceholder.typicode.com/posts
${bearerUrl}    https://gorest.co.in/access-token        

*** Test Cases ***
PostRequestTest
    Create Session    myPostSess    ${base_url}    verify=true
    &{body}    Create Dictionary    userId=1000    title=RFW    body=Api Testing
    Log To Console    ${body}    
    &{header}    Create Dictionary    Cache-Control=no-cache
    ${response}    Post On Session    myPostSess    /posts    data=${body}    headers=${header}
    Log To Console    ${response.status_code}    
    Log To Console    ${response.content}
    

    ${id}    Get Value From Json    ${response.json()}    id
    ${idFromList}    Get From List    ${id}    0
    ${idAsString}    Convert To String    ${idFromList}
    Should Be Equal As Strings    ${idAsString}    101
    
    ${headerValues}    Get From Dictionary    ${response.headers}    Content-Type
    
    #Run Keyword If    ${headerValues}==application/json; charset=utf-8    name
    ${bodyAsString}    Convert JSON To String    ${response.json()}
    Should Contain    ${bodyAsString}    101
    
PutRequestTest
    Create Session    myPutSess    ${put_url}
    &{body}    Create Dictionary    userId=1000    title=RFWAPI    body=Api Testing
    Log To Console    ${body}    
    &{header}    Create Dictionary    Cache-Control=no-cache
    ${response}    Post On Session    myPutSess    /15    data=${body}    headers=${header}
    Log To Console    ${response.status_code}    
    Log To Console    ${response.content}
    
    ${strRes}    Convert To String    ${response.content}
    Should Contain    ${strRes}    RFWAPI
            
    
# PostWithBearerToken
    # Create Session    myPostSess    ${bearerUrl}    verify=true
    # &{body}    Create Dictionary    name=TestAutomation    gender=female    
    # &{header}    Create Dictionary    authorization=Bearer 9b7a244d518c3430f99afdd476c0d8ed5fc26a0777bb4568ee8172e49cd7ccf3
    # ${response}    Post On Session    myPostSess    /users    data=${body}    header=${header}
    # Log To Console    ${response.status_code}  


# PostWithJsonFile
    # Create Session    myPostSess    ${base_url}
    # &{jsonContent}    Load JSON From File    C:\\Users\\Abinash\\eclipse-workspace\\RFWSamplesB1\\APITesting\\postData.json
    # &{header}    Create Dictionary    Cache-control=no-cache    Content-type=application/json
    # ${response}    POST On Session    myPostSess/posts    json=${jsonContent}    headers=${header}
    
    # Log To Console    ${response.status_code}
    # Log To Console    Post JSON Content ${response.content}    
    
    # ${status_code}=    Convert To String    item
        
                    
