module Royce
  module ClassMethods
    def self.included includer
      includer_name = includer.model_name.to_s
      includer_pluralized_name = includer_name.underscore.pluralize.to_sym

      includer.class_eval do

        # Add relations to including class
        has_many :role_connectors, as: :roleable, class_name: 'Royce::Connector'
        has_many :roles, through: :role_connectors, class_name: 'Royce::Role'

        # Add class method to return all possible roles
        def self.available_roles
          Role.where(name: available_role_names)
        end

        # Add scopes to including class
        # User.admins
        # User.editors
        available_role_names.each do |role_name|
          scope role_name.pluralize, -> { Role.find_by(name: role_name).send includer_pluralized_name }
        end

      end

      # Be able to search some_role.users and get back instnaces of User
      # Royce::Role.find_by(name, 'admin').users
      Royce::Role.class_eval do
        has_many includer_pluralized_name, through: :connectors, source: :roleable, source_type: includer_name
      end

    end
  end
end
