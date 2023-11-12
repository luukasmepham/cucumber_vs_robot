*** Settings ***

Library    SeleniumLibrary
Documentation
...    Experimenting
...    This test will Verify DuckDuckGo
*** Keywords ***

Navigate To DuckDuckGo
    Open Browser    https://www.duckduckgo.com    browser=chrome
Verify Page Contains DuckDuckGo
    ${Get_title}=                 Get Title
    Should Be Equal As Strings    ${Get_title}    DuckDuckGo — Privacy, simplified.
    Close Browser

*** Test Cases ***

Open DuckDuckGo & Verify DuckDuckGo
    Navigate To DuckDuckGo
    Verify Page Contains DuckDuckGo
