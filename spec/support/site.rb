require_relative 'pages/home'
require_relative 'pages/apple'
require_relative 'regions/header'

module Ferris
  module SiteObject
    class Wikipedia
      SiteObject.configure do
        base_url('https://en.wikipedia.org')

        page(:home_page, Pages::Home)
        page(:apple_page, Pages::Apple)

        region(:header, Regions::Header) { browser.div(id: 'mw-head') }
      end
    end
  end
end
