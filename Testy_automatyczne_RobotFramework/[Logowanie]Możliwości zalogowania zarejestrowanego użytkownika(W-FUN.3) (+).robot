*** Settings ***
Documentation   Automatyczny test logowania zarejestrowanego uzytkownika
Library         SeleniumLibrary
Suite Setup     Przygotowanie Srodowiska


*** Variables ***
${OTWARCIE_PODSTRONY}       //button[@class='header__button']
${POLE_LOGINU}          //input[@id='username']
${POLE_HASŁA}           //input[@id='password']
${PRZYCISK_ZALOGUJ}     //button[@id='_submit']



*** Test Cases ***
Sprawdzenie mozliwosci zalogowania zarejestrowanego uzytkownika
    [Setup]     Otwarcie Przegladarki
    Przejscie Na Strone Logowania
    Oczekiwanie Na Zaladowanie Podstrony Logowania
    Podanie Loginu
    Podanie Hasła
    Kliknij Zaloguj
    [Teardown]      Close Browser



*** Keywords ***
Przygotowanie Srodowiska
    Set Selenium Speed          1
Otwarcie Przegladarki
    Open Browser                https://tester.codersguru.pl/     chrome
    Maximize Browser Window
Przejscie Na Strone Logowania
    Click Element               ${OTWARCIE_PODSTRONY}
Oczekiwanie Na Zaladowanie Podstrony Logowania
    Wait Until Location Is      https://tester.codersguru.pl/login
Podanie Loginu
    Input Text                  ${POLE_LOGINU}     aaaaa@wp.pl
Podanie Hasła
    Input Text                  ${POLE_HASŁA}     aaaaa
Kliknij Zaloguj
    Click Button                ${PRZYCISK_ZALOGUJ}
Oczekiwanie Na Zalogowanie
    Wait Until Location Is      https://tester.codersguru.plr



