
require 'capybara'
require 'rspec'
require 'cucumber'
require 'capybara/cucumber'
require 'webdrivers'
require 'faker'
require 'pry'
#require 'capybara/accessible'
require 'site_prism'
require 'yaml'

## Environment definitions (BROWSER=firefox / without parameter chrome)
case ENV['BROWSER']
when 'firefox'
  # using firefox
  DRIVER = :firefox
  Capybara.register_driver :firefox do |app|
    Capybara::Selenium::Driver.new(app, browser: :firefox)
  end
else
  # using chrome
  DRIVER = :chrome
  Capybara.register_driver :chrome do |app|
    Capybara::Selenium::Driver.new(app, browser: :chrome)
  end
end
Capybara.configure do |config|
  config.default_driver = DRIVER
  config.app_host = 'http://automationpractice.com/index.php?'
  config.default_max_wait_time = 30
end

## Fixtures
DEFAULT_DATA = YAML.load_file('./fixtures/signup_form.yml')