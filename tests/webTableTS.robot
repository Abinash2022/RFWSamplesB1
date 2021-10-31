*** Settings ***
Library    SeleniumLibrary
# Suite Teardown    Close Browser

*** Variables ***
${BROWSER}    chrome
${URL}        http://demo.seleniumeasy.com/table-sort-search-demo.html


*** Test Cases ***
Handle TabbedWindow
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    ${rowCount}    Get Element Count    xpath://table[@id='example']/tbody/tr    
    ${colCount}    Get Element Count    xpath://table[@id='example']/thead/tr/th
    Log To Console    "Number Of Rows :",${rowCount}    
    Log To Console    "Number Of Columns :",${colCount}
    
    ${cellData}=    Get Table Cell    xpath://table[@id='example']    4    3    
    Log To Console    ${cellData}    
    
    # Table Cell Should Contain    xpath://table[@id='example']    4    3    Tokyo
    Table Cell Should Contain    xpath://table[@id='example']    5    4    41 
       
    Table Column Should Contain    xpath://table[@id='example']    3    Office  
    
    Table Row Should Contain    xpath://table[@id='example']    3    Tokyo
    
    Table Should Contain    xpath://table[@id='example']    Regional Director
    
    FOR    ${i}    IN RANGE    2    ${rowCount}+2
        Log    ${i}
        ${name}    Get Table Cell    xpath://table[@id='example']    ${i}    1 
        Log To Console    "Name : ",${name}       
    END    
    
    
    

      

    Close Browser