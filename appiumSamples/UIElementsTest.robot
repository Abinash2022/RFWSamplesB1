*** Settings ***
Library    AppiumLibrary

*** Variables ***
${REMOTE_URL}    http://localhost:4723/wd/hub
${PLATFORM_NAME}    Android
${PLATFORM_VERSION}    11.0
${DEVICE_NAME}    emulator-5554
${APP}           C:\\Users\\Abinash\\Downloads\\ApiDemos-debug.apk
${PACKAGE_NAME}    io.appium.android.apis


*** Keywords ***
Open API DemoApp in Real Dev
     Open Application    http://localhost:4723/wd/hub    
    ...    platformName=Android
    ...    platformVersion= 11.0
    ...    devicename=emulator-5554
    ...    newCommandTimeout=3000
    ...    automationName=UiAutomator2
    ...    appPackage=com.google.android.calculator
    ...    appActivity=com.android.calculator2.Calculator

*** Test Cases ***
Vertical Scroll Test
    Open API DemoApp in Real Dev
    #Swipe By Percent    10    50    10    30    1000
    
    sleep    3s    
    Element Should Be Visible    accessibility_id=Views   
    Click Element    accessibility_id=Views
    sleep    2s
    Repeat Keyword    2    Swipe By Percent    10    90    10    5
        
    # sleep    3s
    Wait Until Page Contains Element    accessibility_id=Tabs
    Click Element       accessibility_id=Tabs 

Horizontal Scroll Test
    Open API DemoApp in Real Dev
    #Swipe By Percent    10    50    10    30    1000
    
    sleep    3s    
    Element Should Be Visible    accessibility_id=Views   
    Click Element    accessibility_id=Views

    Repeat Keyword    2    Swipe By Percent    10    90    10    5
    Sleep    3s
    Wait Until Page Contains Element    accessibility_id=Seek Bar    
    Click Element    accessibility_id=Seek Bar
    
    Click Element    id=io.appium.android.apis:id/seek
    
    ${beforeTxt}=    Get Text    io.appium.android.apis:id/progress
    Log To Console    ${beforeTxt}    
    ${element_size}    Get Element Size    id=io.appium.android.apis:id/seek
    ${element_location}    Get Element Location    id=io.appium.android.apis:id/seek
    ${start_x}    Evaluate    ${element_location['x']}+ (${element_size['width']} *0.1)   #Get start point of seekbar.    
    ${start_y}    Evaluate    ${element_location['y']}+ (${element_size['height']} *0.1)  #Get vertical location of seekbar.
    ${end_x}    Evaluate    ${element_location['x']}+ (${element_size['width']} *0.5)     #Get end point of seekbar.
    Swipe    ${start_x}    ${start_y}    ${end_x}    ${start_y}
    
    ${afterTxt}=    Get Text    io.appium.android.apis:id/progress
    Log To Console    ${afterTxt}    

# WebElements test
    # Open API DemoApp in Real Dev
    # #Swipe By Percent    10    50    10    30    1000
    # Element Should Be Visible    accessibility_id=Views   
    # Click Element    accessibility_id=Views
    # sleep    2s
    # Click Element    accessibility_id=Controls
    # sleep    2s
    # Click Element    accessibility_id=2. Dark Theme
    # sleep    2s
    # Input Text    io.appium.android.apis:id/edit   Hello Welcome
     # Hide Keyboard
    # Click Element    accessibility_id=Checkbox 1
    # Click Element    accessibility_id=RadioButton 1
    # Swipe By Percent    10    50    10    30    1000
    # Click Element    io.appium.android.apis:id/toggle1
    # Click Element    id=android:id/text1
    # sleep    5s
    # &{elements}=    Get Webelements    android:id/text1
    # Click Element    ${elements}[2]
