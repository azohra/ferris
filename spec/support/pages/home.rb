module TestSite
  class Home < Ferris::Page
    partial_url { '/wiki/Main_Page' }
    title { 'Wikipedia, the free encyclopedia' }
  end
end
