*** Settings ***
Library    SeleniumLibrary   
Library    String     

*** Variables ***
# ${totalShippingPrice}=    Get Text    id:total_shipping
# ${totalPrice}=    Get Text    id:total_price

*** Keywords ***
Total products price
    Run Keyword And Return    Get Text    id:total_product

Total shipping price
    Run Keyword And Return    Get Text    id:total_shipping

Total price without tax
    Run Keyword And Return    Get Text    id:total_price_without_tax    
    
Total tax
    Run Keyword And Return    Get Text    id:total_tax
    
Total price with tax
    Run Keyword And Return    Get Text    id:total_price


Wait unti page load success
    Wait Until Page Contains    Shopping-cart summary

Verify total product price
    [Arguments]    ${verifyingProductPrice}
    ${totalProductsPrice}=    Total products price
	Should Be Equal As Strings    $${verifyingProductPrice}    ${totalProductsPrice}

Verify shipping fee
    [Arguments]    ${verifyingShippingFee}
    ${totalShippingPrice}=    Total shipping price
	Should Be Equal As Strings    $${verifyingShippingFee}    ${totalShippingPrice}  

Verify total price
    ${totalProductsPrice}=    Total products price
    ${totalShippingPrice}=    Total shipping price
    ${totalPriceWithoutText}=    Total price without tax
    ${totalTax}=    Total tax
    ${totalPriceWithTax}=    Total price with tax
    
    ${totalProductsPriceRemoveDollar}=    Replace String    ${totalProductsPrice}    $    ${EMPTY}   
	${totalShippingPriceRemoveDollar}=    Replace String    ${totalShippingPrice}    $    ${EMPTY}  
	${totalPriceWithoutTextRemoveDollar}=    Replace String    ${totalPriceWithoutText}    $    ${EMPTY}   
	${totalTaxRemoveDollar}=    Replace String    ${totalTax}    $    ${EMPTY}  
	${totalPriceWithTaxRemoveDollar}=    Replace String    ${totalPriceWithTax}    $    ${EMPTY}   
    
	 
    ${totalPriceWithoutTaxCalculate}=    Evaluate     ${totalProductsPriceRemoveDollar}+${totalShippingPriceRemoveDollar}
    Should Be Equal As Strings   ${totalPriceWithoutTextRemoveDollar}    ${totalPriceWithoutTaxCalculate} 
    
    ${totalPriceWithTaxCalculate}=    Evaluate     ${totalPriceWithoutTextRemoveDollar}+${totalTaxRemoveDollar}
    Should Be Equal As Strings   ${totalPriceWithTaxRemoveDollar}    ${totalPriceWithTaxCalculate} 
          