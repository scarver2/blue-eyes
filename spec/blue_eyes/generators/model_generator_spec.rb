# frozen_string_literal: true

require 'spec_helper'
require 'blue_eyes/generators/model_generator'

RSpec.describe BlueEyes::Generators::ModelGenerator, type: :generator do
  let(:model_name) { 'post' }
  let(:model_path) { 'app/models/post.rb' }
  let(:migration_dir) { 'db/migrate' }
  let(:migration_regex) { /\d{14}_create_posts\.rb/ }

  before do
    run_generator described_class, [model_name]
  end

  it 'creates a model file' do
    expect_file model_path
  end

  it 'creates a migration file' do
    migrations = Dir[File.join(generator_destination, migration_dir, '*.rb')]
    expect(migrations.any? { |f| f.match?(migration_regex) }).to be(true)
  end

  it 'defines a Ruby class with the correct name' do
    content = generated_file(model_path)
    expect(content).to include('class Post')
  end

  it 'inherits from ApplicationRecord or similar base' do
    content = generated_file(model_path)
    expect(content).to match(/<\s*ApplicationRecord/)
  end
end
