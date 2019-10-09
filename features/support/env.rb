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
  
World(Capybara::DSL)
