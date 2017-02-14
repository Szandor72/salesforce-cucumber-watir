require 'watir'
require 'cucumber'

def browser_name
    (ENV['BROWSER'] ||= 'chrome').downcase.to_sym  # allows me to pass browser as a command line argument
end

def environment
    (ENV['ENVIRONMENT'] ||= 'prod').downcase.to_sym  # allows me to set environment for testing as argument. defaults to 'prod'
end

Before do |scenario|
  def assert_it message, &block
    begin
      if (block.call)
        puts "Assertion PASSED for #{message}"
      else
        puts "Assertion FAILED for #{message}"
        fail('Test Failure on assertion')
      end
    rescue => e
      puts "Assertion FAILED for #{message} with exception '#{e}'"
      fail('Test Failure on assertion')
    end
  end
  p "Starting #{scenario}"
  if environment == :int
    @browser = Watir::Browser.new browser_name
    @browser.goto "http://sandbox.amazon.com"  # this is an example test env. it doesn't exist real world.
    @browser.text_field(:id=>'username').set "test" # example of mitigating some test env login - not a real login :)
    @browser.text_field(:id=>'password').set "test1234" # example of mitigating some test env login - not a real pass :)
    @browser.button(:id => 'submit').click

  elsif environment == :local
    @browser = Watir::Browser.new browser_name
    @browser.goto "http://localhost/"

elsif environment == :prod
    @browser = Watir::Browser.new browser_name
  end
end
After do |scenario|
  if scenario.failed?  # the classic take a screenshot if scenario fails block.
    Dir::mkdir('screenshots') if not File.directory?('screenshots')
    screenshot = "./screenshots/FAILED_#{scenario.name.gsub(' ','_').gsub(/[^0-9A-Za-z_]/, '')}.png"
    @browser.driver.save_screenshot(screenshot)
    embed screenshot, 'image/png'
  end
  @browser.close
end
