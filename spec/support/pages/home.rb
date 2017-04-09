module TestSite
  class Home < Ferris::Page
    partial_url { '/wiki/Main_Page' }
    page_title { 'Wikipedia, the free encyclopedia' }
  end
end