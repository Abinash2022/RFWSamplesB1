*** Settings ***
Library    AppiumLibrary

*** Variables ***
${REMOTE_URL}    http://localhost:4723/wd/hub
${username}    tomsmith
${password}    SuperSecretPassword!

*** Keywords ***
Open Chrome Browser in Real Device
    Open Application    ${REMOTE_URL}    
    ...    platformName=Android
    ...    platformVersion= 11.0
    ...    devicename=emulator-5554
    ...    newCommandTimeout=3000
    ...    automationName=UiAutomator2
    ...    appPackage=com.google.android.calculator
    ...    appActivity=com.android.calculator2.Calculator


*** Test Cases ***
Web App Test case
    Open Chrome Browser in Real Device
    Go To Url    http://the-internet.herokuapp.com/login
    Wait Until Page Contains Element    xpath://input[@id='username' and @type='text']    
    Input Text    xpath://input[@id='username']    ${username}
    Input Text    xpath://input[@id='password']    ${password}
    Click Element    xpath=//form[@name="login"]/button