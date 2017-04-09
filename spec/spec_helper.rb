require_relative '../lib/ferris'
require_relative 'support/site'
require 'coveralls'
require 'pry'

Coveralls.wear!

Ferris.base_url = 'https://en.wikipedia.org'

RSpec.configure do |config|
  config.before(:each) do
    Ferris.browser = Watir::Browser.new :chrome
  end

  config.after(:each) do |_scenario|
    Ferris.browser.close
  end
end
