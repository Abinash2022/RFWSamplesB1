*** Settings ***
Resource    ../resources/Customkeywords.robot
Test Setup    Open Browser to Login

*** Test Cases ***
Login with InvalidUser 
    Input Username    tomsmith1
    Input Password    SuperSecretPassword!
    Submit Credentials
    Login should have failed    Your username is invalid!
    
Login with InvalidPassword
    Input Username    tomsmith
    Input Password    SuperSecret
    Submit Credentials
    Login should have failed    Your password is invalid!