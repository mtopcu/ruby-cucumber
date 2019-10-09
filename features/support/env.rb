require 'capybara'
require 'capybara/dsl'
require 'cucumber'
require 'selenium-webdriver'
require 'rspec'


Capybara.default_driver = :selenium
Capybara.app_host = "https://www.sonymobile.com"
Capybara.register_driver :selenium do |app|
  
  Capybara::Selenium::Driver.new app, browser: :chrome
end

=begin // For Selenium Grid
    caps = Selenium::WebDriver::Remote::Capabilities.chrome
    Capybara::Selenium::Driver.new(
        app,
        browser: :remote,
        url: "http://localhost:4444/wd/hub",
        desired_capabilities: caps)
    end
=end


World(Capybara::DSL)