# frozen_string_literal: true

require_relative '../test_helper'

class CLITest < Minitest::Test
  def subject
    BlueEyes::CLI
  end

  def test_version
    expected_response = "BlueEyes #{BlueEyes::VERSION::STRING}"
    assert_output(/#{expected_response}/) do
      subject.new.version
    end
  end

  def test_exit_on_failure
    assert subject.exit_on_failure
  end
end
