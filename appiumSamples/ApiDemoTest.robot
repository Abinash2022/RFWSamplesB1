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
Open App
     Open Application    http://localhost:4723/wd/hub    
    ...    platformName=Android
    ...    platformVersion= 11.0
    ...    devicename=emulator-5554
    ...    newCommandTimeout=3000
    ...    automationName=UiAutomator2
    ...    appPackage=com.google.android.calculator
    ...    appActivity=com.android.calculator2.Calculator


*** Test Cases ***
Navigate to Alert Dialog Test
    Open App
    Set Appium Timeout    30s
    Click Element    accessibility_id=App
    #Scroll Down    accessibility_id=Alert Dialogs
    sleep    3s
    Click Element    accessibility_id=Alert Dialogs
    Capture Page Screenshot    ApiDemo.png
    
    