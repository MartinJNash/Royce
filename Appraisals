# frozen_string_literal: true

RAILS_VERSIONS = %w[
  4.2.10
  5.0.7
  5.1.6
  5.2.0
].freeze

RAILS_VERSIONS.each do |version|
  appraise "rails_#{version}" do
    gem 'rails', version
  end
end
