require './lib/ferris'

require './spec/support/regions/header'

require './spec/support/pages/home'
require './spec/support/pages/apple'
require './spec/support/pages/grandparent'
require './spec/support/pages/parent'
require './spec/support/pages/child'

module Ferris
  module SiteObject
    class Wikipedia
      SiteObject.configure do
        base_url('https://en.wikipedia.org')
        page(:home_page, TestSite::Home)
        page(:apple_page, TestSite::Apple)
        page(:child_page, TestSite::Child)
        page(:parent_page, TestSite::Parent)
        page(:grandparent_page, TestSite::Grandparent)

        region(:header, TestSite::Header) { browser.div(id: 'mw-head') }
      end
    end
  end
end
