module TestSite
  class Grandparent < Ferris::Core
    partial_url { '/grandparent' }
    element(:grand_req, required: true)  { browser.div(id: 'grand_id') }
  end
end
