require_relative 'home'
require_relative 'header'

class TestSite < Ferris::Site
  base_url { 'file://' + ENV['PWD'] + '/spec/sites/static_demo' }
  page(:home_page, Home)
  region(:header, Header) { browser.header }
end
