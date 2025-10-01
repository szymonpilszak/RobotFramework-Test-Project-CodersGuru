*** Settings ***
Documentation   Automated test for the Regulations page
Library         SeleniumLibrary
Suite Setup     Prepare Environment

*** Variables ***
${REGULATIONS_LINK}       //*[@class='link link--grey' and contains(., 'Regulamin')]

*** Test Cases ***
Verify Regulations Page
    [Setup]     Open Browser Session
    Navigate To Regulations Page
    Verify Regulations Page Loaded
    [Teardown]      Close Browser

*** Keywords ***
Prepare Environment
    Set Selenium Speed      0.5

Open Browser Session
    Open Browser        https://tester.codersguru.pl/     chrome
    Maximize Browser Window

Navigate To Regulations Page
    Click Element      ${REGULATIONS_LINK}

Verify Regulations Page Loaded
    Wait Until Location Is      https://tester.codersguru.pl/regulations
