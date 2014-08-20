module Roller

  # The actual data model
  class Role < ::ActiveRecord::Base
    self.table_name = 'roller_role'

    has_many :connectors, class_name: 'Roller::Connector'
    has_many :roleables, through: :connectors

    def to_s
      name
    end

  end

end
