Feature: Add two string feature
    As an user
    In order to concatenate two strings together
    The user wants to fill out two text fields with strings and press Add button, then gets the result at the result text field    
Scenario:
    Main screen

Given I launch the app 
Then I should see textfield "arg1" 
And I should see textfield "arg2" 
And I should see textfield "res"
And I should see button "Add"
When I fill in "arg1" with "qwer"
And I fill in "arg2" with "ty"
When I touch the button marked "add"
Then I should see result "qwerty" in textfield marked "res" 



