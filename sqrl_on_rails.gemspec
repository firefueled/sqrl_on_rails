# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sqrl_on_rails/version'

Gem::Specification.new do |spec|
  spec.name          = "sqrl_on_rails"
  spec.version       = SqrlOnRails::VERSION
  spec.authors       = ["Pablo Soares"]
  spec.email         = ["pablo@firefueled.com"]

  spec.summary       = %q{Simple way to integrate GRC's SQRL login system into your app}
  spec.description   = %q{This gem provides way to integrate GRC's SQRL login system with your app}
  spec.homepage      = "http://sqrl_on_rails.firefueled.com"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = Dir["{lib,app}/**/*"] + ["LICENSE.txt", "README.md"]
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'rqrcode', '~> 0.6'

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", '~> 0'
end
