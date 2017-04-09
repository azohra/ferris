require_relative 'regions/header'
require_relative 'pages/home'
require_relative 'pages/apple'

class Wikipedia < Ferris::Site
  page(:home_page, TestSite::Home)
  page(:apple_page, TestSite::Apple)
  region(:header, TestSite::Header) { browser.div(id: 'mw-head') }
end


