require 'coveralls'
Coveralls.wear!

require './spec/support/site'

RSpec.configure do |config|
  config.include Ferris::SiteObject

  config.before(:each) do
    Ferris::Config.browser = Watir::Browser.new :chrome
  end

  config.after(:each) do |_scenario|
    Ferris::Config.browser.close
  end
end
