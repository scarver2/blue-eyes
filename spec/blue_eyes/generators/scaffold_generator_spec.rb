# frozen_string_literal: true

require 'spec_helper'
require 'blue_eyes/generators/scaffold_generator'

RSpec.describe BlueEyes::Generators::ScaffoldGenerator, type: :generator do
  let(:resource_name) { 'post' }
  let(:plural_name)   { 'posts' }

  let(:model_path)      { 'app/models/post.rb' }
  let(:controller_path) { 'app/controllers/posts_controller.rb' }
  let(:views_path)      { 'app/views/posts' }
  let(:migration_dir)   { 'db/migrate' }
  let(:migration_regex) { /\d{14}_create_posts\.rb/ }

  before do
    run_generator described_class, [resource_name]
  end

  it 'creates a model file' do
    expect_file model_path
  end

  it 'defines a model class with the correct name' do
    content = generated_file(model_path)
    expect(content).to include('class Post')
  end

  it 'creates a controller file' do
    expect_file controller_path
  end

  it 'defines a controller class with the correct name' do
    content = generated_file(controller_path)
    expect(content).to include('class PostsController')
  end

  it 'creates a views directory' do
    expect(generated_file_exists?(views_path)).to be(true)
  end

  it 'creates default view templates' do
    %w[index show new edit].each do |view|
      expect_file File.join(views_path, "#{view}.html.erb")
    end
  end

  it 'creates a migration file' do
    migrations = Dir[File.join(generator_destination, migration_dir, '*.rb')]
    expect(migrations.any? { |f| f.match?(migration_regex) }).to be(true)
  end
end
