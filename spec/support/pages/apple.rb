module Pages
  class Apple < Ferris::Core
    partial_url(required: true) { '/wiki/Apple' }
    page_title(required: true) { 'Apple - Wikipedia' }

    element(:article_heading, required: true) { browser.h1(id: 'firstHeading') }

  end
end
