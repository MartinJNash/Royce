# frozen_string_literal: true

require_relative 'lib/royce/version'

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

  s.files = `git ls-files`.split("\n")

  s.add_runtime_dependency 'rails', '>= 5.0'

  s.add_development_dependency 'appraisal'
  s.add_development_dependency 'pry'
  s.add_development_dependency 'pry-byebug'
  s.add_development_dependency 'pry-doc'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'sqlite3'
end
