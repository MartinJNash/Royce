require 'simplecov'
require 'rspec'
require 'rails'
require 'active_record'

# Start Simplecov
SimpleCov.start

# Configure RSpec
RSpec.configure do |config|
  config.color = true
  config.fail_fast = false

  config.order = :random
  Kernel.srand config.seed

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

# Load lib
require 'royce'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: ':memory:')
load File.dirname(__FILE__) + '/support/schema.rb'
require File.dirname(__FILE__) + '/support/test_models.rb'
