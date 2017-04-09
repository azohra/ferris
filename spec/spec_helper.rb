require 'ferris'
require 'coveralls'
require 'watir_model'
require 'pry'
require_relative 'support/site'
require_relative 'support/form_data'

Coveralls.wear!

Ferris.browser = Watir::Browser.new :chrome

Watir.default_timeout = 1

RSpec.configure do |config|
  config.after :suite do
    Ferris.browser.close
  end
end
