class Home < Ferris::Page
  partial_url { '/index.html' }
  title { 'HTML5 Test Page' }

  region(:input, Input) { browser.section(id: 'forms') }
end

