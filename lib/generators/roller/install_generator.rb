require 'rails/generators'
require 'rails/generators/active_record'

module Roller
  class InstallGenerator < ::Rails::Generators::Base

    include ::Rails::Generators::Migration

    source_root File.expand_path('../templates', __FILE__)

    desc 'Generates a migration'

    def create_migration_file
      migration_template 'create_roller.rb', 'db/migrate/create_roller.rb'
    end

    def self.next_migration_number(dirname)
      ::ActiveRecord::Generators::Base.next_migration_number(dirname)
    end

  end
end
