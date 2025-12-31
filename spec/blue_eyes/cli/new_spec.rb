# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'blue-eyes new', type: :aruba do
  let(:app_name) { 'blog' }
  let(:app_path) { File.join(expand_path('.'), app_name) }

  before do
    run_command("blue-eyes new #{app_name}")
  end

  it 'exits successfully' do
    expect(last_command_started).to have_exit_status(0)
  end

  it 'creates the application directory' do
    expect(File).to exist(app_path)
  end

  it 'creates a Gemfile' do
    expect(File).to exist(File.join(app_path, 'Gemfile'))
  end

  it 'creates a Rakefile' do
    expect(File).to exist(File.join(app_path, 'Rakefile'))
  end

  it 'creates the config directory' do
    expect(File).to exist(File.join(app_path, 'config'))
  end

  it 'creates the app directory' do
    expect(File).to exist(File.join(app_path, 'app'))
  end

  it 'prints a success message' do
    expect(last_command_started.output).to include("Created #{app_name}")
  end
end
