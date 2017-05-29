require_relative 'data/element_data'
require_relative 'regions/header'
require_relative 'regions/article'
require_relative 'pages/elements'

class Website < Ferris::Site

  page(:elements_page, ElementsPage)

  region(:header,    Header)   { browser.header }
  regions(:articles, Article)  { browser.articles }
    
  element(:my_element) { browser.body }

end


