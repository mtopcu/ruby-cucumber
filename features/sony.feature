Feature: Test on SonyMobile
 
Scenario: Search page test
 Given I am on "gb/products/phones/"
 Then I should see text "Sony Mobile Communications"
 And I should not see text "testsony"
 And I should see selector "#bnw-signup-button"


