require 'ferris'
require 'coveralls'
require 'watir_model'
require 'pry'
require_relative 'support/site_models/html5_demo/site'
require_relative 'support/data_models/html5_demo/form_data'

Coveralls.wear!

Ferris.browser = Watir::Browser.new :chrome

Watir.default_timeout = 1

RSpec.configure do |config|
  config.after :suite do
    Ferris.browser.close
  end
end
