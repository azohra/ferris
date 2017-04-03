module TestSite
  class Child < Parent
    partial_url { '/child' }
    element(:child_req, required: true)  { browser.div(id: 'child_id') }
  end
end
