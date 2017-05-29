require 'coveralls'
Coveralls.wear!

require 'ferris'
require 'watir_model'
require 'pry'
require_relative 'support/site'

BASE_URL = 'https://automation-wizards.github.io/ferris'

Watir.default_timeout = 1
#Ferris::Browser.start
#Ferris::Browser.remote(hub:"http://localhost:4444/wd/hub", browser: "chrome")

RSpec.configure do |config|
  config.alias_it_should_behave_like_to :it_supports, ''
  #config.after(:suite) {Ferris::Browser.stop}
end
