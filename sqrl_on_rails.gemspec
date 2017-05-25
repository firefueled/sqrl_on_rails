# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "sqrl_on_rails/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name          = "sqrl_on_rails"
  s.version       = SqrlOnRails::VERSION
  s.authors       = ["Pablo Soares"]
  s.email         = ["pablo@firefueled.com"]

  s.summary       = %q{Simple way to integrate GRC's SQRL login system into your app}
  s.description   = %q{This gem provides way to integrate GRC's SQRL login system with your app}
  s.homepage      = "http://sqrl_on_rails.firefueled.com"
  s.license       = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", '>= 4.2'
  s.add_dependency "activerecord", ">= 3.0"
  s.add_dependency 'rqrcode', '~> 0.6'
  s.add_dependency 'rbnacl-libsodium', '~> 1.0'

  s.add_development_dependency "sqlite3", '~> 1'
  s.add_development_dependency "byebug", '~> 9'
end
