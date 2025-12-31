# frozen_string_literal: true

require 'spec_helper'
require 'blue_eyes/generators/controller_generator'

RSpec.describe BlueEyes::Generators::ControllerGenerator, type: :generator do
  let(:controller_name) { 'posts' }
  let(:controller_path) { 'app/controllers/posts_controller.rb' }
  let(:views_path)      { 'app/views/posts' }

  before do
    run_generator described_class, [controller_name]
  end

  it 'creates a controller file' do
    expect_file controller_path
  end

  it 'defines a controller class with the correct name' do
    content = generated_file(controller_path)
    expect(content).to include('class PostsController')
  end

  it 'inherits from ApplicationController' do
    content = generated_file(controller_path)
    expect(content).to match(/<\s*ApplicationController/)
  end

  it 'creates a views directory' do
    expect(generated_file_exists?(views_path)).to be(true)
  end

  it 'creates default view templates' do
    %w[index show new edit].each do |view|
      expect_file File.join(views_path, "#{view}.html.erb")
    end
  end
end
