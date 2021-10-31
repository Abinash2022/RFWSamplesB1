*** Settings ***
Library    AppiumLibrary

*** Variables ***
${REMOTE_URL}    http://localhost:4723/wd/hub
${PLATFORM_NAME}    Android
${PLATFORM_VERSION}    11.0
${DEVICE_NAME}    emulator-5554           
${PACKAGE_NAME}    com.android.calculator2
${Activity_NAME}    com.android.calculator2.Calculator

*** Keywords ***
Open calculator in RealDev
    Open Application    http://localhost:4723/wd/hub    
    ...    platformName=Android
    ...    platformVersion= 11.0
    ...    devicename=emulator-5554
    ...    newCommandTimeout=3000
    ...    automationName=UiAutomator2
    ...    appPackage=com.google.android.calculator
    ...    appActivity=com.android.calculator2.Calculator

Open Calculator in Emulator
    Open Application    http://localhost:4723/wd/hub    
    ...    platformName= Android
    ...    platformVersion= 11.0
    ...    devicename=emulator-5554
    ...    newCommandTimeout=3000
    ...    automationName=UiAutomator2
    ...    appPackage=${PACKAGE_NAME}
    ...    appActivity=${Activity_NAME}

*** Test Cases ***
Calculator Test case
    Open calculator in RealDev
    Set Appium Timeout    30s
    #Click Element    com.tct.tablet.calculator:id/tips_btn
    #sleep    5s
    Click Element    id=com.google.android.calculator:id/digit_6
    Click Element    id=com.google.android.calculator:id/op_add
    Click Element    id=com.google.android.calculator:id/digit_4
    
    Element Should Contain Text    id=com.google.android.calculator:id/result    10    
    
    

