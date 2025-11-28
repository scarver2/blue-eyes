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
    skip 'broken test'
    subject.new.create_app_directory

    assert subject.invoked
  end

  def test_create_app_spec
    skip 'broken test'
    subject.new.create_app_spec

    assert subject.invoked
  end

  def test_create_capistrano_config
    skip 'broken test'
    subject.new.create_capistrano_config

    assert subject.invoked
  end

  def test_create_config
    skip 'broken test'
    subject.new.create_config

    assert subject.invoked
  end

  def test_create_database_initializer
    skip 'broken test'
    subject.new.create_database_initializer(['Post', 'title:string', 'body:text'])

    assert subject.invoked
  end

  def test_create_db_config
    skip 'broken test'
    subject.new.create_db_config

    assert subject.invoked
  end

  def test_create_empty_directories
    skip 'broken test'
    subject.new.create_empty_directories(['Post', 'title:string', 'body:text'])

    assert subject.invoked
  end

  def test_create_gemfile
    skip 'broken test'
    subject.new.create_gemfile

    assert subject.invoked
  end

  def test_create_public_directory
    skip 'broken test'
    subject.new.create_public_directory

    assert subject.invoked
  end

  def test_create_rakefile
    skip 'broken test'
    subject.new.create_rakefile

    assert subject.invoked
  end

  def test_create_readme
    skip 'broken test'
    subject.new.create_readme

    assert subject.invoked
  end

  def test_create_redis_config
    skip 'broken test'
    subject.new.create_redis_config

    assert subject.invoked
  end

  def test_create_redis_initializer
    skip 'broken test'
    subject.new.create_redis_initializer

    assert subject.invoked
  end

  def test_create_rvm_gemset
    skip 'broken test'
    subject.new.create_rvm_gemset

    assert subject.invoked
  end

  def test_create_spec_helper
    skip 'broken test'
    subject.new.create_spec_helper

    assert subject.invoked
  end

  def test_initialize_git_repo
    skip 'broken test'
    subject.new.initialize_git_repo

    assert subject.invoked
  end

  def test_install_dependencies
    skip 'broken test'
    subject.new.install_dependencies

    assert subject.invoked
  end

  def test_setup
    skip 'broken test'
    subject.new.setup

    assert subject.invoked
  end
end
