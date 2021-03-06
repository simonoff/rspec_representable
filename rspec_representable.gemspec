# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rspec/representable/version'

Gem::Specification.new do |spec|
  spec.name          = 'rspec_representable'
  spec.version       = RSpec::Representable::VERSION
  spec.authors       = ['Alexander Simonov']
  spec.email         = ['alex@simonov.me']
  spec.summary       = 'Simple RSpec matchers for Representable objects'
  spec.description   = 'Simple RSpec matchers for Representable objects'
  spec.homepage      = 'https://github.com/simonoff/rspec_representable'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'rspec', '>= 3.0'
  spec.add_dependency 'representable', '>= 2.2'

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
end
