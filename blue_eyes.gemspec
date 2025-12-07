# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift lib unless $LOAD_PATH.include?(lib)

require 'blue_eyes/version'

Gem::Specification.new do |spec|
  spec.name        = 'blue_eyes'
  spec.version     = BlueEyes::VERSION::STRING
  spec.license     = 'MIT'
  spec.summary     = 'A Sinatra app generator.'
  spec.description = 'BlueEyes is a Sinatra app generator with Rails-like simplicity.'
  spec.authors     = ['Stan Carver II', 'Ben Lamb', 'Brian Emory']
  spec.email       = 'stan@a1webconsulting.com'
  spec.homepage    = 'https://github.com/scarver2/blue-eyes'
  spec.metadata    = {
    'rubygems_mfa_required' => 'true',
    'source_code_uri' => 'https://github.com/scarver2/blue-eyes'
  }

  spec.executables = ['blue_eyes']

  spec.require_paths = ['lib']
  spec.required_ruby_version = '>= 3.0'

  spec.files =
    Dir.glob('lib/**/*', File::FNM_DOTMATCH) &
    Dir.glob('test/**/*') &
    %w[.ruby-version .simplecov Gemfile Gemfile.lock Guardfile LICENSE Rakefile README.md]

  spec.add_dependency('active_model_serializers', '~> 0.10.15')
  spec.add_dependency('activesupport', '~> 7.0')
  spec.add_dependency('thor', '~> 1.4')
end
