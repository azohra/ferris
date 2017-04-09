require 'ferris'
require 'coveralls'
require 'watir_model'
require_relative 'support/site'
require_relative 'support/data/inputs'


Coveralls.wear!

Ferris.browser = Watir::Browser.new :chrome

RSpec.configure do |config|
  config.after :suite do
    Ferris.browser.close
  end
end
