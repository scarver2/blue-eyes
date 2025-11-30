# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$:.unshift lib unless $:.include?(lib)

require 'blue-eyes/version'

Gem::Specification.new do |spec|
  spec.name        = 'blue-eyes'
  spec.version     = BlueEyes::VERSION::STRING
  spec.license     = 'MIT'
  spec.summary     = 'A Sinatra app generator.'
  spec.description = 'BlueEyes is a Sinatra app generator with Rails-like simplicity.'
  spec.authors     = ['Stan Carver II', 'Ben Lamb', 'Brian Emory']
  spec.email       = 'stan@a1webconsulting.com'
  spec.homepage    = 'https://github.com/scarver2/blue-eyes'
  spec.metadata    = {
    'source_code_uri' => 'https://github.com/scarver2/blue-eyes'
  }

  spec.executables = ['blue-eyes']

  spec.require_paths = ['lib']
  spec.required_ruby_version = '>= 1.8.6'

  spec.files =
    Dir.glob('lib/**/*', File::FNM_DOTMATCH) &
    Dir.glob('test/**/*') &
    %w[.ruby-version .simplecov Gemfile Gemfile.lock Guardfile LICENSE Rakefile README.md]

  spec.add_runtime_dependency('thor', '~> 1.4')
  spec.add_runtime_dependency('activesupport', '~> 7.0')
  spec.add_runtime_dependency('active_model_serializers', '~> 0.10.15')
end
