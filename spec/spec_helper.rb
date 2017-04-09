require_relative '../lib/ferris'
require_relative 'support/site'
require 'coveralls'
require 'pry'

Coveralls.wear!

Ferris.base_url = 'https://en.wikipedia.org'
Ferris.browser = Watir::Browser.new :chrome

RSpec.configure do |config|
  config.after :suite do
    Ferris.browser.close
  end
end
