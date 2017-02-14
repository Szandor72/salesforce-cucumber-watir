
Given(/^a logged in user on the Home Tab$/) do
  @browser.goto "http://sz-greased-dev-ed.my.salesforce.com"
  @browser.text_field(:name => 'username').set 'szandor72+meetup@gmail.com'
  @browser.text_field(:name => 'pw').set 'SalesforceMeetupsAreAwesome1!!1'
  @browser.button(:name => 'Login').click
  @browser.span(:text => 'Home').wait_until_present
end

Given(/^I am on the Accounts tab$/) do
  @browser.span(:text => 'Accounts').click
end

And(/^I click the '([^"]*)' Action$/) do |arg|
  @browser.link(:text => arg).click
  sleep(1)
end

And(/^I enter '([^"]*)' for AccountName$/) do |arg|
  @browser.send_keys :tab
  @browser.send_keys arg
  @AccountName = arg
end

When(/^I click '([^"]*)'$/) do |arg|
  @browser.button(:title => 'Save').click
end

Then(/^I am redirected to the newly created Account$/) do
  sleep(3)
  assert_it ('URL shows successful redirect') {@browser.url.include? "/sObject/001"} #this verifies q=[search term] exists in url
  assert_it ('Account Name appears on page') {@browser.text.include? @AccountName} #checks search div for exact match on keyword
end
