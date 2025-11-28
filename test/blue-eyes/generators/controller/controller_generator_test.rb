# frozen_string_literal: true

require_relative '../../../test_helper'

class ControllerGeneratorTest < Minitest::Test
  def subject
    BlueEyes::Generators::ControllerGenerator
  end

  def test_source_root
    root_path = File.expand_path('../../../..', __dir__)
    absolute_template_path = [root_path, '/lib/blue-eyes/generators/controller'].join

    assert_equal subject.source_root, absolute_template_path
  end

  def test_create_controller
    skip 'broken test'
    generator = BlueEyes::Generators::ControllerGenerator.new(['PostsController'])
    generator.create_controller

    assert generator.invoked
  end

  def test_create_controller_with_attributes
    skip 'broken test'
    generator = BlueEyes::Generators::ControllerGenerator.new(['PostsController', 'title:string', 'body:text'])
    generator.create_controller

    assert generator.invoked
  end

  def test_create_controller_with_attributes_and_options
    skip 'broken test'
    generator = BlueEyes::Generators::ControllerGenerator.new(['PostsController', 'title:string', 'body:text'],
                                                              ['--skip-test-framework'])
    generator.create_controller

    assert generator.invoked
  end

  def test_create_views
    skip 'broken test'
    generator = BlueEyes::Generators::ControllerGenerator.new(['PostsController'])
    generator.create_views

    assert generator.invoked
  end

  def test_setup
    skip 'broken test'
    generator = BlueEyes::Generators::ControllerGenerator.new(['PostsController'])
    generator.setup

    assert generator.invoked
  end
end
