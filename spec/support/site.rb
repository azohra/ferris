require_relative 'regions/header'
require_relative 'pages/home'
class Wikipedia < Ferris::Site
  page(:home_page, TestSite::Home)
  region(:header, TestSite::Header) { browser.div(id: 'mw-head') }
end


