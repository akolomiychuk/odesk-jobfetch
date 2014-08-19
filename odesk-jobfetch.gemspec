# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'odesk/jobfetch/version'

Gem::Specification.new do |spec|
  spec.name          = 'odesk-jobfetch'
  spec.version       = Odesk::Jobfetch::VERSION
  spec.authors       = ['Anton Kolomiychuk']
  spec.email         = ['kolomiychuk.anton+gh@gmail.com']
  spec.summary       = 'Get Odesk jobs from on-site search.'
  spec.homepage      = 'https://github.com/akolomiychuk/odesk-jobfetch'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.5'
  spec.add_development_dependency 'rake'
end
