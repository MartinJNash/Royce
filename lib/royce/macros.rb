module Royce
  module Macros

    extend ActiveSupport::Concern

    module ClassMethods
      # How a class opts in to roller
      # Pass an array of roles
      def royce_roles(roles)
        role_strings = roles.map(&:to_s)

        confirm_roles_exist role_strings

        # Work in singleton class
        # Add a read-only class variable to all classes that call `royce_roles`
        class << self
          attr_reader :available_role_names
        end
        @available_role_names = role_strings

        include Royce::ClassMethods
        include Royce::Methods
      end


      private

      # Pre-create Role objects when file is loaded
      def confirm_roles_exist(role_names)
        # return if not connected to DB (assets precompile)
        return unless ActiveRecord::Base.connected?
        # Wait until the actual tables exist
        return unless ActiveRecord::Base.connection.send(check_method, 'royce_role')
        role_names.each do |name|
          Role.find_or_create_by(name: name)
        end
      end

      def check_method
        if Rails::VERSION::MAJOR == 4
          :table_exists?
        else
          :data_source_exists?
        end
      end

    end
  end


  # Every ActiveRecord::Base now includes Royce::Macros
  # This gives them access to the royce_roles method
  ActiveRecord::Base.send :include, Royce::Macros

end
