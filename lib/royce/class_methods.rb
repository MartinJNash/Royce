module Royce
  module ClassMethods
    def self.included includer
      includer.class_eval do

        # Work on class

        has_many :role_connectors, as: :roleable, class_name: 'Royce::Connector'
        has_many :roles, through: :role_connectors, class_name: 'Royce::Role'

        def self.available_roles
          self.available_role_names.map{ |name| Role.find_or_create_by(name: name) }
        end


        # User.admins
        # User.editors
        available_role_names.each do |role_name|
          includer_class_name = includer.model_name.to_s.underscore.pluralize
          scope role_name.pluralize, -> { Role.find_by(name: role_name).send includer_class_name.to_sym }
        end

      end

      # Be able to search Role.users
      Royce::Role.class_eval do
        has_many includer.model_name.to_s.underscore.pluralize.to_sym, through: :connectors, source: :roleable, source_type: includer.model_name.to_s
      end

    end
  end
end
