*** Settings ***
Library  SeleniumLibrary
Library    String
Library    OperatingSystem
Library    XML
Suite Setup     Open Browser    ${URL}   ${BROWSER}
Suite Teardown  Close All Browsers
 
 
*** Variables ***
${URL}              https://magento.softwaretestingboard.com/
${BROWSER}          Chrome
 
*** Keywords ***
Click
    [Arguments]    ${button}
    IF    "${button}" == "Create an Account"
        Click Element    xpath=//a[text()="Create an Account"]
    ELSE IF    "${button}" == "Submit Account Creation Form"
        Click Element    class=submit
    ELSE IF    "${button}" == "Sign In"
        Wait Until Element Is Visible    xpath=/html/body/div[2]/header/div[1]/div/ul/li[2]/a
        Click Element    xpath=/html/body/div[2]/header/div[1]/div/ul/li[2]/a
    ELSE IF    "${button}" == "Submit Account Sign In Form"
        Click Element    id=send2
    ELSE IF    "${button}" == "Sign Out"
        Click Button    xpath=//button[@data-action="customer-menu-toggle"]
        Click Element    xpath=//a[@href="https://magento.softwaretestingboard.com/customer/account/logout/"]
    ELSE IF    "${button}" == "Sale"
        Click Element    id=ui-id-8
    ELSE IF    "${button}" == "Jackets"
        Click Element    xpath=//a[text()="Jackets"]
    ELSE IF    "${button}" == "Add To Cart"
        Click Element    id=product-addtocart-button
    ELSE IF    "${button}" == "Open Cart"
        Click Element    xpath=//a[@href="https://magento.softwaretestingboard.com/checkout/cart/"]
    ELSE IF    "${button}" == "Proceed To Checkout"
        Click Element    id=top-cart-btn-checkout
    ELSE IF    "${button}" == "Flat Rate Shipping"
        Click Element    xpath=//input[@value="flatrate_flatrate"]
    ELSE IF    "${button}" == "Next"
        Click Element    xpath=//span[text()="Next"]
    ELSE IF    "${button}" == "Place Order"
        Wait Until Element Is Visible    xpath=//*[text()="Place Order"]
        Scroll Element Into View    xpath=//*[text()="Place Order"]
        Click Element    xpath=//*[text()="Place Order"]
    END

Fill
    [Arguments]    ${field}    ${value}
    IF    "${field}" == "Create First Name"
        Input Text    id=firstname    ${value}
    ELSE IF    "${field}" == "Create Last Name"
        Input Text    id=lastname    ${value}
    ELSE IF    "${field}" == "Create Email"
        Input Text    id=email_address    ${value}
    ELSE IF    "${field}" == "Create Password"
        Input Text    id=password    ${value}
        Input Text    id=password-confirmation    ${value}
    ELSE IF    "${field}" == "Email"
        Input Text    id=email    ${value}
    ELSE IF    "${field}" == "Password"
        Input Text    id=pass    ${value}
    ELSE IF    "${field}" == "Street Address"
        Wait Until Element Is Visible    id=FS0TN9W
        Input Text    id=FS0TN9W   ${value}
    ELSE IF    "${field}" == "City"
        Input Text    id=OLFQTNC    ${value}
    ELSE IF    "${field}" == "State/Province"
        Input Text    id=AGEBA1M    ${value}
    ELSE IF    "${field}" == "Zip/Postal Code"
        Input Text    id=VSCDOW2   ${value}
    ELSE IF    "${field}" == "Country"
        Input Text    id=PL5QN54    ${value}
    ELSE IF    "${field}" == "Phone Number"
        Input Text    id=HHIRW75    ${value}
    END

Filter
    [Arguments]    ${field}    ${value}
    Wait Until Element Is Visible    //div[text()="${field}"]
    Click Element    xpath=//div[text()="${field}"]
    Wait Until Element Is Visible    //a[contains(text(),"${value}")]
    Click Element    xpath=//a[contains(text(),"${value}")]

Select
    [Arguments]    ${product}    ${size}    ${color}    ${quantity}
    Wait Until Element Is Visible    xpath=/html/body/div[2]/main/div[3]/div[1]/div[4]/ol/li/div/div/strong/a
    Click Element    xpath=/html/body/div[2]/main/div[3]/div[1]/div[4]/ol/li/div/div/strong/a
    Wait Until Element Is Visible    xpath=//div[text()="${size}"]
    Click Element    xpath=//div[text()="${size}"]
    Wait Until Element Is Visible    xpath=//div[@option-label="${color}"]
    Click Element    xpath=//div[@option-label="${color}"]
    Wait Until Element Is Visible    id=qty
    Click Element    id=qty
    Clear Element Text    id=qty
    Input Text    id=qty    ${quantity}

Verify
    [Arguments]    ${value}
    IF    "${value}" == "Account Created Succesfully"
        Wait Until Element Is Visible    xpath=//div[text()="Thank you for registering with Main Website Store."]
    ELSE IF    "${value}" == "Account Signed In Succesfully"
        Wait Until Element Is Visible    class=logged-in
    ELSE IF    "${value}" == "Account Signed Out Succesfully"
        Wait Until Element Is Visible    class=customer-account-logoutsuccess
    ELSE IF    "${value}" == "Succesfully Added To Cart"
        Wait Until Element Is Visible    class=message-success
    ELSE IF    "${value}" == "Checkout Page"
        Wait Until Element Is Visible    xpath=//title[contains(text(),"Checkout")]
    ELSE IF    "${value}" == "Confirmation Page"
        Wait Until Element Is Visible    xpath=//title[contains(text(),"Success Page")]
    END

*** Test Cases ***
Create an Account
    Maximize Browser Window
    Click    Create an Account
    Fill    Create First Name    TestUser123
    Fill    Create Last Name    TestUser123
    Fill    Create Email    TestUser123@lolol.fi
    Fill    Create Password    TestUser1234!
    Click    Submit Account Creation Form
    Verify    Account Created Succesfully

Sign User In And Sign User Out
    Maximize Browser Window
    Click    Sign In
    Fill    Email    TestUser123@lolol.fi
    Fill    Password    TestUser1234!
    Click    Submit Account Sign In Form
    Verify    Account Signed In Succesfully
    Click    Sign Out
    Verify    Account Signed Out Succesfully

Purchase A Product
    Maximize Browser Window
    Click    Sign In
    Fill    Email    TestUser123@lolol.fi
    Fill    Password    TestUser1234!
    Click    Submit Account Sign In Form
    Verify    Account Signed In Succesfully
    Click    Sale
    Click    Jackets
    Filter    Pattern    Color-Blocked
    Select    Inez Full Zip Jacket    XS    Red    2
    Click    Add To Cart
    Verify    Succesfully Added To Cart
    Click    Open Cart
    Click    Proceed To Checkout
    Sleep    10000ms
    Fill    Street Address    Test
    Fill    City    Oulu
    Fill    State/Province    Oulu
    Fill    Zip/Postal Code    90100
    Fill    Country    Finland
    Fill    Phone Number    00000000000
    Click    Flat Rate Shipping
    Click    Next
    Click    Place Order
    Click    Sign Out
    Verify    Account Signed Out Succesfully
