*** Settings ***
Documentation   Automatyczny test możliwości zalogowania niepoprawnymi danymi
Library         SeleniumLibrary
Suite Setup     Przygotowanie Srodowiska


*** Variables ***
${OTWARCIE_PODSTRONY}    //button[@class='header__button']
${POLE_LOGINU}          //input[@id='username']
${POLE_HASŁA}           //input[@id='password']
${PRZYCISK_ZALOGUJ}     //button[@id='_submit']
${URL}                  https://tester.codersguru.pl/
${BROWSER}              chrome


*** Test Cases ***
Sprawdzenie mozliwosci zalogowania użytkownika za pomocą niepoprawnych danych
    [Setup]     Otwarcie Przegladarki
    Przejscie Na Strone Logowania
    Oczekiwanie Na Zaladowanie Podstrony Logowania
    Podanie Poprawnego Email i Niepoprawnego Hasła
    Podanie Niepoprawnego Email i Poprawnego Hasła
    Poprawny Email i Puste Hasło
    Pusty Email i Poprawne Hasło
    [Teardown]      Close Browser


*** Keywords ***
Przygotowanie Srodowiska
    Set Selenium Speed              0.5
Otwarcie Przegladarki
    Open Browser                    ${URL}           ${BROWSER}
    Maximize Browser Window
Przejscie Na Strone Logowania
    Click Element                   ${OTWARCIE_PODSTRONY}
Oczekiwanie Na Zaladowanie Podstrony Logowania
    Wait Until Location Is          https://tester.codersguru.pl/login
Podanie Poprawnego Email i Niepoprawnego Hasła
    Input Text                      ${POLE_LOGINU}                          aaaaa@wp.pl
    Input Text                      ${POLE_HASŁA}                           bbbbb
    Click Button                    ${PRZYCISK_ZALOGUJ}
    Wait Until Page Contains        Nieprawidłowe dane.                     timeout=10s
Podanie Niepoprawnego Email i Poprawnego Hasła
    Input Text                      ${POLE_LOGINU}                          bbbbb@wp.pl
    Input Text                      ${POLE_HASŁA}                           aaaaa
    Click Button                    ${PRZYCISK_ZALOGUJ}
    Wait Until Page Contains        Nieprawidłowe dane.                     timeout=10s
Poprawny Email i Puste Hasło
    Input Text                      ${POLE_LOGINU}                          aaaaa@wp.pl
    Click Button                    ${PRZYCISK_ZALOGUJ}
    Click Button                    ${PRZYCISK_ZALOGUJ}
    Wait Until Page Contains        To pole jest wymagane                     timeout=10s
Pusty Email i Poprawne Hasło
    Clear Element Text              ${POLE_LOGINU}
    Input Text                      ${POLE_HASŁA}                           aaaaa
    Click Button                    ${PRZYCISK_ZALOGUJ}
    Click Button                    ${PRZYCISK_ZALOGUJ}
    Wait Until Page Contains        To pole jest wymagane                     timeout=10s



