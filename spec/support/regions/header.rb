module TestSite
  class Header < Ferris::Region
    element(:search_term) { root.text_field(id: 'searchInput') }
    element(:submit_btn)  { root.button(name: 'go') }
  end
end
