# frozen_string_literal: true

require_relative '../test_helper'
# require 'blue-eyes/version'

class VersionTest < Minitest::Test
  def test_major_version
    assert_kind_of Integer, BlueEyes::VERSION::MAJOR
  end

  def test_minor_version
    assert_kind_of Integer, BlueEyes::VERSION::MINOR
  end

  def test_tiny_version
    assert_kind_of Integer, BlueEyes::VERSION::TINY
  end

  def test_version_string
    assert_kind_of String, BlueEyes::VERSION::STRING
    assert_equal BlueEyes::VERSION::STRING,
                 [BlueEyes::VERSION::MAJOR, BlueEyes::VERSION::MINOR, BlueEyes::VERSION::TINY].join('.')
  end
end
