$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "royce/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "royce"
  s.version     = Royce::VERSION
  s.authors     = ["Martin Nash"]
  s.email       = ["martin.j.nash@gmail.com"]
  s.homepage    = "https://github.com/MartinJNash/Royce"
  s.summary     = "A Rails roles sollution."
  s.description = "Roles."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", ">= 4.1.4"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "minitest-rails"
  s.add_development_dependency "pry"
  s.add_development_dependency "pry-doc"
  s.add_development_dependency "pry-byebug"
end
