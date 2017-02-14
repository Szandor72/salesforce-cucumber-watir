Feature: Text entered into brandnew searchbar
Searchbar should not allow searches with to few characters
Searchbar should indicate to user she has to enter more characters
Minimum character count for searchbar is: 5

Background:
  Given a logged in user on the Home Tab

Scenario: User enters no text
  Given I navigate to 'cucumber_demo.app'
  When I enter ''
  Then I should not be able to click the button

Scenario: User enters not enough text
  Given I navigate to 'cucumber_demo.app'
  When I enter 'Nope'
  Then I should not be able to click the button
  And a warning is shown to me that says 'Please enter more text'

Scenario: User enters enough text
  Given I navigate to 'cucumber_demo.app'
  When I enter 'Salesforce Developers'
  Then I should be able to click the button
