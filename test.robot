*** Settings ***
Library    SeleniumLibrary   

*** Variables ***
${URL}    http://www.google.com
${BROWSER}    chrome

*** Test Cases ***

OPEN BROWSER
    Open Browser    ${URL}    ${BROWSER}