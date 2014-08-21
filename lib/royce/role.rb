module Royce

  # The actual data model
  class Role < ::ActiveRecord::Base
    self.table_name = 'royce_role'

    has_many :connectors, class_name: 'Royce::Connector'

    def to_s
      name
    end

  end

end
