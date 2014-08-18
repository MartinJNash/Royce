module Roller

  # The actual data model
  class Role < ::ActiveRecord::Base
    self.table_name = 'roller_role'
    belongs_to :roleable, polymorphic: true

    def to_s
      name
    end

  end

end
