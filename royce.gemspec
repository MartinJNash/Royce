# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('../lib', __FILE__)
require 'royce/version'

Gem::Specification.new do |s|
  s.name        = 'royce'
  s.version     = Royce::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Martin Nash']
  s.email       = ['martin.j.nash@gmail.com']
  s.homepage    = 'https://github.com/MartinJNash/Royce'
  s.summary     = 'A Rails roles sollution.'
  s.description = 'Roles.'
  s.license     = 'MIT'

  s.add_dependency 'rails', '>= 4.2'

  s.add_development_dependency 'appraisal'
  s.add_development_dependency 'pry'
  s.add_development_dependency 'pry-byebug'
  s.add_development_dependency 'pry-doc'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'sqlite3'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.require_paths = ['lib']
end
