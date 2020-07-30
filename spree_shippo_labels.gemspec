# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_shippo_labels'
  s.version     = '2.0'
  s.summary     = 'Simple shipping label purchase via Shippo.'
  s.description = 'The Shippo Spree extensions connects a Spree store with Shippo. Shippo will import all orders via the Spree API, allowing you to obtain shipping labels for your shipping carriers on goshippo.com. Supported carriers include USPS, UPS, FedEx, DHL Express, Canada Post and many others.'
  s.required_ruby_version = '>= 1.9.3'

  s.author    = 'Anoop'
  s.email     = 'support@goshippo.com'
  s.homepage  = 'https://goshippo.com'

  #s.files       = `git ls-files`.split("\n")
  #s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree_core', '>= 3.7.0', '< 5.0'

  s.add_development_dependency 'capybara', '~> 2.4'
  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'factory_girl', '~> 4.4'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'rspec-rails',  '~> 3.1'
  s.add_development_dependency 'sass-rails', '~> 4.0.2'
  s.add_development_dependency 'selenium-webdriver'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'sqlite3'
end
