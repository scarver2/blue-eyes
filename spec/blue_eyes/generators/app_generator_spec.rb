# frozen_string_literal: true

require 'spec_helper'
require 'blue_eyes/generators/app_generator'

RSpec.describe BlueEyes::Generators::AppGenerator, type: :generator do
  let(:app_name) { 'blog' }

  before do
    run_generator described_class, [app_name]
  end

  it 'creates the application directory' do
    expect(generated_file_exists?("#{app_name}/Gemfile")).to be(true)
  end

  it 'creates a Gemfile' do
    expect_file File.join(app_name, 'Gemfile')
  end

  it 'creates a Rakefile' do
    expect_file File.join(app_name, 'Rakefile')
  end

  it 'creates config directory' do
    expect_file File.join(app_name, 'config', 'routes.rb')
  end

  it 'creates app directory' do
    expect_file File.join(app_name, 'app', 'controllers', 'application_controller.rb')
  end

  it 'creates db directory' do
    expect_file File.join(app_name, 'db', 'migrate')
  end

  it 'creates public directory' do
    expect_file File.join(app_name, 'public')
  end
end
