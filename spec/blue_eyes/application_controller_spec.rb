# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'blue-eyes controller', type: :aruba do
  let(:controller_name) { 'posts' }
  let(:controller_path) { File.join(expand_path('.'), 'app', 'controllers', 'posts_controller.rb') }
  let(:views_path)      { File.join(expand_path('.'), 'app', 'views', 'posts') }

  before do
    run_command("blue-eyes controller #{controller_name}")
  end

  it 'exits successfully' do
    expect(last_command_started).to have_exit_status(0)
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

  it 'prints a success message' do
    expect(last_command_started.output).to include("Created controller #{controller_name}")
  end
end
