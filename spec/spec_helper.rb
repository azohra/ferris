require 'ferris'
require 'coveralls'
require 'watir_model'
require 'pry'
require_relative 'support/sites/compliance/site_map'
require_relative 'support/sites/responsive/site_map'

Coveralls.wear!

Watir.default_timeout = 1
BROWSER = Watir::Browser.new :chrome
RSpec.configure do |config|
  config.alias_it_should_behave_like_to :it_supports, ''

end
