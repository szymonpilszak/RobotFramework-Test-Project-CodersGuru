*** Settings ***
Documentation   Automated test for login functionality with invalid credentials
Library         SeleniumLibrary
Suite Setup     Prepare Environment

*** Variables ***
${LOGIN_BUTTON_HEADER}      //button[@class='header__button']
${EMAIL_FIELD}              //input[@id='username']
${PASSWORD_FIELD}           //input[@id='password']
${LOGIN_BUTTON}             //button[@id='_submit']
${BASE_URL}                 https://tester.codersguru.pl/
${BROWSER}                  chrome

*** Test Cases ***
Verify Login With Invalid Credentials
    [Setup]     Open Browser Session
    Navigate To Login Page
    Wait For Login Page To Load
    Valid Email And Invalid Password
    Invalid Email And Valid Password
    Valid Email And Empty Password
    Empty Email And Valid Password
    [Teardown]      Close Browser

*** Keywords ***
Prepare Environment
    Set Selenium Speed      0.5

Open Browser Session
    Open Browser        ${BASE_URL}     ${BROWSER}
    Maximize Browser Window

Navigate To Login Page
    Click Element      ${LOGIN_BUTTON_HEADER}

Wait For Login Page To Load
    Wait Until Location Is      https://tester.codersguru.pl/login

Valid Email And Invalid Password
    Input Text      ${EMAIL_FIELD}      aaaaa@wp.pl
    Input Text      ${PASSWORD_FIELD}   bbbbb
    Click Button    ${LOGIN_BUTTON}
    Wait Until Page Contains      Nieprawidłowe dane.    timeout=10s

Invalid Email And Valid Password
    Input Text      ${EMAIL_FIELD}      bbbbb@wp.pl
    Input Text      ${PASSWORD_FIELD}   aaaaa
    Click Button    ${LOGIN_BUTTON}
    Wait Until Page Contains      Nieprawidłowe dane.    timeout=10s

Valid Email And Empty Password
    Input Text      ${EMAIL_FIELD}      aaaaa@wp.pl
    Click Button    ${LOGIN_BUTTON}
    Click Button    ${LOGIN_BUTTON}
    Wait Until Page Contains      To pole jest wymagane    timeout=10s

Empty Email And Valid Password
    Clear Element Text      ${EMAIL_FIELD}
    Input Text              ${PASSWORD_FIELD}      aaaaa
    Click Button            ${LOGIN_BUTTON}
    Click Button            ${LOGIN_BUTTON}
    Wait Until Page Contains      To pole jest wymagane    timeout=10s
