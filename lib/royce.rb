# frozen_string_literal: true

require 'active_record'

module Royce
  autoload :Macros,       'royce/macros'
  autoload :Methods,      'royce/methods'
  autoload :ClassMethods, 'royce/class_methods'
  autoload :Role,         'royce/role'
  autoload :Connector,    'royce/connector'

  # Every ::ActiveRecord::Base now includes Royce::Macros
  # This gives them access to the royce_roles method
  ::ActiveRecord::Base.send(:include, Royce::Macros)
end
