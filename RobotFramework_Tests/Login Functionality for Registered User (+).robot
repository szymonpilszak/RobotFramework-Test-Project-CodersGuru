*** Settings ***
Documentation   Automated test for login functionality of a registered user
Library         SeleniumLibrary
Suite Setup     Prepare Environment

*** Variables ***
${LOGIN_BUTTON_HEADER}      //button[@class='header__button']
${EMAIL_FIELD}              //input[@id='username']
${PASSWORD_FIELD}           //input[@id='password']
${LOGIN_BUTTON}             //button[@id='_submit']

*** Test Cases ***
Verify Registered User Login
    [Setup]     Open Browser Session
    Navigate To Login Page
    Wait For Login Page To Load
    Enter Email
    Enter Password
    Click Login Button
    Verify User Is Logged In
    [Teardown]      Close Browser

*** Keywords ***
Prepare Environment
    Set Selenium Speed      0.5

Open Browser Session
    Open Browser        https://tester.codersguru.pl/     chrome
    Maximize Browser Window

Navigate To Login Page
    Click Element      ${LOGIN_BUTTON_HEADER}

Wait For Login Page To Load
    Wait Until Location Is      https://tester.codersguru.pl/login

Enter Email
    Input Text      ${EMAIL_FIELD}      aaaaa@wp.pl

Enter Password
    Input Text      ${PASSWORD_FIELD}   aaaaa

Click Login Button
    Click Button    ${LOGIN_BUTTON}

Verify User Is Logged In
    Wait Until Page Contains Element     //img[@class='settings-image']      timeout=10s
