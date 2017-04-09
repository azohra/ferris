require_relative 'home'
require_relative 'header'

class TestSite < Ferris::Site
  Ferris.base_url = 'file://' + ENV['PWD'] + '/spec/support'
  page(:home_page, Home)
  region(:header, Header) { browser.header }
end
