Feature: Simple Account search.
As Salesforce Standard User I want be able to create Accounts
by entering at least a name into the Quick Action

Background:
  Given a logged in user on the Home Tab

Scenario: Users can create Accounts from the Accounts tab
  Given I am on the Accounts tab
  And I click the 'New' Action
  And I enter 'Munich Meetup' for AccountName
  When I click 'Save'
  Then I am redirected to the newly created Account
