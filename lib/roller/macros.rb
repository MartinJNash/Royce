module Roller
  module Macros

    extend ActiveSupport::Concern

    included do
      # things to do when a class includes this module
    end

    module ClassMethods
      # How a class opts in to roller
      # Pass an array of roles
      def roller_roles(roles)
        confirm_roles_exist roles
        class_eval do
          @@available_roles = roles
          has_many :roles, as: :rolleable, class_name: 'Roller::Role'
          include Roller::Methods
        end
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

  # Every ActiveRecord::Base now includes Roller::Macros
  ActiveRecord::Base.send :include, Roller::Macros

end
