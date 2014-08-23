module Royce
  module Macros

    extend ActiveSupport::Concern

    module ClassMethods
      # How a class opts in to roller
      # Pass an array of roles
      def royce_roles(roles)
        confirm_roles_exist roles

        # Work in singleton class
        # Add a read-only class variable to all who call.
        class << self
          attr_reader :available_role_names
        end
        @available_role_names = roles

        include Royce::ClassMethods
        include Royce::Methods
      end


      private

      # Create Role objects as necessary
      def confirm_roles_exist(role_names)
        puts "Make sure Royce roles exist"
        return unless ActiveRecord::Base.connection.table_exists? 'royce_role'
        role_names.each do |name|
          ptus "Create Royce role #{name}"
          Role.find_or_create_by(name: name)
        end
      end

    end
  end


  # Every ActiveRecord::Base now includes Royce::Macros
  ActiveRecord::Base.send :include, Royce::Macros

end
