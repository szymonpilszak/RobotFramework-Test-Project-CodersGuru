*** Settings ***
Documentation   Automated test for CodersGuru pricing page
Library         SeleniumLibrary
Suite Setup     Prepare Environment

*** Variables ***
${PRICING_MENU}         //*[@class='header__list-element' and contains(., 'Cennik')]
${CHECK_PRICE}          //*[@class='pricing__subheader pricing__subheader--green' and contains(., 'za godzinę brutto')]

*** Test Cases ***
Verify Consultation Pricing Page
    [Setup]     Open Browser Session
    Navigate To Pricing Page
    Verify Consultation Price Displayed
    [Teardown]      Close Browser

*** Keywords ***
Prepare Environment
    Set Selenium Speed      0.5
    Set Screenshot Directory        screenshots

Open Browser Session
    Open Browser        https://tester.codersguru.pl/     chrome
    Maximize Browser Window

Navigate To Pricing Page
    Click Element      ${PRICING_MENU}

Verify Consultation Price Displayed
    Element Text Should Be      ${CHECK_PRICE}     100zł za godzinę brutto