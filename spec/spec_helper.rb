require_relative '../lib/ferris'
require_relative 'support/site'
require 'coveralls'

Coveralls.wear!

RSpec.configure do |config|
  config.include Ferris::SiteObject

  config.before(:each) do
    Ferris::Config.browser = Watir::Browser.new :chrome
  end

  config.after(:each) do |_scenario|
    Ferris::Config.browser.close
  end
end
