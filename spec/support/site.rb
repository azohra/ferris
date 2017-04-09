require_relative 'regions/input'
require_relative 'pages/home'

class TestSite < Ferris::Site
  Ferris.base_url = 'file://' + ENV['PWD'] + '/spec'
  page(:home_page, Home)
end
