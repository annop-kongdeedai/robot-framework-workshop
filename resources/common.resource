*** Settings ***
Library    SeleniumLibrary    

*** Variables ***
${URL}    http://automationpractice.com/index.php
${BROWSER}    chrome

*** Keywords ***
Ecommerce suit setup
    Open Browser    url=${URL}    browser=${BROWSER}
    Maximize Browser Window
    
Ecommerce suit teardown
    Close Browser
    
Ecommerce test setup
    Delete All Cookies
    Go To    ${URL}