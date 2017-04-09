module TestSite
  class Apple < Ferris::Page
    partial_url { '/wiki/Apple' }
    page_title { 'Apple - Wikipedia' }

    element(:article_heading) { browser.h1(id: 'firstHeading') }
  end
end
