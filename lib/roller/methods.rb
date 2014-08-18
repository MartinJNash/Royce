module Roller
  module Methods

    def self.included includer

      includer.class_eval do
        def self.available_roles
          self.available_role_names.map{ |name| Role.find_by(name: name) }
        end
      end

      includer.instance_eval do
        # Add instance methods like user? admin?
        available_role_names.each do |name|
          define_method("#{name}?") do
            has_role? name
          end
        end

      end
    end

    def add_role name
      if allowed_role? name
        role = Role.find_by(name: name.to_s)
        roles << role
      end
    end

    def remove_role name
      role = Role.find_by(name: name.to_s)
      roles.delete role
    end

    def has_role? name
      roles.map(&:name).include?(name.to_s)
    end

    def allowed_role? name
      self.class.available_role_names.include? name.to_s
    end

  end
end
