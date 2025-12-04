# frozen_string_literal: true

require_relative '../../../test_helper'

class ModelGeneratorTest < Minitest::Test
  def subject
    BlueEyes::Generators::ModelGenerator
  end

  def test_source_root
    root_path = File.expand_path('../../../..', __dir__)
    absolute_template_path = [root_path, '/lib/blue_eyes/generators/model'].join

    assert_equal subject.source_root, absolute_template_path
  end

  def test_create_model
    skip 'broken test'
    generator = BlueEyes::Generators::ModelGenerator.new(['Post'])
    generator.create_model

    assert generator.invoked
  end

  def test_create_migrations
    skip 'broken test'
    generator = BlueEyes::Generators::ModelGenerator.new(['Post', 'title:string', 'body:text'])
    generator.create_migrations

    assert generator.invoked
  end

  def test_setup
    skip 'broken test'
    generator = BlueEyes::Generators::ModelGenerator.new(['Post', 'title:string', 'body:text'])
    generator.setup

    assert generator.invoked
  end
end
