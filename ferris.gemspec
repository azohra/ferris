# coding: utf-8

Gem::Specification.new do |spec|
  spec.name          = 'ferris_watir'
  spec.version       = '0.1.1'
  spec.platform      = Gem::Platform::RUBY
  spec.authors       = ['Automation Wizards']
  spec.email         = ['Justin.Commu@loblaw.ca']
  spec.homepage      = 'https://loblawdigital.ca'
  spec.summary       = 'Next level web testing framework'
  spec.description   = 'An un-opinionated tes framework built on top of Watir'
  spec.license       = 'MIT'
  spec.files         = `git ls-files`.split("\n")
  spec.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  spec.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency             'watir', '~> 6.1'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'coveralls'
  spec.add_development_dependency 'pry'

end
