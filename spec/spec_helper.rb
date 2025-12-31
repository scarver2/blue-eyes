# frozen_string_literal: true

require 'simplecov'
SimpleCov.start do
  enable_coverage :branch
  minimum_coverage 100
  add_filter '/spec/'
  add_filter '/bin/'
end

require 'rspec'
require 'aruba/rspec'

# Load support files
Dir[File.join(__dir__, 'support', '**', '*.rb')].each { |f| require f }

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  # Aruba runs commands in a temp directory
  config.include Aruba::Api, type: :aruba

  # Custom helpers for generator specs
  config.include GeneratorHelpers, type: :generator
  config.include FileExpectations

  # Use modern syntax
  config.disable_monkey_patching!

  # Faster test output
  config.formatter = :documentation
end
