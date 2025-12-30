# frozen_string_literal: true

require 'fakefs/safe'
require 'minitest/autorun'
require 'simplecov'

if ENV['CI'] == 'true'
  require 'minitest/reporters'
  Minitest::Reporters.use!(
    Minitest::Reporters::JUnitReporter.new('tmp/test-results')
  )
end

require 'blue_eyes'
