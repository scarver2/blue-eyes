# frozen_string_literal: true

source 'https://rubygems.org/'

ruby File.read('.ruby-version').strip

gemspec

group :development, :test do
  gem 'fakefs', '~> 3.0'
  gem 'guard', '~> 2.16'
  gem 'guard-bundler', github: 'scarver2/guard-bundler', branch: 'bundler-4', require: false
  gem 'guard-minitest', '~> 2.4'
  gem 'guard-rubocop', '~> 1.5'
  gem 'irb', '~> 1.14'
  gem 'minitest', '~> 5.25'
  gem 'pry', '~> 0.15'
  gem 'rake', '~> 13.0'
  gem 'rubocop', '~> 1.81'
  gem 'rubocop-minitest', '~> 0.38'
  gem 'rubocop-performance', '~> 1.26'
  gem 'rubocop-rake', '~> 0.6'
  gem 'simplecov', '~> 0.22'
end

group :test do
  gem 'minitest-reporters'
end
