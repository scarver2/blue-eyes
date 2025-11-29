# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$:.unshift lib unless $:.include?(lib)

require 'blue_eyes/version'

Gem::Specification.new do |spec|
  spec.name        = 'BlueEyes'
  spec.version     = BlueEyes::VERSION::STRING
  spec.summary     = 'A Sinatra app generator.'
  spec.description = 'BlueEyes is a Sinatra app generator with Rails-like simplicity.'
  spec.email       = 'stan@a1webconsulting.com'
  spec.homepage    = 'https://github.com/scarver2/blue-eyes'
  spec.authors     = ['Stan Carver II', 'Ben Lamb', 'Brian Emory']
  spec.licenses    = 'MIT'

  spec.executables = ['blue_eyes']

  spec.require_paths = ['lib']
  spec.required_ruby_version = '>= 1.8.6'

  spec.files =
    Dir.glob('lib/**/*', File::FNM_DOTMATCH) &
    Dir.glob('test/**/*') &
    %w[.ruby-version .simplecov Gemfile Gemfile.lock Guardfile LICENSE Rakefile README.md]

  spec.add_dependency('active_model_serializers', '~> 0.10.0.rc1')
  spec.add_dependency('activesupport', '~> 7.0')
  spec.add_dependency('thor', '~> 1.4')
  spec.metadata['rubygems_mfa_required'] = 'true'
end
