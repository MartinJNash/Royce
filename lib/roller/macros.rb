module Roller
  module Macros

    extend ActiveSupport::Concern

    module ClassMethods
      # How a class opts in to roller
      # Pass an array of roles
      def roller_roles(roles)
        confirm_roles_exist roles

        class_eval do
          has_many :roles, as: :rolleable, class_name: 'Roller::Role'

          @@available_role_names = roles
          def self.available_role_names
            @@available_role_names
          end

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
