# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'blue-eyes scaffold', type: :aruba do
  let(:resource_name) { 'post' }
  let(:plural_name)   { 'posts' }

  let(:model_path)      { File.join(expand_path('.'), 'app', 'models', 'post.rb') }
  let(:controller_path) { File.join(expand_path('.'), 'app', 'controllers', 'posts_controller.rb') }
  let(:views_path)      { File.join(expand_path('.'), 'app', 'views', plural_name) }
  let(:migration_regex) { /\d{14}_create_posts\.rb/ }

  before do
    run_command("blue-eyes scaffold #{resource_name}")
  end

  it 'exits successfully' do
    expect(last_command_started).to have_exit_status(0)
  end

  it 'creates a model file' do
    expect(File).to exist(model_path)
  end

  it 'creates a controller file' do
    expect(File).to exist(controller_path)
  end

  it 'creates a views directory' do
    expect(File).to exist(views_path)
  end

  it 'creates default view templates' do
    %w[index show new edit].each do |view|
      expect(File).to exist(File.join(views_path, "#{view}.html.erb"))
    end
  end

  it 'creates a migration file' do
    migrations = Dir[File.join(expand_path('.'), 'db', 'migrate', '*.rb')]
    expect(migrations.any? { |f| f.match?(migration_regex) }).to be(true)
  end

  it 'prints a success message' do
    expect(last_command_started.output).to include("Created scaffold #{resource_name}")
  end
end
