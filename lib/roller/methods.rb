module Roller
  module Methods

    def add_role name
      role = Role.find_by(name: name.to_s)
      roles << role
    end

    def remove_role name
      role = Role.find_by(name: name.to_s)
      roles.delete role
    end

    def has_role? name
      roles.map(&:name).include?(name)
    end

  end
end
