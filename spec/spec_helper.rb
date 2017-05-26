require 'coveralls'
Coveralls.wear!

require 'ferris'
require 'watir_model'
require 'pry'
require_relative 'support/site_map'

Watir.default_timeout = 1
Ferris::Browser.start

RSpec.configure do |config|
  config.alias_it_should_behave_like_to :it_supports, ''
  config.after(:suite) {Ferris::Browser.close}
end
