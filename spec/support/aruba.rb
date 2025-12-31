# frozen_string_literal: true

require 'aruba/rspec'

RSpec.configure do |config|
  # Tag CLI specs with `type: :aruba`
  config.before(:each, type: :aruba) do
    # Aruba uses its own working directory; this ensures it's clean
    setup_aruba

    # Ensure we run the local executable, not a globally installed gem
    # Aruba automatically adds ./bin to PATH, but we reinforce it
    prepend_environment_variable 'PATH', File.expand_path('bin', project_root) + File::PATH_SEPARATOR

    # Prevent bundler noise from leaking into CLI output
    set_environment_variable 'BUNDLE_GEMFILE', nil
  end
end

# Helper to determine the project root from spec directory
def project_root
  @project_root ||= File.expand_path('../../..', __dir__)
end
