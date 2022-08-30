*** Settings ***

Documentation   Automatyczny test cennika CodersGuru
Library         SeleniumLibrary
Suite Setup     Przygotowanie Srodowiska

*** Variables ***

${OTWARCIE_CENNIKA}       //*[@class='header__list-element' and contains(., 'Cennik')]
${SPRAWDZENIE_CENY}       //*[@class='pricing__subheader pricing__subheader--green' and contains(., 'za godzinę brutto')]


*** Test Cases ***

Sprawdzenie podstrony z cena konsultacji
    [Setup]     Otwarcie Przegladarki
    Przejscie Na Strone Cennika
    Sprawdzenie Czy Wyswietla Sie Cena Konsultacji
    [Teardown]      Close Browser



*** Keywords ***
Przygotowanie Srodowiska
    Set Selenium Speed      0.5
    Set Screenshot directory        screenshots

Otwarcie Przegladarki
    Open Browser        https://tester.codersguru.pl/     chrome
    Maximize Browser Window

Przejscie Na Strone Cennika
    Click Element      ${OTWARCIE_CENNIKA}

Sprawdzenie Czy Wyswietla Sie Cena Konsultacji
    Element Text Should Be      ${SPRAWDZENIE_CENY}     100zł za godzinę brutto
