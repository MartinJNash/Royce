module Roller

  # Connects many roleables and roles
  class Connector < ::ActiveRecord::Base
    self.table_name = 'roller_connector'
    belongs_to :roleable, polymorphic: true
    belongs_to :role, class_name: 'Roller::Role'
  end
end
