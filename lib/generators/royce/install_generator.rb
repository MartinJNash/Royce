require 'rails/generators'
require 'rails/generators/active_record'

module Royce
  class InstallGenerator < ::Rails::Generators::Base

    include ::Rails::Generators::Migration

    source_root File.expand_path('../templates', __FILE__)

    desc 'Generates DB migration files for Royce'
    def create_migration_file
      migration_template 'create_royce.rb', 'db/migrate/create_royce.rb'
    end

    def self.next_migration_number(dirname)
      ::ActiveRecord::Generators::Base.next_migration_number(dirname)
    end

  end
end
