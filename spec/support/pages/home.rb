module TestSite
  class Home < Ferris::Core
    partial_url { '/wiki/Main_Page' }
  end
end