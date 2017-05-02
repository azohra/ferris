class Home < Ferris::Page
  partial_url { '/index.html' }
  title { 'RegistrationHacks' }

  region(:hero, StaticDemo::Hero) { browser.section(class: 'hero') }
  region(:about, StaticDemo::About) { browser.section(class: 'about') }
  region(:info, StaticDemo::Info) { browser.section(class: 'info') }
  region(:faq, StaticDemo::FAQ) { browser.section(class: 'faq') }
  region(:footer, StaticDemo::Footer) { browser.section(class: 'faq') }
end
