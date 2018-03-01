# frozen_string_literal: true

require 'rspec/core/rake_task'
require 'rdoc/task'

RSpec::Core::RakeTask.new(:spec)
task default: :spec

RDoc::Task.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'Royce'
  rdoc.options << '--line-numbers'
  rdoc.rdoc_files.include('README.rdoc')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
