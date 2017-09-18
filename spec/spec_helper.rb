require 'coveralls'
Coveralls.wear!

require 'ferris'

require_relative 'support/site'

BASE_URL = 'https://azohra.github.io/ferris'

Watir.default_timeout = 5
#Watir.logger.output = 'watir.log'
#Watir.logger.level = :debug

Ferris::Browser.define(:my_default,  :local)
Ferris::Browser.define(:my_custom, :local, cpu_only: true, no_sandbox: true, headless: true, size:'1900,1200')
Ferris::Browser.define(:headless, :local, cpu_only: true, no_sandbox: true, headless: true, size:'1900,1200')
Ferris::Browser.default = :headless

RSpec.configure do |config|
  config.alias_it_should_behave_like_to :it_supports, ''
end
