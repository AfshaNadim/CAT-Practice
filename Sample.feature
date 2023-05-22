Feature: My Feature
Background: 

@Outline
Scenario Outline: I read data
CSV Examples: Datasets\ReadData.csv
Given I "Ready the data from the file"
Then I echo <Num1>

@If
Scenario: If else
Given I "Comapare variable"
Then I assign 40 to variable "num1"
and I assign 30 to variable "num2"
If I verify number $num1 is greater than $num2
    Then I echo "num1 is greater"
    Else I echo "num2 is greater"
EndIf

@login
Scenario: login
Given I open "Chrome" web browser
Then I navigate to "https://www.saucedemo.com/" in web browser
Then i wait 5 seconds
ANd i click element "xPath://input[@id='user-name']" in web browser
ANd i enter "standard_user"
ANd i click element "xPath://input[@id='password']" in web browser
And i enter "secret_sauce"
Then i click element "xPath://input[@id='login-button']" in web browser


Scenario: Add to cart
Given i execute scenario "login"


