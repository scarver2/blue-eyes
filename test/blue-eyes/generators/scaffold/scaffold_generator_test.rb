# frozen_string_literal: true

require_relative '../../../test_helper'

class ScaffoldGeneratorTest < Minitest::Test
  def subject
    BlueEyes::Generators::ScaffoldGenerator
  end

  def test_create_model
    skip
    assert_respond_to subject, :create_model
  end

  def test_create_controller
    skip
    assert_respond_to subject, :create_controller
  end
end
