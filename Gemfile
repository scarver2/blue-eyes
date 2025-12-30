# frozen_string_literal: true

source 'https://rubygems.org/'

ruby File.read('.ruby-version').strip

gemspec

group :development do
  gem 'guard', '~> 2.16', require: false
  gem 'guard-bundler', github: 'scarver2/guard-bundler', branch: 'bundler-4', require: false
  gem 'guard-minitest', '~> 2.4', require: false
  gem 'guard-rubocop', '~> 1.5', require: false
  gem 'irb', '~> 1.14'
  gem 'pry', '~> 0.15', require: false
end

group :test do
  gem 'fakefs', '~> 3.0', require: false
  gem 'minitest', '~> 5.25', require: false
  gem 'simplecov', '~> 0.22', require: false
end

group :development, :test do
  gem 'rake', '~> 13.0', require: false
  gem 'rubocop', '~> 1.81', require: false
  gem 'rubocop-minitest', '~> 0.38', require: false
  gem 'rubocop-performance', '~> 1.26', require: false
  gem 'rubocop-rake', '~> 0.6', require: false
end
