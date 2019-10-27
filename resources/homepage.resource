*** Settings ***
Library    SeleniumLibrary    

*** Keywords ***
Add product to shopping cart
    [Arguments]    ${product_id}
    ${addToCartButton}=    Set Variable    css:ul#homefeatured a[data-id-product="${product_id}"]
    Mouse Over    xpath:(//div[@class="product-image-container"])[${product_id}]
    Click Element    ${addToCartButton}

Checkout_product
    ${processToCheckoutLink}=    Set Variable    css:a[title="Proceed to checkout"]
    Wait Until Element Is Visible    ${processToCheckoutLink} 
    Click Link    ${processToCheckoutLink}    
      