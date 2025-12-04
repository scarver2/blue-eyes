#!/bin/bash

# This script confirms BlueEyes produces a working application

# Clean up previously generated app
rm -rf app

# Build the gem
gem build blue-eyes.gemspec

# Create a new app
bundle exec bin/blue-eyes new App

# Add local BlueEyes gem to the app
echo "\n\ngem 'blue-eyes', path: '..'" >> app/Gemfile

cd app

# Install gem dependencies
bundle install

# Run generators
bundle exec blue-eyes scaffold Post title body:text
# TODO: bundle exec blue-eyes controller Home
# TODO: bundle exec blue-eyes model User username:string email password
# TODO: bundle exec blue-eyes migration AddUserToPosts user:references

# Run pending migrations for development and test environments
bundle exec rake db:migrate
SINATRA_ENV=test bundle exec rake db:migrate

# Run app linter
bundle exec rubocop

# Run app specs
bundle exec rspec

# Run web server (enable as needed)
# bundle exec rackup

# TODO: replace rackup with Guardfile and/or Foreman

# TODO: open browser to http://localhost:9292
# open http://localhost:9292
