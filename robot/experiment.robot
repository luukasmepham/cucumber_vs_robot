*** Settings ***

*** Variables ***
${URL1}     https://magento.softwaretestingboard.com

Library    SeleniumLibrary
Documentation
...    Thesis
...    This test will test magento.softwaretestingboard.com
*** Keywords ***

Navigate To Magento
    Open Browser    https://magento.softwaretestingboard.com    browser=chrome
Verify Page Contains Home Page
    ${Get_title}=                 Get Title
    Should Be Equal As Strings    ${Get_title}    Home Page
    Close Browser

*** Test Cases ***

Create an account
    Navigate To ${URL1}
