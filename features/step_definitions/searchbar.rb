
Given(/^I navigate to '([^"]*)'$/) do |arg|
  @browser.goto('https://sz-greased-dev-ed.lightning.force.com/c/'+arg)
end

When(/^I enter '([^"]*)'$/) do |arg|
  @browser.text_field(:name => 'searchfield').set arg
end

Then(/^I should not be able to click the button$/) do
  assert_it ('Search Button is disabled') {!@browser.button(:text => 'Search').enabled?}
end

And(/a warning is shown to me that says '([^"]*)'$/) do |arg|
  assert_it ('Warning Badge must be shown') {@browser.div(:data_id => 'warning').text.downcase == arg.downcase}
end

Then(/^I should be able to click the button$/) do
  assert_it ('Search Button is disabled') {@browser.button(:text => 'Search').enabled?}
end
