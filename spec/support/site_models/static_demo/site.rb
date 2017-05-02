require_relative 'home'
require_relative 'regions/header'

class TestSite < Ferris::Site
  base_url { 'file://' + ENV['PWD'] + '/spec/sites/html5_demo' }
  page(:home_page, Home)
end
