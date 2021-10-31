*** Settings ***
Library    SeleniumLibrary
Library    AxeLibrary


*** Test Cases ***
Sample A11ytest
    Open Browser    https://www.selenium.dev/    chrome
    &{results}    Run Accessibility Tests    selPageA11yReport.json
    Log To Console    Violations Count : ${results.violations}
    Log Readable Accessibility Result    violations
    Get Json Accessibility Result