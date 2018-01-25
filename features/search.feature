Feature: Check search category labels
  As a QA and developer
  I want to check search labels on search page

Scenario: Check all labels on search pages
  Given I am on "/global-en/search/"
  And I should see text "ALL" 
  And I should see text "PRODUCTS" 
  And I should see text "SUPPORT" 
  And I should see text "LEGAL" 