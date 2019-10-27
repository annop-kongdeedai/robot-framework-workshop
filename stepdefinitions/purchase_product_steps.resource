*** Settings ***
Library    SeleniumLibrary    
Resource    ../resources/homepage.resource
Resource    ../resources/checkoutsummarypage.resource

*** Keywords ***
Unauthen user add product "${product_id}" to shipping cart
    homepage.Add product to shopping cart    ${product_id}

I checkout product
    homepage.Checkout_product
    
I should see total product price equal to "${total_product_price}"
    checkoutsummarypage.Verify total product price    ${total_product_price}
   
    
    
    