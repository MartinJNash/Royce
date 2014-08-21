module Royce
  module Macros

    extend ActiveSupport::Concern

    module ClassMethods
      # How a class opts in to roller
      # Pass an array of roles
      def roller_roles(roles)
        confirm_roles_exist roles

          # Work in singleton class
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
        role_names.each do |name|
          Role.find_or_create_by(name: name)
        end
      end
    end
  end




  # Every ActiveRecord::Base now includes Royce::Macros
  ActiveRecord::Base.send :include, Royce::Macros

end
