Feature: Web Testing

Scenario: Open Web Browser
Given I open "Chrome" web browser
And I navigate to "https://www.google.com/" in web browser within 10 seconds
And I maximize web browser
And I wait 5 seconds
And I type "Hello" in element "id:APjFqb" in web browser
And I close web browser

@Login
Scenario: Login
Given I open "Chrome" web browser
And I navigate to "https://www.saucedemo.com/" in web browser within 10 seconds
And I maximize web browser
And I wait 5 seconds
Then I type "standard_user" in element "xPath://input[@placeholder='Username']" in web browser
Then I type "secret_sauce" in element "xPath://input[@placeholder='Password']" in web browser
And I click element "id:login-button" in web browser
Once I see "Swag Labs" in web browser
Then I echo "Successfully Logged In"

@Image
Scenario: Image matching
Given I open "Chrome" web browser
And I navigate to "https://www.saucedemo.com/" in web browser within 10 seconds
And I maximize web browser
And I wait 5 seconds
Then I type "standard_user" in element "xPath://input[@placeholder='Username']" in web browser
Then I type "secret_sauce" in element "xPath://input[@placeholder='Password']" in web browser
And I click element "id:login-button" in web browser
Then I wait 10 seconds
And I see image "Image:Images\image1.png" in web browser within 10 seconds
And I save screenshot

@PriceCheck
Scenario: Price Check
Given I open "Chrome" web browser
And I navigate to "https://www.saucedemo.com/" in web browser within 10 seconds
#And I maximize web browser
And I wait 5 seconds
Then I type "standard_user" in element "xPath://input[@placeholder='Username']" in web browser
Then I type "secret_sauce" in element "xPath://input[@placeholder='Password']" in web browser
And I click element "id:login-button" in web browser
And I wait 5 seconds
And I assign "29.99" to variable "ExpectedPrice1"
And I assign variable "ExpectedPrice" by combining "$"$ExpectedPrice1
And I echo $ExpectedPrice
Then I copy text inside element "xPath://div[@class='inventory_list']/div[1]/div[2]/div[2]/div" in web browser to variable "Price"
If I verify text $Price is equal to $ExpectedPrice
 Then I click element "xPath://div[@class='inventory_list']/div[1]/div[2]/div[2]/button" in web browser
Else I echo "Price is too high"
Endif