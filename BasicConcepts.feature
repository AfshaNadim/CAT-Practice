Feature: Variable

Scenario: Open notepad
Given I "Open Notepad"
Then I execute process "notepad.exe"

Scenario: Combine Variable
Given I "Combine 2 variables"
Then I execute scenario "Open notepad"
Then I assign "Afsha" to variable "Fname"
And I assign "Mohammed" to variable "Lname"
Then I wait 5 seconds
Then I assign variable "FullName" by combining $Fname " " $Lname
Then I echo $FullName
Then I enter $FullName

@UserInput
Scenario: User Input variable
Given I "Take input from the user"
Then I prompt "Enter Gender" and assign user response to variable "Gender"
And I prompt "Enter Age" for integer and assign user response to variable "Age"
Then I echo "Gender is" $Gender
And I echo "Age is" $Age
And I wait 5 seconds

@var2int
Scenario: Converting string to integer
Given I "I convert string variable to integer"
Then I assign "10" to variable "var2int"
Then I convert string variable "var2int" to INTEGER variable "var2int" 
And I echo $var2int

@CompareVariable
Scenario: Compare variables
Given I "Compare 2 integer variables"
Then I prompt "Enter number 1" for integer and assign user response to variable "NUM1"
And I prompt "Enter number 2" for integer and assign user response to variable "NUM2"
If I verify number $NUM1 is greater than $NUM2
    Then I echo "Number 1 is greater"
    Else I echo "Number 2 is greater than 1"
EndIf

@GroovyStatment
Scenario: Groovy Script
Given I "Creating Groovy script"
And I prompt "Enter number 1" for integer and assign user response to variable "num1"
And I prompt "Enter number 2" for integer and assign user response to variable "num2"
Then I execute Groovy "Add=num1+num2"
Then I echo $Add

@File
Scenario: Write data to File
Given I "Create a file"
Once I create file "Datasets\File1.csv"
Then I append "My file is created" to end of file "Datasets\File1.csv"

@File2
Scenario: Create file if does not exists
Given I "Will create a file if it does not exists"
Given I assign "Datasets\File2.csv" to variable "filePath"
If I verify file $filePath exists
    Then I echo "File is already created"
    Else I create file $filePath
EndIf

@List
Scenario: List Creation
Given I "Create a list Cities"
Then I create list "Cities"
And I append element "Delhi" to list "Cities"
And I append element "Pune" to list "Cities"
And I append element "Nagpur" to list "Cities"
And I append element "Aurangabad" to list "Cities"
Then I echo $Cities
And I sort list "Cities"
Then I echo $Cities

@Outline
Scenario Outline: Read the data from the file
CSV Examples: Datasets/ReadData.csv
Given I "Read the data from the file"
Given I echo <Num1>
If I verify number <Num1> is equal to <Num2>
	Then I echo "Both numbers are same"
Else I echo "Numbers are not same"
EndIf

@Outline2
Scenario Outline: Create data in the script
Given I "Create data in the script"
And I echo <Name>
And I echo <Surname>
Examples:
|Name|Surname|
|"Afsha"|"Mohammed"|
|"Nadim"|"Pathan"|
#And I echo <Name>


 