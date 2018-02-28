# frozen_string_literal: true

module Royce
  # Connects many roleables and roles
  class Connector < ::ActiveRecord::Base
    self.table_name = 'royce_connector'
    belongs_to :roleable, polymorphic: true
    belongs_to :role, class_name: 'Royce::Role'
  end
end
