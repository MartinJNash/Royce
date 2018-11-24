# frozen_string_literal: true

module Royce
  module Macros

    extend ActiveSupport::Concern

    module ClassMethods
      # How a class opts in to roller
      # Pass an array of roles
      def royce_roles(roles)
        role_strings = roles.map(&:to_s)

        # Work in singleton class
        # Add a read-only class variable to all classes that call `royce_roles`
        class << self
          attr_reader :available_role_names
        end
        @available_role_names = role_strings

        include Royce::ClassMethods
        include Royce::Methods
        include Royce::Schema
      end

    end
  end
end
