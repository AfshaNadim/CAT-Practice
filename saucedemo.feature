Feature: Login saucedemo

@Login
Scenario: Login
Given I open "Chrome" web browser
And I navigate to "https://www.saucedemo.com/" in web browser within 10 seconds
#And I maximize web browser
And I wait 5 seconds
Then I type "standard_user" in element "xPath://input[@placeholder='Username']" in web browser
Then I type "secret_sauce" in element "xPath://input[@placeholder='Password']" in web browser
And I click element "id:login-button" in web browser
Once I see "Swag Labs" in web browser
Then I echo "Successfully Logged In"

@BuyItem
Scenario: Place and Order
#Given I execute scenario "Login"
Then I click element "xPath://div[@class='inventory_list']/div[2]/div[2]/div[2]/button[@id='add-to-cart-sauce-labs-bike-light']" in web browser
And I wait 5 seconds
And I assign "Remove" to variable "ItemAddedToCart"
Then I copy text inside element "xPath://div[@class='inventory_list']/div[2]/div[2]/div[2]/button[@id='remove-sauce-labs-bike-light']" in web browser to variable "itemAdded"
If I verify text $ItemAddedToCart is equal to $itemAdded
    Then I echo "Item Added to cart"
    Else I echo "Fail to add item"
EndIf
Then I click element "xPath://a[@class='shopping_cart_link']" in web browser
And I wait 5 seconds
Then I click element "id:checkout" in web browser
And I type "Afsha" in element "id:first-name" in web browser
And I type "Mohammed" in element "id:last-name" in web browser
Then I type "440030" in element "id:postal-code" in web browser
And I click element "id:continue" in web browser
Then I save screenshot as "Output/CheckoutOverview.png"
And I click element "id:finish" in web browser
Once I see "Thank you for your order!" in web browser within 3 seconds
Then I echo "Successfully placed the order"