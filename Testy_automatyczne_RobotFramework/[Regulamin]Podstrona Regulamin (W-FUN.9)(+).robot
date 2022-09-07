*** Settings ***
Documentation   Automatyczny test podstrony z regulaminem
Library         SeleniumLibrary
Suite Setup     Przygotowanie Srodowiska


*** Variables ***
${OTWARCIE_REGULAMINU}       //*[@class='link link--grey' and contains(., 'Regulamin')]



*** Test Cases ***
Sprawdzenie podstrony z cena konsultacji
    [Setup]     Otwarcie Przegladarki
    Przejscie Na Strone Regulaminu
    Sprawdzenie Czy Regulamin Wyswietla Sie Poprawnie
    [Teardown]      Close Browser



*** Keywords ***
Przygotowanie Srodowiska
    Set Selenium Speed      0.5
Otwarcie Przegladarki
    Open Browser        https://tester.codersguru.pl/     chrome
    Maximize Browser Window
Przejscie Na Strone Regulaminu
    Click Element      ${OTWARCIE_REGULAMINU}
Sprawdzenie Czy Regulamin Wyswietla Sie Poprawnie
    Wait Until Location Is      https://tester.codersguru.pl/regulations
