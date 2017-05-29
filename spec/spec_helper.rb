require 'coveralls'
Coveralls.wear!

require 'ferris'
require 'watir_model'
require 'pry'
require_relative 'support/site'

BASE_URL = 'https://automation-wizards.github.io/ferris'

Watir.default_timeout = 1
system('docker run -d -p 4444:4444 --name selenium-hub selenium/hub:3.4.0-chromium')
system('docker run --name chrome -d --link selenium-hub:hub selenium/node-chrome:3.4.0-chromium')
sleep(5)
#Ferris::Browser.start
#Ferris::Browser.remote(hub:"http://localhost:4444/wd/hub", browser: "chrome")

RSpec.configure do |config|
  config.alias_it_should_behave_like_to :it_supports, ''
  config.after(:suite) do 
    system('docker stop selenium-hub')
    system('docker stop chrome')
    system('docker rm selenium-hub')
    system('docker rm chrome')
  end
  
end
