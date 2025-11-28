# frozen_string_literal: true

require_relative '../../test_helper'

class AppGeneratorTest < Minitest::Test
  def subject
    BlueEyes::Generators::AppGenerator
  end

  def test_source_root
    root_path = File.expand_path('../../..', __dir__)
    absolute_template_path = [root_path, '/lib/blue-eyes/generators/app/templates'].join
    assert_equal subject.source_root, absolute_template_path
  end

  def test_create_app_directory
    skip
    subject.new.create_app_directory
    assert_equal true, subject.invoked 
  end

  def test_create_app_spec
    skip
    subject.new.create_app_spec
    assert_equal true, subject.invoked
  end

  def test_create_capistrano_config
    skip
    subject.new.create_capistrano_config
    assert_equal true, subject.invoked
  end

  def test_create_config
    skip
    subject.new.create_config
    assert_equal true, subject.invoked
  end

  def test_create_database_initializer
    skip
    subject.new.create_database_initializer
    assert_equal true, subject.invoked
  end

  def test_create_database_initializer_with_attributes
    skip
    subject.new.create_database_initializer(['Post', 'title:string', 'body:text'])
    assert_equal true, subject.invoked
  end

  def test_create_db_config
    skip
    subject.new.create_db_config
    assert_equal true, subject.invoked
  end

  def test_create_empty_directories
    skip
    subject.new.create_empty_directories
    assert_equal true, subject.invoked
  end

  def test_create_empty_directories_with_attributes
    skip
    subject.new.create_empty_directories(['Post', 'title:string', 'body:text'])
    assert_equal true, subject.invoked
  end

  def test_create_gemfile
    skip
    subject.new.create_gemfile
    assert_equal true, subject.invoked
  end

  def test_create_public_directory
    skip
    subject.new.create_public_directory
    assert_equal true, subject.invoked
  end

  def test_create_rakefile
    skip
    subject.new.create_rakefile
    assert_equal true, subject.invoked
  end

  def test_create_readme
    skip
    subject.new.create_readme
    assert_equal true, subject.invoked
  end

  def test_create_redis_config
    skip
    subject.new.create_redis_config
    assert_equal true, subject.invoked
  end

  def test_create_redis_initializer
    skip
    subject.new.create_redis_initializer
    assert_equal true, subject.invoked
  end

  def test_create_rvm_gemset
    skip
    subject.new.create_rvm_gemset
    assert_equal true, subject.invoked
  end

  def test_create_spec_helper
    skip
    subject.new.create_spec_helper
    assert_equal true, subject.invoked
  end

  def test_initialize_git_repo
    skip
    subject.new.initialize_git_repo
    assert_equal true, subject.invoked
  end

  def test_install_dependencies
    skip
    subject.new.install_dependencies
    assert_equal true, subject.invoked
  end

  def test_setup
    skip
    subject.new.setup
    assert_equal true, subject.invoked
  end
end
