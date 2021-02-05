*** Settings ***
Library  SeleniumLibrary
Resource

*** Variables ***

*** Test Cases ***
This is a sample test case
    [documentation]  Google test
    [tags]  regression

    Open Browser  http://www.google.com  chrome
    Close Browser

*** keywords ***



