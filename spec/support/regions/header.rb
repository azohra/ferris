module TestSite
  class Header < Ferris::Core
    element(:search_term) { root.text_field(id: 'searchInput') }
    element(:submit_btn)  { root.button(name: 'go') }

    def search(input)
      search_term.set input
      submit_btn.click
    end
  end
end
