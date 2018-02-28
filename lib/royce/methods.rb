# frozen_string_literal: true

module Royce
  module Methods

    # Called when module included in a class
    # includer == User
    # includer.class == Class
    def self.included(includer)
      # With instance eval, we can add instance methods
      # Add instance methods like user? admin?
      includer.instance_eval do
        # Loop through all available role names
        # and add a name? method that queries the has_role? method
        available_role_names.each do |name|
          define_method("#{name}?") do
            has_role? name
          end

          define_method("#{name}!") do
            add_role name
          end
        end
      end
    end

    # These methods are included in all User instances

    def add_role(name)
      return unless allowed_role?(name)
      return if has_role?(name)
      role = Role.find_by(name: name.to_s)
      roles << role
    end

    def remove_role(name)
      return unless allowed_role?(name)
      role = Role.find_by(name: name.to_s)
      roles.delete(role)
    end

    def has_role?(name)
      roles.where(name: name.to_s).exists?
    end

    def allowed_role?(name)
      self.class.available_role_names.include?(name.to_s)
    end

    def role_list
      roles.pluck(:name)
    end

  end
end
