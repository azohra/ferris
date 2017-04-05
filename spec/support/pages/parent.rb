module TestSite
  class Parent < Grandparent
    partial_url { '/parent' }
    element(:parent_req, required: true)  { browser.div(id: 'parent_id') }
  end
end
